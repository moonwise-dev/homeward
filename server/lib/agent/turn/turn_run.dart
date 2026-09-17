import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../../data/models/session.dart';
import '../../gemini/gemini_exception.dart';
import '../../gemini/interaction_cancelled.dart';
import '../../gemini/interaction_event.dart';
import '../../gemini/interaction_input.dart';
import '../../gemini/interaction_request.dart';
import '../../logging/log_entry.dart';
import '../parsed_output.dart';
import '../prompt/prompt_assembler.dart';
import '../prompt/turn_context.dart';
import '../stream_parser.dart';
import '../validation/turn_validator.dart';
import '../validation/validation_failure.dart';
import '../validation/validation_outcome.dart';
import 'correction_input.dart';
import 'replay_shadow.dart';
import 'create_interaction.dart';
import 'retry_surface.dart';
import 'surface_seeder.dart';
import 'tool_belt.dart';
import 'turn_event.dart';
import '../../errors/homeward_failure.dart';
import 'turn_seeds.dart';
import 'turn_settings.dart';

final _log = Logger('turn');

final class TurnRun {
  TurnRun({
    required Session session,
    required this.createInteraction,
    required this.prompts,
    required this.tools,
    required CatalogValidator catalog,
    required this.settings,
    required this.now,
  }) : turn = session.turnCount + 1,
       _session = session,
       _plan = session.plan,
       _interactionId = session.lastInteractionId,
       _validator = TurnValidator(
         turn: session.turnCount + 1,
         catalog: catalog,
         shadow: replayShadow(session.messages),
         seeds: const {},
       );

  final int turn;
  final CreateInteraction createInteraction;
  final PromptAssembler prompts;
  final ToolBelt tools;
  final TurnSettings settings;
  final DateTime Function() now;
  final Session _session;
  final TurnValidator _validator;
  final _seeder = SurfaceSeeder();
  final _forwarded = <Map<String, Object?>>[];
  final _calledSeeds = <Map<String, Object?>>[];
  final _pendingFailures = <ValidationFailure>[];
  final _text = StringBuffer();
  Plan _plan;
  String? _interactionId;
  var _emittedText = '';
  var _separateRound = false;
  var _rounds = 0;

  Session get session => _session.copyWith(
    plan: _plan,
    turnCount: turn,
    lastInteractionId: _interactionId,
    messages: [..._session.messages, ..._forwarded],
  );

  Stream<TurnEvent> execute({
    required String text,
    required String apiKey,
    Future<void>? cancellation,
  }) async* {
    InteractionInput input = InteractionInput.text(text);
    var toolRounds = 0;
    var corrections = 0;
    var mayRebuildHistory = _interactionId != null;
    while (true) {
      final calls = <FunctionCall>[];
      final parser = StreamParser();
      _separateRound = _text.isNotEmpty;
      _rounds++;
      try {
        await for (final event in createInteraction(
          apiKey: apiKey,
          request: _request(input),
          cancellation: cancellation,
        )) {
          switch (event) {
            case TextDelta(:final text):
              for (final output in parser.add(text)) {
                yield* _emit(output);
              }
            case FunctionCall():
              calls.add(event);
            case InteractionCompleted(:final interactionId):
              _interactionId = interactionId;
            case ModelFailed(:final model, :final reason):
              _log.warning(
                LogEntry(
                  'Model $model failed; falling back',
                  fields: {'model': model, 'reason': reason.message},
                ),
              );
            case InteractionCreated():
          }
        }
      } on InteractionCancelled {
        return;
      } on GeminiHistoryMissing {
        if (mayRebuildHistory) {
          mayRebuildHistory = false;
          _interactionId = null;
          continue;
        }
        yield const TurnEvent.failed(HomewardFailure.internal);
        return;
      } on GeminiException catch (error) {
        yield TurnEvent.failed(HomewardFailure.fromGemini(error, now()));
        return;
      }
      mayRebuildHistory = false;
      for (final output in parser.close()) {
        yield* _emit(output);
      }
      if (calls.isNotEmpty && toolRounds < settings.maxToolRounds) {
        toolRounds++;
        input = InteractionInput.functionResults([
          for (final call in calls) _runCall(call),
        ]);
        continue;
      }
      if (_pendingFailures.isNotEmpty) {
        if (corrections < settings.maxCorrections) {
          corrections++;
          input = InteractionInput.text(correctionInput(_pendingFailures));
          _pendingFailures.clear();
          continue;
        }
        for (final message in retrySurface(turn)) {
          _forwarded.add(message);
          yield TurnEvent.message(message);
        }
      }
      _log.info(
        LogEntry(
          'Turn $turn completed',
          fields: {
            'turn': turn,
            'modelRounds': _rounds,
            'toolRounds': toolRounds,
            'corrections': corrections,
            'surfaces': _validator.surfacesCreated.length,
          },
        ),
      );
      yield TurnEvent.completed(_text.toString().trim());
      return;
    }
  }

  InteractionRequest _request(InteractionInput input) {
    final settled = tools.runSettled(_plan);
    _validator.seeds = turnSeeds(_plan, [
      ..._calledSeeds,
      for (final result in settled.values) result.seeds,
    ]);
    return InteractionRequest(
      input: input,
      systemInstruction: prompts.systemInstruction(
        turnContext(
          turn: turn,
          plan: _plan,
          markets: tools.markets,
          surfacesUsed: {
            ..._surfaceIds(_session.messages),
            ..._validator.surfacesCreated,
          },
          preRun: {
            for (final MapEntry(key: name, value: result) in settled.entries)
              name: result.modelResult,
          },
        ),
      ),
      tools: tools.declarationsFor(_plan),
      thinkingLevel: settings.thinkingLevel,
      previousInteractionId: _interactionId,
    );
  }

  Stream<TurnEvent> _emit(ParsedOutput output) async* {
    switch (output) {
      case ProseOutput(:final text):
        if (_separateRound && text.trim().isNotEmpty) {
          _text.write('\n\n');
          _separateRound = false;
        }
        _text.write(text);
        final visible = _text.toString().trim();
        if (visible != _emittedText) {
          _emittedText = visible;
          yield TurnEvent.text(visible);
        }
      case A2uiLineOutput(:final line):
        switch (_validator.validate(line)) {
          case Accepted(:final message):
            for (final json in _seeder.forward(message, _validator.seeds)) {
              _forwarded.add(json);
              yield TurnEvent.message(json);
            }
          case Rejected(:final failure):
            _log.info(
              LogEntry(
                'A2UI message rejected',
                fields: {'turn': turn, 'path': failure.path},
              ),
            );
            _pendingFailures.add(failure);
        }
    }
  }

  FunctionResult _runCall(FunctionCall call) {
    final result = tools.call(call.name, call.arguments, _plan);
    _plan = result.plan ?? _plan;
    _calledSeeds.add(result.seeds);
    return FunctionResult(
      callId: call.callId,
      name: call.name,
      result: result.modelResult,
    );
  }

  static Iterable<String> _surfaceIds(List<Map<String, Object?>> messages) => [
    for (final message in messages)
      if (message case {'createSurface': {'surfaceId': final String id}}) id,
  ];
}
