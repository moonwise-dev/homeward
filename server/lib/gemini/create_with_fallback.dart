import 'gemini_exception.dart';
import 'interaction_event.dart';
import 'interaction_request.dart';
import 'interactions_client.dart';
import 'model_caps.dart';
import 'model_circuits.dart';

Stream<InteractionEvent> createWithFallback({
  required InteractionsClient client,
  required ModelCircuits circuits,
  required ModelCaps caps,
  required String apiKey,
  required InteractionRequest request,
  required bool Function() canFallBack,
  Future<void>? cancellation,
}) async* {
  final healthy = circuits.candidates;
  final cooling = [
    for (final model in circuits.cooling)
      if (!healthy.contains(model)) model,
  ];
  final models = [...healthy, ...cooling];
  final ready = [
    for (final model in models)
      if (!caps.isCapped(apiKey, model)) model,
  ];
  final candidates = ready.isEmpty ? healthy : ready;
  var retriedOverload = false;
  for (final (attempt, model) in candidates.indexed) {
    try {
      await for (final event in client.create(
        apiKey: apiKey,
        model: model,
        request: request,
        cancellation: cancellation,
      )) {
        yield event;
      }
      return;
    } on GeminiException catch (reason) {
      switch (reason) {
        case GeminiUnavailable():
          circuits.open(model);
        case GeminiQuotaExhausted(perModel: true):
          caps.cap(apiKey, model, reason);
        case _:
          rethrow;
      }
      final overloaded = reason is GeminiUnavailable;
      final next = candidates.elementAtOrNull(attempt + 1);
      if (next == null ||
          !canFallBack() ||
          (overloaded && (retriedOverload || cooling.contains(next)))) {
        if (overloaded) {
          for (final other in models) {
            if (caps.refusalOf(apiKey, other) case final refusal?) {
              throw refusal;
            }
          }
        }
        rethrow;
      }
      retriedOverload = retriedOverload || overloaded;
      yield InteractionEvent.modelFailed(model: model, reason: reason);
    }
  }
}
