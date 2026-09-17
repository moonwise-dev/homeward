import 'dart:async';

import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_request.dart';

typedef ScriptedRound = Stream<InteractionEvent> Function();

final class ScriptedInteractions {
  ScriptedInteractions(List<ScriptedRound> rounds) : _rounds = [...rounds];

  final List<ScriptedRound> _rounds;
  final requests = <InteractionRequest>[];

  Stream<InteractionEvent> call({
    required String apiKey,
    required InteractionRequest request,
  }) {
    requests.add(request);
    return _rounds.removeAt(0)();
  }
}

ScriptedRound reply(
  String interactionId, {
  String text = '',
  List<FunctionCall> calls = const [],
}) =>
    () => Stream.fromIterable([
      InteractionEvent.created(
        interactionId: interactionId,
        model: 'gemini-3.5-flash',
      ),
      for (var start = 0; start < text.length; start += 7)
        InteractionEvent.textDelta(
          text.substring(start, (start + 7).clamp(0, text.length)),
        ),
      ...calls,
      InteractionEvent.completed(
        interactionId: interactionId,
        status: calls.isEmpty ? 'completed' : 'requires_action',
      ),
    ]);

ScriptedRound failing(Object error) =>
    () => Stream.error(error);
