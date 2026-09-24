import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:a2ui_core/a2ui_core.dart' as a2ui;
import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../../errors/app_error.dart';
import '../models/agent_turn_status.dart';
import '../models/plan_conversation.dart';
import '../models/transcript_entry.dart';
import '../models/turn_failure.dart';
import 'gemini_key_repository.dart';
import 'repository_guard.dart';
import 'wire_log.dart';

abstract interface class AgentRepository {
  Stream<PlanConversation> watchConversation(String sessionId);

  Future<void> open(String sessionId);

  Stream<TurnFailure> watchFailures(String sessionId);

  SurfaceContext surfaceContext(String sessionId, String surfaceId);

  Future<void> sendText(String sessionId, String text, {StoryReason? reason});

  Future<void> retry(String sessionId, String entryId);

  Future<void> stop(String sessionId);
}

class GenUiAgentRepository with RepositoryGuard implements AgentRepository {
  GenUiAgentRepository(this._client, this._geminiKeys, this._catalog);

  final HomewardClient _client;
  final GeminiKeyRepository _geminiKeys;
  final Catalog _catalog;
  final _plans = <String, _PlanSession>{};
  var _lastEntryId = 0;

  @override
  Stream<PlanConversation> watchConversation(String sessionId) {
    final plan = _plan(sessionId);
    return Stream.multi((listener) {
      listener.add(plan.conversation);
      final subscription = plan.changes.stream.listen(
        (_) => listener.add(plan.conversation),
      );
      listener.onCancel = subscription.cancel;
    });
  }

  @override
  Stream<TurnFailure> watchFailures(String sessionId) =>
      _plan(sessionId).failures.stream;

  @override
  SurfaceContext surfaceContext(String sessionId, String surfaceId) =>
      _plan(sessionId).surfaces.contextFor(surfaceId);

  @override
  Future<void> open(String sessionId) => guard(() async {
    final plan = _plan(sessionId);
    if (plan.isOpened) {
      return;
    }
    plan.isOpened = true;
    final transcript = await _client.transcript(sessionId);
    for (final turn in transcript.turns) {
      plan.put(_buyerEntry(turn.input));
      plan.put(_agentEntry(turn));
      for (final message in turn.messages) {
        plan.surfaces.handleMessage(a2ui.A2uiMessage.fromJson(message));
      }
    }
    for (final message in transcript.board) {
      plan.surfaces.handleMessage(a2ui.A2uiMessage.fromJson(message));
      plan.hasBoard = true;
    }
    plan.emit();
  });

  TranscriptEntry _buyerEntry(RecordedInput input) => switch (input) {
    RecordedText(:final text) => TranscriptEntry.buyer(
      id: _newEntryId(),
      text: text,
    ),
    RecordedAction(:final name) => TranscriptEntry.buyerAction(
      id: _newEntryId(),
      actionName: name,
    ),
  };

  TranscriptEntry _agentEntry(TurnRecord turn) => TranscriptEntry.agent(
    id: _newEntryId(),
    request: switch (turn.input) {
      RecordedText(:final text) => TurnRequest.text(text),
      RecordedAction(
        :final name,
        :final surfaceId,
        :final sourceComponentId,
        :final context,
      ) =>
        TurnRequest.action(
          ClientAction(
            name: name,
            surfaceId: surfaceId,
            sourceComponentId: sourceComponentId,
            context: context,
          ),
          surfaceData: const {},
        ),
    },
    status: switch (turn.status) {
      TurnStatus.completed => AgentTurnStatus.completed,
      TurnStatus.failed => AgentTurnStatus.failed,
      TurnStatus.canceled => AgentTurnStatus.canceled,
    },
    text: turn.outputText,
    surfaceIds: [
      for (final message in turn.messages)
        if (message case {
          'createSurface': {'surfaceId': final String surfaceId},
        })
          if (surfaceId != InlineSurfaces.boardId) surfaceId,
    ],
    error: turn.errorCode == null
        ? null
        : AppError.server(
            code: HomewardErrorCode.fromWire(turn.errorCode),
            message: 'That turn did not finish',
          ),
  );

  @override
  Future<void> sendText(
    String sessionId,
    String text, {
    StoryReason? reason,
  }) {
    final plan = _plan(sessionId);
    plan.add(TranscriptEntry.buyer(id: _newEntryId(), text: text));
    return _run(sessionId, plan, TurnRequest.text(text, reason: reason));
  }

