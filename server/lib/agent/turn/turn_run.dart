import 'dart:convert';

import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../../data/models/session.dart';
import '../../gemini/gemini_exception.dart';
import '../../gemini/interaction_cancelled.dart';
import '../../gemini/interaction_event.dart';
import '../../gemini/interaction_input.dart';
import '../../gemini/interaction_request.dart';
import '../../gemini/tool_choice.dart';
import '../../logging/log_entry.dart';
import '../../tools/profile_field_paths.dart';
import '../actions/action_input.dart';
import '../actions/apply_action.dart';
import '../json_reply_parser.dart';
import '../output_parser.dart';
import '../parsed_output.dart';
import '../prompt/catalog_response_schema.dart';
import '../prompt/prompt_assembler.dart';
import '../prompt/turn_context.dart';
import '../stream_parser.dart';
import '../validation/split_batched_messages.dart';
import '../validation/turn_validator.dart';
import '../validation/validation_failure.dart';
import '../validation/validation_outcome.dart';
import 'correction_input.dart';
import 'drawn_components.dart';
import 'homes_fallback.dart';
import 'progress_log.dart';
import 'replay_shadow.dart';
import 'create_interaction.dart';
import 'retry_surface.dart';
import 'surface_due_note.dart';
import 'surface_seeder.dart';
import 'tool_belt.dart';
import 'tools_done_note.dart';
import 'turn_event.dart';
import 'turn_input.dart';
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
  final _progress = ProgressLog();
  final _forwarded = <Map<String, Object?>>[];
  final _calledSeeds = <Map<String, Object?>>[];
  final _calledNames = <String>{};
  final _settledNames = <String>{};
  final _pendingFailures = <ValidationFailure>[];
  final _rejectedSources = <String>[];
  final _text = StringBuffer();
  Plan _plan;
  String? _interactionId;
  var _emittedText = '';
  var _separateRound = false;
  var _rounds = 0;
  var _acceptedInRound = 0;
  RecordedInput _turnRequest = const RecordedInput.text('');
  var _status = TurnStatus.canceled;
  String? _errorCode;

  Session get session => _session.copyWith(
    plan: _plan,
    turnCount: turn,
    lastInteractionId: _interactionId,
    updatedAt: now(),
    turns: [
      ..._session.turns,
      TurnRecord(
        index: turn,
        input: _turnRequest,
        outputText: _text.toString().trim(),
        messages: _forwarded,
        status: _status,
        errorCode: _errorCode,
      ),
    ],
  );

  Stream<TurnEvent> execute({
    required TurnInput turnInput,
    required String apiKey,
    Future<void>? cancellation,
  }) async* {
    _turnRequest = switch (turnInput) {
      TextTurnInput(:final text) => RecordedInput.text(text),
      ActionTurnInput(:final action) => recordedInputOf(action),
    };
    final firstInput = InteractionInput.text(_modelText(turnInput));
    InteractionInput input = firstInput;
    var toolRounds = 0;
    var corrections = 0;
    var askedForSurface = turnInput is! ActionTurnInput;
    var mayStartOver = true;
    var correcting = false;
    while (true) {
      final constrained = correcting;
      correcting = false;
      OutputParser newParser() =>
          constrained ? JsonReplyParser() : StreamParser();
      final calls = <FunctionCall>[];
      var parser = newParser();
      final textBeforeRound = _text.toString();
      final failuresBeforeRound = _pendingFailures.length;
      _acceptedInRound = 0;
      _separateRound = _text.isNotEmpty;
      _rounds++;
      final roundClock = Stopwatch()..start();
      String? status;
      late final InteractionRequest request;
      yield* _progress.whileRunning(
        () async => request = await _request(
          input,
          allowToolCalls: toolRounds < settings.maxToolRounds,
          constrained: constrained,
        ),
      );
      try {
        await for (final event in createInteraction(
          apiKey: apiKey,
          request: request,
          canFallBack: () => _acceptedInRound == 0,
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
              status = event.status;
            case ModelFailed(:final model, :final reason):
              _log.warning(
                LogEntry(
                  'Model $model failed; falling back',
                  fields: {'model': model, 'reason': reason.message},
                ),
              );
              calls.clear();
              parser = newParser();
              _pendingFailures.removeRange(
                failuresBeforeRound,
                _pendingFailures.length,
              );
              _text
                ..clear()
                ..write(textBeforeRound);
              _separateRound = _text.isNotEmpty;
              yield* _emitText();
            case InteractionCreated():
          }
        }
      } on InteractionCancelled {
        return;
      } on GeminiException catch (error) {
        _logFailure(error);
        if (constrained && error is GeminiRequestInvalid) {
          continue;
        }
        if (mayStartOver &&
            request.previousInteractionId != null &&
            _forwarded.isEmpty &&
            (error is GeminiHistoryMissing || error is GeminiRequestInvalid)) {
          mayStartOver = false;
          _startOver();
          input = firstInput;
          toolRounds = 0;
          yield* _emitText();
          continue;
        }
        if (error is GeminiHistoryMissing) {
          _failed(HomewardFailure.internal);
          yield const TurnEvent.failed(HomewardFailure.internal);
          return;
        }
        final failure = HomewardFailure.fromGemini(error, now());
        _failed(failure);
        yield TurnEvent.failed(failure);
        return;
      }
      _log.info(
        LogEntry(
          'Model round $_rounds of turn $turn',
          fields: {
            'turn': turn,
            'round': _rounds,
            'status': status,
            'functionCalls': [for (final call in calls) call.name],
            'durationMs': roundClock.elapsedMilliseconds,
          },
        ),
      );
      for (final output in parser.close()) {
        yield* _emit(output);
      }
      final drewNothing =
          _acceptedInRound == 0 &&
          _text.toString().trim() == textBeforeRound.trim();
      if (calls.isNotEmpty &&
          toolRounds < settings.maxToolRounds &&
          (toolRounds == 0 || drewNothing)) {
        toolRounds = calls.every(_isKnown)
            ? settings.maxToolRounds
            : toolRounds + 1;
        final results = <String, FunctionResult>{};
        yield* _progress.whileRunning(() async {
          for (final call
              in [...calls]..sort(
                (a, b) =>
                    tools.orderOf(a.name).compareTo(tools.orderOf(b.name)),
              )) {
            results[call.callId] = await _runCall(call);
          }
        });
        input = InteractionInput.functionResults(
          [for (final call in calls) results[call.callId]!],
          note: toolRounds < settings.maxToolRounds ? null : toolsDoneNote,
        );
        continue;
      }
      if (_pendingFailures.isNotEmpty) {
        if (corrections < settings.maxCorrections) {
          corrections++;
          input = InteractionInput.text(correctionInput(_pendingFailures));
          _pendingFailures.clear();
          correcting = true;
          continue;
        }
        yield* _fallback();
      }
      if (_forwarded.isEmpty && !askedForSurface) {
        askedForSurface = true;
        if (surfaceDueNote(_plan, _market()) case final note?) {
          input = InteractionInput.text(note);
          continue;
        }
      }
      if (_forwarded.isEmpty &&
          (_text.toString().trim().isEmpty ||
              (turnInput is ActionTurnInput && _homesReady))) {
        yield* _fallback();
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
      _status = TurnStatus.completed;
      yield TurnEvent.completed(_text.toString().trim());
      return;
    }
  }

  void _startOver() {
    _log.info(
      LogEntry(
        'Turn $turn starts over in a new conversation',
        fields: {'turn': turn},
      ),
    );
    _interactionId = null;
    _calledNames.clear();
    _calledSeeds.clear();
    _pendingFailures.clear();
    _rejectedSources.clear();
    _text.clear();
  }

  void _failed(HomewardFailure failure) {
    _status = TurnStatus.failed;
    _errorCode = failure.code.wireName;
  }

  String _modelText(TurnInput turnInput) {
    switch (turnInput) {
      case TextTurnInput(:final text, :final reason):
        if (reason != null) {
          _plan = _plan.copyWith(story: _plan.story.copyWith(reason: reason));
        }
        return text;
      case ActionTurnInput(:final action, :final surfaceData):
        final outcome = applyAction(
          action: action,
          surfaceData: surfaceData,
          plan: _plan,
          markets: tools.markets,
        );
        _plan = outcome.plan;
        return actionInput(outcome.summary);
    }
  }

  void _logFailure(GeminiException error) => _log.warning(
    LogEntry(
      'Gemini request failed in turn $turn',
      fields: {
        'turn': turn,
        'round': _rounds,
        'error': error.runtimeType.toString(),
        'message': error.message,
      },
    ),
  );

  Future<InteractionRequest> _request(
    InteractionInput input, {
    required bool allowToolCalls,
    required bool constrained,
  }) async {
    final settled = await tools.runSettled(_plan, steps: _progress);
    _settledNames.addAll(settled.keys);
    _validator
      ..seeds = turnSeeds(_plan, [
        ..._calledSeeds,
        for (final result in settled.values) result.seeds,
      ])
      ..requiredProfilePaths = _requiredProfilePaths();
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
      toolChoice: allowToolCalls ? null : ToolChoice.none,
      thinkingLevel: settings.thinkingLevel,
      previousInteractionId: _interactionId,
      responseSchema: constrained
          ? catalogResponseSchema({
              ...correctionLayout,
              ...drawnComponents([
                ..._rejectedSources,
                for (final message in _forwarded) jsonEncode(message),
              ]),
            })
          : null,
    );
  }

  ResolvedMarket? _market() => switch (_plan.marketId) {
    final id? => tools.markets.resolveFor(id, _plan.profile),
    null => null,
  };

  Set<String> _requiredProfilePaths() {
    final marketId = _plan.marketId;
    final market = marketId == null
        ? null
        : tools.markets.resolveFor(marketId, _plan.profile);
    return {
      if (market != null)
        for (final field in missingProfileFields(_plan.profile, market))
          ...profileFieldPaths(field),
    };
  }

  Stream<TurnEvent> _emit(ParsedOutput output) async* {
    switch (output) {
      case ProseOutput(:final text):
        if (_separateRound && text.trim().isNotEmpty) {
          _text.write('\n\n');
          _separateRound = false;
        }
        _text.write(text);
        yield* _emitText();
      case A2uiMessageOutput(:final source):
        for (final part in splitBatchedMessages(
          source,
          lastSurfaceId: _validator.surfacesCreated.lastOrNull,
        )) {
          yield* _validated(part);
        }
    }
  }

  Stream<TurnEvent> _validated(String source) async* {
    switch (_validator.validate(source)) {
      case Accepted(:final message):
        _acceptedInRound++;
        for (final json in _seeder.forward(message, _validator.seeds)) {
          _forwarded.add(json);
          yield TurnEvent.message(json);
        }
      case Rejected(:final failure):
        _log.info(
          LogEntry(
            'A2UI message rejected',
            fields: {
              'turn': turn,
              'path': failure.path,
              'reason': failure.message,
            },
          ),
        );
        _pendingFailures.add(failure);
        _rejectedSources.add(source);
      case Unchanged():
    }
  }

  Stream<TurnEvent> _emitText() async* {
    final visible = _text.toString().trim();
    if (visible != _emittedText) {
      _emittedText = visible;
      yield TurnEvent.text(visible);
    }
  }

  bool get _homesReady =>
      _validator.seeds.containsKey(assessmentSlice.name) &&
      _plan.story.chosen == null &&
      !_validator.drewComponents;

  Stream<TurnEvent> _fallback() async* {
    final failuresBefore = _pendingFailures.length;
    if (_homesReady) {
      final empty = _validator.emptySurfaces.firstOrNull;
      for (final source in homesFallback(
        empty ?? InlineSurfaces.id(turn, 'homes'),
        create: empty == null,
      )) {
        yield* _validated(source);
      }
      if (_pendingFailures.length == failuresBefore) {
        _logFallback('homes');
        return;
      }
    }
    _logFallback('retry');
    for (final message in retrySurface(turn)) {
      _forwarded.add(message);
      yield TurnEvent.message(message);
    }
  }

  void _logFallback(String fallback) => _log.info(
    LogEntry(
      'Fallback drawn in turn $turn',
      fields: {'turn': turn, 'fallback': fallback},
    ),
  );

  bool _isKnown(FunctionCall call) =>
      _settledNames.contains(call.name) || _calledNames.contains(call.name);

  Future<FunctionResult> _runCall(FunctionCall call) async {
    _calledNames.add(call.name);
    final result = await tools.call(
      call.name,
      call.arguments,
      _plan,
      steps: _progress,
    );
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
