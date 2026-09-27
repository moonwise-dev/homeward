import 'dart:convert';

import '../agent/turn/create_interaction.dart';
import '../gemini/interaction_event.dart';
import '../gemini/interaction_input.dart';
import '../gemini/interaction_request.dart';
import 'researcher.dart';

final class GeminiResearcher implements Researcher {
  const GeminiResearcher({
    required this.createInteraction,
    required this.apiKey,
    this.thinkingLevel,
    this.cancellation,
  });

  final CreateInteraction createInteraction;
  final String apiKey;
  final String? thinkingLevel;
  final Future<void>? cancellation;

  @override
  Future<Map<String, Object?>> answer({
    required String instruction,
    required String question,
    required Map<String, Object?> schema,
  }) async {
    final reply = StringBuffer();
    await for (final event in createInteraction(
      apiKey: apiKey,
      request: InteractionRequest(
        input: InteractionInput.text(question),
        systemInstruction: instruction,
        thinkingLevel: thinkingLevel,
        responseSchema: schema,
      ),
      canFallBack: () => true,
      cancellation: cancellation,
    )) {
      switch (event) {
        case TextDelta(:final text):
          reply.write(text);
        case ModelFailed():
          reply.clear();
        default:
      }
    }
    return jsonDecode(reply.toString()) as Map<String, Object?>;
  }
}
