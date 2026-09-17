import '../../gemini/interaction_event.dart';
import '../../gemini/interaction_request.dart';

typedef CreateInteraction = Stream<InteractionEvent> Function({
  required String apiKey,
  required InteractionRequest request,
  Future<void>? cancellation,
});
