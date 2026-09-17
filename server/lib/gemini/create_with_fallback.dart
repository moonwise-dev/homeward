import 'gemini_exception.dart';
import 'interaction_event.dart';
import 'interaction_request.dart';
import 'interactions_client.dart';
import 'model_circuits.dart';

Stream<InteractionEvent> createWithFallback({
  required InteractionsClient client,
  required ModelCircuits circuits,
  required String apiKey,
  required InteractionRequest request,
  required bool Function() canFallBack,
  Future<void>? cancellation,
}) async* {
  final candidates = circuits.healthyModels.take(2).toList();
  if (candidates.isEmpty) {
    throw const GeminiUnavailable('Every model is cooling down');
  }
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
    } on GeminiUnavailable catch (reason) {
      circuits.open(model);
      if (attempt == candidates.length - 1 || !canFallBack()) {
        rethrow;
      }
      yield InteractionEvent.modelFailed(model: model, reason: reason);
    }
  }
}