  @override
  Future<void> retry(String sessionId, String entryId) {
    final plan = _plan(sessionId);
    return switch (plan.entry(entryId)) {
      AgentEntry(:final request, status: AgentTurnStatus.failed) => _run(
        sessionId,
        plan,
        request,
        replacing: entryId,
      ),
      _ => Future.value(),
    };
  }

  @override
  Future<void> stop(String sessionId) => guard(() async {
    if (_plan(sessionId).taskId case final taskId?) {
      await _client.cancelTask(taskId);
    }
  });

  _PlanSession _plan(String sessionId) => _plans.putIfAbsent(sessionId, () {
    final plan = _PlanSession(SurfaceController(catalogs: [_catalog]));
    plan.submissions = plan.surfaces.onSubmit.listen(
      (message) => _onSubmit(sessionId, plan, message),
    );
    return plan;
  });

  void _onSubmit(String sessionId, _PlanSession plan, ChatMessage message) {
    for (final part in message.parts.uiInteractionParts) {
      switch (jsonDecode(part.interaction)) {
        case {'action': final Map<String, Object?> json}:
          final action = ClientAction.fromJson(json);
          final surfaceData = plan.surfaces
              .contextFor(action.surfaceId)
              .dataModel
              .getValue<Object?>(DataPath.root);
          plan.add(
            TranscriptEntry.buyerAction(
              id: _newEntryId(),
              actionName: action.name,
            ),
          );
          unawaited(
            _run(
              sessionId,
              plan,
              TurnRequest.action(
                action,
                surfaceData: switch (_normalized(surfaceData)) {
                  final Map<String, Object?> data => data,
                  _ => const {},
                },
              ),
            ),
          );
        case {'error': final Object? error}:
          log('Surface reported ${jsonEncode(error)}', name: 'genui');
      }
    }
  }

  Future<void> _run(
    String sessionId,
    _PlanSession plan,
    TurnRequest request, {
    String? replacing,
  }) async {
    final entryId = replacing ?? _newEntryId();
    plan
      ..put(
        TranscriptEntry.agent(
          id: entryId,
          request: request,
          status: AgentTurnStatus.streaming,
        ),
      )
      ..isRunning = true
      ..emit();
    try {
      final geminiKey = await _geminiKeys.read();
      if (geminiKey == null) {
        throw const AppError.server(
          code: HomewardErrorCode.geminiKeyMissing,
          message: 'Add your Gemini API key to continue',
        );
      }
      wireLogInstance.sent(
        'message/stream',
        detail: _requestLabel(request),
        surfaceId: switch (request) {
          TextTurnRequest() => null,
          ActionTurnRequest(:final action) => action.surfaceId,
        },
        bytes: _bytesOf(
          request.message(sessionId: sessionId, messageId: entryId).toJson(),
        ),
      );
      await for (final event in _client.send(
        sessionId: sessionId,
        geminiKey: geminiKey,
        request: request,
      )) {
        wireLogInstance.received(
          _eventLabel(event),
          detail: _eventDetail(event),
          surfaceId: _eventSurfaceId(event),
          bytes: _eventBytes(event),
          payload: switch (event) {
            AgentA2ui(:final message) => message,
            _ => null,
          },
        );
        _apply(plan, entryId, event);
      }
    } on Object catch (error) {
      final appError = AppError.fromException(error);
      plan.updateAgent(
        entryId,
        (entry) =>
            entry.copyWith(status: AgentTurnStatus.failed, error: appError),
      );
      plan.failures.add(TurnFailure(entryId: entryId, error: appError));
    } finally {
      plan
        ..isRunning = false
        ..taskId = null
        ..emit();
    }
  }

