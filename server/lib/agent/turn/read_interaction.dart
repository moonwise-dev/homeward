import '../../gemini/stored_interaction.dart';

typedef ReadInteraction = Future<StoredInteraction> Function({
  required String apiKey,
  required String interactionId,
});
