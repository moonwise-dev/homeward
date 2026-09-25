import 'package:common/common.dart';
import 'package:homeward_server/agent/turn/turn_event.dart';
import 'package:homeward_server/agent/turn/turn_input.dart';
import 'package:homeward_tool/probe/gemini_keys.dart';
import 'package:homeward_tool/probe/probe_surfaces.dart';

import 'eval_case.dart';
import 'eval_server.dart';
import 'simulated_buyer.dart';
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
    required GeminiKeys keys,
  }) async {
    final session = await server.sessions.create('eval');
    final surfaces = ProbeSurfaces();
    final buyer = SimulatedBuyer(
      evalCase.buyer,
      photo: server.markets.samples.photo,
    );
    final observations = <TurnObservation>[];
    Future<void> run(TurnInput input, int caseTurn) async {
      if (observations.isNotEmpty) {
        await Future<void>.delayed(betweenTurns);
      }
      observations.add(
        await _runTurn(
          index: observations.length + 1,
          caseTurn: caseTurn,
          sessionId: session.id,
          input: input,
          keys: keys,
          surfaces: surfaces,
        ),
      );
    }

    for (final (index, turn) in evalCase.turns.indexed) {
      if (turn.input is EvalAnswers) {
        for (var asked = 0; asked < EvalAnswers.maxQuestions; asked++) {
          final latest = surfaces.latest;
          if (latest == null || surfaces.offers('commit_story', latest)) {
            break;
          }
          final answer = buyer.answer(latest);
          if (answer == null) {
            observations.add(
              _unoffered(observations.length + 1, turn.input, caseTurn: index),
            );
            return observations;
          }
          await run(
            TurnInput.action(answer.action, surfaceData: answer.surfaceData),
            index,
          );
        }
        continue;
      }
      final input = _inputFor(turn.input, surfaces);
      if (input == null) {
        observations.add(
          _unoffered(observations.length + 1, turn.input, caseTurn: index),
        );
        break;
      }
      await run(input, index);
    }
    return observations;
  }

  Future<TurnObservation> _runTurn({
    required int index,
    required int caseTurn,
    required String sessionId,
    required TurnInput input,
    required GeminiKeys keys,
    required ProbeSurfaces surfaces,
  }) async {
    final observed = await _runTurnOn(
      keys.current,
      index: index,
      caseTurn: caseTurn,
      sessionId: sessionId,
      input: input,
      surfaces: surfaces,
    );
    return keys.moveOnAfter(observed.errorCode)
        ? _runTurn(
            index: index,
            caseTurn: caseTurn,
            sessionId: sessionId,
            input: input,
            keys: keys,
            surfaces: surfaces,
          )
        : observed;
  }

  Future<TurnObservation> _runTurnOn(
    String apiKey, {
    required int index,
    required int caseTurn,
    required String sessionId,
    required TurnInput input,
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
        case TurnText() || TurnWorking() || TurnProgress() || TurnCanceled():
      }
    }
    clock.stop();
    final plan = (await server.sessions.find(sessionId))!.plan;
    return TurnObservation(
      index: index,
      caseTurn: caseTurn,
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

  TurnObservation _unoffered(
    int index,
    EvalInput input, {
    required int caseTurn,
  }) => TurnObservation(
    index: index,
    caseTurn: caseTurn,
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
      EvalAnswers() => 'no question card to answer',
    },
  );

  TurnInput? _inputFor(EvalInput input, ProbeSurfaces surfaces) =>
      switch (input) {
        EvalText(:final text, :final reason) => TurnInput.text(
          text,
          reason: reason,
        ),
        EvalAction(:final name, :final overrides, :final tapped) =>
          switch (surfaces.actionFor(name, overrides, tapped: tapped)) {
            (:final action, :final surfaceData) => TurnInput.action(
              action,
              surfaceData: surfaceData,
            ),
            null => null,
          },
        EvalAnswers() => null,
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
