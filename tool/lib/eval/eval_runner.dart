import 'package:common/common.dart';
import 'package:homeward_server/agent/turn/turn_event.dart';
import 'package:homeward_server/agent/turn/turn_input.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';

import 'eval_case.dart';
import 'eval_server.dart';
import 'turn_log.dart';
import 'turn_observation.dart';

final class EvalRunner {
  EvalRunner(this.server, this.log, {this.betweenTurns = _betweenTurns});

  static const _betweenTurns = Duration(seconds: 12);

  final EvalServer server;
  final TurnLog log;
  final Duration betweenTurns;

  Future<List<TurnObservation>> run(
    EvalCase evalCase, {
    required String apiKey,
  }) async {
    final session = await server.sessions.create('eval');
    final surfaces = ProbeSurfaces();
    final observations = <TurnObservation>[];
    for (final (index, turn) in evalCase.turns.indexed) {
      if (index > 0) {
        await Future<void>.delayed(betweenTurns);
      }
      final input = _inputFor(turn.input, surfaces);
      if (input == null) {
        observations.add(_unoffered(index + 1, turn.input));
        break;
      }
      observations.add(
        await _runTurn(
          index: index + 1,
          sessionId: session.id,
          input: input,
          apiKey: apiKey,
          surfaces: surfaces,
        ),
      );
    }
    return observations;
  }

  Future<TurnObservation> _runTurn({
    required int index,
    required String sessionId,
    required TurnInput input,
    required String apiKey,
    required ProbeSurfaces surfaces,
  }) async {
    log.reset();
    final clock = Stopwatch()..start();
    final messages = <Map<String, Object?>>[];
    var text = '';
    String? errorCode;
    await for (final event in server.orchestrator.run(
      sessionId: sessionId,
      uid: 'eval',
      input: input,
      apiKey: apiKey,
    )) {
      switch (event) {
        case TurnMessage(:final message):
          messages.add(message);
          surfaces.record(message);
        case TurnCompleted(text: final completed):
          text = completed;
        case TurnFailed(:final failure):
          errorCode = failure.code.wireName;
        case TurnText() || TurnWorking() || TurnCanceled():
      }
    }
    clock.stop();
    final plan = (await server.sessions.find(sessionId))!.plan;
    return TurnObservation(
      index: index,
      messages: messages,
      text: text,
      toolsCalled: log.toolsCalled,
      toolsRun: log.toolsRun,
      rejections: log.rejections,
      failure: log.failures.firstOrNull,
      modelRounds: log.modelRounds,
      corrections: log.corrections,
      elapsed: clock.elapsed,
      marketId: plan.marketId?.code,
      coverage: switch (plan.marketId) {
        final id? => server.markets.coverageOf(id).name,
        null => null,
      },
      bindingConstraint: _bindingOf(plan),
      errorCode: errorCode,
    );
  }

  TurnObservation _unoffered(int index, EvalInput input) => TurnObservation(
    index: index,
    messages: const [],
    text: '',
    toolsCalled: const [],
    toolsRun: const {},
    rejections: const [],
    modelRounds: 0,
    corrections: 0,
    elapsed: Duration.zero,
    marketId: null,
    coverage: null,
    bindingConstraint: null,
    errorCode: switch (input) {
      EvalText() => 'no turn ran',
      EvalAction(:final name) => 'no surface offers $name',
    },
  );

  TurnInput? _inputFor(EvalInput input, ProbeSurfaces surfaces) =>
      switch (input) {
        EvalText(:final text) => TurnInput.text(text),
        EvalAction(:final name, :final overrides) => switch (surfaces.actionFor(
          name,
          overrides,
        )) {
          (:final action, :final surfaceData) => TurnInput.action(
            action,
            surfaceData: surfaceData,
          ),
          null => null,
        },
      };

  String? _bindingOf(Plan plan) {
    final marketId = plan.marketId;
    final scenario = plan.scenario;
    if (marketId == null || scenario == null) {
      return null;
    }
    final market = server.markets.resolveFor(marketId, plan.profile);
    if (market == null) {
      return null;
    }
    return switch (assessAffordability(
      scenario: scenario,
      market: market,
      profile: plan.profile,
    )) {
      AssessedAffordability(:final binding?) => binding.kind.name,
      _ => null,
    };
  }
}
