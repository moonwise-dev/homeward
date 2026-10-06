import 'dart:convert';

import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../../data/models/session.dart';
import '../../errors/homeward_failure.dart';
import '../../gemini/gemini_exception.dart';
import '../../gemini/interaction_cancelled.dart';
import '../../gemini/interaction_event.dart';
import '../../gemini/interaction_input.dart';
import '../../gemini/interaction_request.dart';
import '../../gemini/tool_choice.dart';
import '../../logging/log_entry.dart';
import '../../research/gemini_researcher.dart';
import '../../research/researcher.dart';
import '../../tools/tool_context.dart';
import '../actions/action_input.dart';
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
import 'buyer_words.dart';
import 'correction_input.dart';
import 'create_interaction.dart';
import 'read_interaction.dart';
import 'drawn_components.dart';
import 'progress_log.dart';
import 'replay_shadow.dart';
import 'retry_notice.dart';
import 'surface_seeder.dart';
import 'tool_belt.dart';
import 'tools_done_note.dart';
import 'turn_event.dart';
import 'turn_input.dart';
import 'turn_settings.dart';
import 'unfinished_reply_input.dart';

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
    this.readInteraction,
  }) : turn = session.turnCount + 1,
       _session = session,
       _interactionId = session.lastInteractionId,
       _validator = TurnValidator(
         turn: session.turnCount + 1,
         catalog: catalog,
         shadow: replayShadow(session.messages),
         seeds: session.slices,
       );

  final int turn;
  final CreateInteraction createInteraction;
  final ReadInteraction? readInteraction;
  final PromptAssembler prompts;
  final ToolBelt tools;
  final TurnSettings settings;
  final DateTime Function() now;
  final Session _session;
  final TurnValidator _validator;
  late final _seeder = SurfaceSeeder(held: _validator.heldValue);
  final _progress = ProgressLog();
  final _forwarded = <Map<String, Object?>>[];
  final _pendingFailures = <ValidationFailure>[];
  final _rejectedSources = <String>[];
  final _text = StringBuffer();
  var _wordsBeforeTools = '';
  var _wordsOnly = false;
  String? _interactionId;
  String? _lastModel;
  var _emittedText = '';
  var _separateRound = false;
  var _rounds = 0;
  var _acceptedInRound = 0;
  RecordedInput _turnRequest = const RecordedInput.text('');
  var _status = TurnStatus.canceled;
  String? _errorCode;

  Session get session => _session.copyWith(
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
        slices: _validator.seeds,
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
    final firstInput = InteractionInput.text(switch (turnInput) {
      TextTurnInput(:final text) => text,
      ActionTurnInput(:final action, :final surfaceData) => actionInput(
        action,
        surfaceData,
      ),
    });
    InteractionInput input = firstInput;
    var toolRounds = 0;
    var catalogRounds = 0;
    var corrections = 0;
    var mayStartOver = true;
    var finishingRounds = 0;
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
      String? model;
      Map<String, Object?>? usage;
      var textChars = 0;
      final request = _request(
        input,
        allowToolCalls: toolRounds < settings.maxToolRounds,
        constrained: constrained,
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
              textChars += text.length;
              for (final output in parser.add(text)) {
                yield* _emit(output);
              }
            case FunctionCall():
              calls.add(event);
            case InteractionCompleted(:final interactionId):
              _interactionId = interactionId;
              status = event.status;
              usage = event.usage;
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
            case InteractionCreated(model: final created):
              model = created;
          }
        }
      } on InteractionCancelled {
        return;
      } on GeminiException catch (error) {
        _logFailure(error);
        if ((error, input, request.previousInteractionId) case (
          GeminiRequestInvalid(),
          FunctionResultsInput(:final results),
          final chainedTo?,
        )) {
          await _logRefusedChain(apiKey, chainedTo, results);
        }
        if (constrained && error is GeminiRequestInvalid) {
          continue;
        }
        if (mayStartOver &&
            request.previousInteractionId != null &&
            !_validator.drewThisTurn &&
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
            'model': model,
            'status': status,
            'functionCalls': [for (final call in calls) call.name],
            'textChars': textChars,
            'outputTokens': ?usage?['total_output_tokens'],
            'thoughtTokens': ?usage?['total_thought_tokens'],
            'durationMs': roundClock.elapsedMilliseconds,
          },
        ),
      );
      _lastModel = model;
      if (calls.isEmpty &&
          textChars == 0 &&
          mayStartOver &&
          request.previousInteractionId != null &&
          !_validator.drewThisTurn) {
        mayStartOver = false;
        _startOver();
        input = firstInput;
        toolRounds = 0;
        yield* _emitText();
        continue;
      }
      for (final output in parser.close()) {
        yield* _emit(output);
      }
      final readsCatalog =
          catalogRounds < settings.maxCatalogRounds &&
          tools.onlyReadCatalog([for (final call in calls) call.name]);
      if (readsCatalog ||
          (calls.isNotEmpty && toolRounds < settings.maxToolRounds)) {
        if (readsCatalog) {
          catalogRounds++;
        } else {
          toolRounds++;
        }
        _wordsOnly = false;
        if (_text.toString() != textBeforeRound) {
          _wordsBeforeTools = _text.toString();
          _text
            ..clear()
            ..write(textBeforeRound);
          yield* _emitText();
        }
        final results = <FunctionResult>[];
        final researcher = GeminiResearcher(
          createInteraction: createInteraction,
          apiKey: apiKey,
          thinkingLevel: settings.thinkingLevel,
          cancellation: cancellation,
        );
        yield* _progress.whileRunning(() async {
          for (final call in calls) {
            results.add(await _runCall(call, researcher));
          }
        });
        yield* _refreshSlices();
        input = InteractionInput.functionResults(
          results,
          note: toolRounds < settings.maxToolRounds ? null : toolsDoneNote,
        );
        continue;
      }
      for (final surfaceId in _seeder.awaitingComponents.where(
        (surfaceId) => !_pendingFailures.any(
          (failure) => failure.surfaceId == surfaceId,
        ),
      )) {
        _reject(
          ValidationFailure(
            surfaceId: surfaceId,
            path: '/updateComponents',
            message:
                'Surface $surfaceId was created but has no components; send '
                'its updateComponents message',
          ),
        );
      }
      if (_pendingFailures.isNotEmpty &&
          corrections < settings.maxCorrections) {
        corrections++;
        input = InteractionInput.text(correctionInput(_pendingFailures));
        _pendingFailures.clear();
        correcting = true;
        continue;
      }
      final noPlan = _validator.screen == null;
      final noAsk = !_validator.askedThisTurn;
      final noWords =
          _text.toString().trim().isEmpty && _wordsBeforeTools.isEmpty;
      if (finishingRounds < settings.maxFinishingRounds &&
          _pendingFailures.isEmpty &&
          (noPlan || noAsk || noWords)) {
        finishingRounds++;
        _log.info(
          LogEntry(
            'Reply of turn $turn is unfinished',
            fields: {
              'turn': turn,
              'noPlan': noPlan,
              'noAsk': noAsk,
              'noWords': noWords,
            },
          ),
        );
        input = InteractionInput.text(
          unfinishedReplyInput(plan: noPlan, ask: noAsk, words: noWords),
        );
        correcting = !noWords;
        _wordsOnly = noWords && !noPlan && !noAsk;
        continue;
      }
      if (_text.toString().trim().isEmpty && _wordsBeforeTools.isNotEmpty) {
        _text.write(_wordsBeforeTools);
        yield* _emitText();
      }
      if (_pendingFailures.isNotEmpty ||
          (!_validator.drewThisTurn && _text.toString().trim().isEmpty)) {
        yield* _retry();
      }
      _log.info(
        LogEntry(
          'Turn $turn completed',
          fields: {
            'turn': turn,
            'modelRounds': _rounds,
            'toolRounds': toolRounds,
            'corrections': corrections,
            'drewScreen': _validator.drewThisTurn,
          },
        ),
      );
      _status = TurnStatus.completed;
      yield TurnEvent.completed(_text.toString().trim());
      return;
    }
  }

  Future<void> _logRefusedChain(
    String apiKey,
    String interactionId,
    List<FunctionResult> results,
  ) async {
    final read = readInteraction;
    if (read == null) {
      return;
    }
    final fields = {
      'turn': turn,
      'round': _rounds,
      'answered': [for (final result in results) result.name],
      'modelBefore': _lastModel,
    };
    try {
      final stored = await read(apiKey: apiKey, interactionId: interactionId);
      _log.info(
        LogEntry(
          'Refused chain read back',
          fields: {
            ...fields,
            'storedStatus': stored.status,
            'storedModel': stored.model,
            'storedSteps': stored.steps,
          },
        ),
      );
    } on Exception catch (error) {
      _log.info(
        LogEntry(
          'Refused chain could not be read back',
          fields: {...fields, 'error': '${error.runtimeType}'},
        ),
      );
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
    _pendingFailures.clear();
    _rejectedSources.clear();
    _text.clear();
    _wordsBeforeTools = '';
  }

  void _failed(HomewardFailure failure) {
    _status = TurnStatus.failed;
    _errorCode = failure.code.wireName;
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

  InteractionRequest _request(
    InteractionInput input, {
    required bool allowToolCalls,
    required bool constrained,
  }) => InteractionRequest(
    input: input,
    systemInstruction: prompts.systemInstruction(
      turnContext(
        turn: turn,
        screen: _validator.screen ?? const [],
        brief: switch (_validator.seeds[briefSlice.name]) {
          final Map<String, Object?> brief => brief,
          _ => const {},
        },
      ),
    ),
    tools: tools.declarations,
    toolChoice: allowToolCalls ? null : ToolChoice.none,
    thinkingLevel: settings.thinkingLevel,
    previousInteractionId: _interactionId,
    responseSchema: constrained
        ? catalogResponseSchema({
            ...coreComponents,
            ...drawnComponents([
              ..._rejectedSources,
              for (final message in _forwarded) jsonEncode(message),
            ]),
          })
        : null,
  );

  Stream<TurnEvent> _emit(ParsedOutput output) async* {
    switch (output) {
      case ProseOutput(:final text):
        if (_separateRound && text.trim().isNotEmpty) {
          _text.write('\n\n');
          _separateRound = false;
        }
        _text.write(text);
        yield* _emitText();
      case A2uiMessageOutput() when _wordsOnly:
        break;
      case A2uiMessageOutput(:final source):
        for (final part in splitBatchedMessages(
          source,
          lastSurfaceId: _validator.lastSurfaceId,
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
        _reject(failure);
        _rejectedSources.add(source);
      case Unchanged():
    }
  }

  void _reject(ValidationFailure failure) {
    _log.info(
      LogEntry(
        'A2UI message rejected',
        fields: {'turn': turn, 'path': failure.path, 'reason': failure.message},
      ),
    );
    _pendingFailures.add(failure);
  }

  Stream<TurnEvent> _emitText() async* {
    final visible = _text.toString().trim();
    if (visible != _emittedText) {
      _emittedText = visible;
      yield TurnEvent.text(visible);
    }
  }

  Stream<TurnEvent> _retry() async* {
    _log.info(
      LogEntry('Retry notice added in turn $turn', fields: {'turn': turn}),
    );
    if (_text.isNotEmpty) {
      _text.write('\n\n');
    }
    _text.write(retryNotice);
    yield* _emitText();
  }

  Stream<TurnEvent> _refreshSlices() async* {
    final seeds = _validator.seeds;
    for (final slice in seeds.keys) {
      for (final surfaceId in _validator.surfacesBinding(slice)) {
        for (final json in _seeder.refresh(surfaceId, [slice], seeds)) {
          _forwarded.add(json);
          yield TurnEvent.message(json);
        }
      }
    }
  }

  Future<FunctionResult> _runCall(
    FunctionCall call,
    Researcher researcher,
  ) async {
    final result = await tools.call(
      call.name,
      call.arguments,
      context: ToolContext(
        steps: _progress,
        slices: _validator.seeds,
        buyerWords: buyerWords([
          for (final record in _session.turns) record.input,
          _turnRequest,
        ]),
        researcher: researcher,
      ),
    );
    _validator.seeds = {..._validator.seeds, ...result.seeds};
    return FunctionResult(
      callId: call.callId,
      name: call.name,
      result: result.modelResult,
    );
  }
}
