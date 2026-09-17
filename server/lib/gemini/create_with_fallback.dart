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
  final candidates = caps
      .uncapped(apiKey, circuits.candidates)
      .take(2)
      .toList();
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
        case GeminiQuotaExhausted(perModel: true, :final resetsAt):
          caps.cap(apiKey, model, until: resetsAt);
        case _:
          rethrow;
      }
      if (attempt == candidates.length - 1 || !canFallBack()) {
        rethrow;
      }
      yield InteractionEvent.modelFailed(model: model, reason: reason);
    }
  }
}