  void _apply(_PlanSession plan, String entryId, AgentEvent event) {
    switch (event) {
      case AgentStarted(:final taskId):
        plan.taskId = taskId;
      case AgentText(:final text):
        plan.updateAgent(entryId, (entry) => entry.copyWith(text: text));
      case AgentA2ui(:final message):
        final normalized = _normalized(message)! as Map<String, dynamic>;
        plan.surfaces.handleMessage(a2ui.A2uiMessage.fromJson(normalized));
        if (normalized case {
          'createSurface': {'surfaceId': final String surfaceId},
        }) {
          if (surfaceId == InlineSurfaces.boardId) {
            plan
              ..hasBoard = true
              ..emit();
          } else {
            plan.updateAgent(
              entryId,
              (entry) =>
                  entry.copyWith(surfaceIds: [...entry.surfaceIds, surfaceId]),
            );
          }
        }
      case AgentProgress(:final progress):
        plan.updateAgent(
          entryId,
          (entry) => entry.copyWith(progress: progress),
        );
      case AgentCompleted(:final text):
        plan.updateAgent(
          entryId,
          (entry) =>
              entry.copyWith(text: text, status: AgentTurnStatus.completed),
        );
      case AgentCanceled():
        plan.updateAgent(
          entryId,
          (entry) => entry.copyWith(status: AgentTurnStatus.canceled),
        );
    }
  }

  Object? _normalized(Object? json) => jsonDecode(jsonEncode(json));

  String _requestLabel(TurnRequest request) => switch (request) {
    TextTurnRequest(:final text) => 'text, ${text.length} characters',
    ActionTurnRequest(:final action) => 'action ${action.name}',
  };

  String _eventLabel(AgentEvent event) => switch (event) {
    AgentStarted() => 'task',
    AgentText() => 'status-update, text',
    AgentA2ui() => 'data, A2UI',
    AgentProgress() => 'data, progress',
    AgentCompleted() => 'status-update, completed',
    AgentCanceled() => 'status-update, canceled',
  };

  String? _eventDetail(AgentEvent event) => switch (event) {
    AgentStarted(:final taskId) => taskId,
    AgentText() => null,
    AgentA2ui(:final message) => _a2uiDetail(message),
    AgentProgress(:final progress) => '${progress.steps.length} steps',
    AgentCompleted() => null,
    AgentCanceled() => null,
  };

  String? _a2uiDetail(Map<String, Object?> message) {
    for (final MapEntry(:key, :value) in message.entries) {
      if (value case {'surfaceId': final String _}) {
        return key;
      }
    }
    return null;
  }

  String? _eventSurfaceId(AgentEvent event) => switch (event) {
    AgentA2ui(:final message) => _a2uiSurfaceId(message),
    _ => null,
  };

  String? _a2uiSurfaceId(Map<String, Object?> message) {
    for (final value in message.values) {
      if (value case {'surfaceId': final String surfaceId}) {
        return surfaceId;
      }
    }
    return null;
  }

  int? _eventBytes(AgentEvent event) => switch (event) {
    AgentA2ui(:final message) => _bytesOf(message),
    AgentText(:final text) => _bytesOf(text),
    AgentProgress(:final progress) => _bytesOf(progress.toJson()),
    AgentCompleted(:final text) => _bytesOf(text),
    _ => null,
  };

  int _bytesOf(Object? json) => utf8.encode(jsonEncode(json)).length;

  String _newEntryId() => 'e${++_lastEntryId}';
}

class _PlanSession {
  _PlanSession(this.surfaces);

  final SurfaceController surfaces;
  final entries = <TranscriptEntry>[];
  final changes = StreamController<void>.broadcast(sync: true);
  final failures = StreamController<TurnFailure>.broadcast();
  StreamSubscription<ChatMessage>? submissions;
  String? taskId;
  var isRunning = false;
  var hasBoard = false;
  var isOpened = false;

  PlanConversation get conversation => PlanConversation(
    entries: List.unmodifiable(entries),
    isRunning: isRunning,
    hasBoard: hasBoard,
  );

  TranscriptEntry? entry(String id) =>
      entries.where((entry) => entry.id == id).firstOrNull;

  void add(TranscriptEntry entry) {
    entries.add(entry);
    emit();
  }

  void put(TranscriptEntry entry) {
    final index = entries.indexWhere((existing) => existing.id == entry.id);
    if (index == -1) {
      entries.add(entry);
    } else {
      entries[index] = entry;
    }
  }

  void updateAgent(String id, AgentEntry Function(AgentEntry entry) update) {
    final index = entries.indexWhere((entry) => entry.id == id);
    if (entries.elementAtOrNull(index) case final AgentEntry entry) {
      entries[index] = update(entry);
      emit();
    }
  }

  void emit() => changes.add(null);
}
