import 'dart:convert';

import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

import '../agent/turn/turn_input.dart';
import '../agent/turn/turn_orchestrator.dart';
import '../errors/homeward_failure.dart';
import '../http/json_response.dart';
import '../ids/random_hex.dart';
import '../request/request_values.dart';
import 'json_rpc_errors.dart';
import 'sse_response.dart';
import 'running_task.dart';
import 'task_registry.dart';
import 'turn_wire.dart';

final class A2aHandler {
  A2aHandler({
    required this.turns,
    required this.tasks,
    TurnWire? wire,
    String Function()? newTaskId,
  }) : wire = wire ?? TurnWire(),
       _newTaskId = newTaskId ?? (() => randomHex(12));

  final TurnOrchestrator turns;
  final TaskRegistry tasks;
  final TurnWire wire;
  final String Function() _newTaskId;

  Future<Response> call(Request request) async {
    final JsonRpcRequest rpc;
    try {
      rpc = JsonRpcRequest.fromJson(
        jsonDecode(await request.readAsString()) as Map<String, Object?>,
      );
    } on FormatException {
      return _error(null, JsonRpcErrors.parse);
    } on Object catch (error) {
      if (error is CheckedFromJsonException || error is TypeError) {
        return _error(null, JsonRpcErrors.invalidRequest);
      }
      rethrow;
    }
    return switch (rpc.method) {
      'message/stream' => _stream(request, rpc),
      'tasks/get' => _get(request, rpc),
      'tasks/cancel' => await _cancel(request, rpc),
      _ => _error(rpc.id, JsonRpcErrors.methodNotFound),
    };
  }

  Response _stream(Request request, JsonRpcRequest rpc) {
    final extensions = request.headers[A2uiExtension.header] ?? '';
    if (!extensions
        .split(',')
        .map((uri) => uri.trim())
        .contains(A2uiExtension.uri)) {
      return _error(rpc.id, JsonRpcErrors.extensionRequired);
    }
    final message = _parse(rpc, MessageSendParams.fromJson)?.message;
    if (message == null) {
      return _error(rpc.id, JsonRpcErrors.invalidParams('Expected a message'));
    }
    final sessionId = message.contextId;
    final input = _turnInput(message);
    if (sessionId == null || input == null) {
      return _error(
        rpc.id,
        JsonRpcErrors.invalidParams(
          'A message needs the session as contextId and a text or action part',
        ),
      );
    }
    final uid = request.callerUid;
    final apiKey = request.geminiKey;
    if (uid == null || apiKey == null) {
      return _error(
        rpc.id,
        JsonRpcErrors.homeward(
          uid == null
              ? HomewardFailure.unauthenticated
              : HomewardFailure.geminiKeyMissing,
        ),
      );
    }
    final task = tasks.start(
      id: _newTaskId(),
      contextId: sessionId,
      ownerUid: uid,
      run: (cancellation) => turns.run(
        sessionId: sessionId,
        uid: uid,
        input: input,
        apiKey: apiKey,
        cancellation: cancellation,
      ),
    );
    return sseResponse(
      Stream.multi((stream) {
        stream.add(wire.submitted(rpc.id, task));
        final subscription = task.watch().listen(
          (event) => stream.add(wire.update(rpc.id, task, event)),
          onDone: stream.close,
        );
        stream.onCancel = subscription.cancel;
      }),
    );
  }

  Response _get(Request request, JsonRpcRequest rpc) {
    final task = _task(request, rpc);
    return task == null
        ? _error(rpc.id, JsonRpcErrors.taskNotFound)
        : jsonResponse(200, wire.snapshot(rpc.id, task));
  }

  Future<Response> _cancel(Request request, JsonRpcRequest rpc) async {
    final task = _task(request, rpc);
    if (task == null) {
      return _error(rpc.id, JsonRpcErrors.taskNotFound);
    }
    if (task.isFinished) {
      return _error(rpc.id, JsonRpcErrors.taskNotCancelable);
    }
    await task.cancel();
    return jsonResponse(200, wire.snapshot(rpc.id, task));
  }

  TurnInput? _turnInput(A2aMessage message) {
    for (final part in message.parts) {
      if (part case A2aDataPart(
        data: {'action': final Map<String, Object?> json},
      )) {
        try {
          final action = ClientAction.fromJson(json);
          return TurnInput.action(
            action,
            surfaceData: switch (message.metadata) {
              {
                A2uiExtension.dataModelKey: {
                  'surfaces': final Map<String, Object?> surfaces,
                },
              } =>
                surfaces[action.surfaceId] as Map<String, Object?>? ?? const {},
              _ => const {},
            },
          );
        } on CheckedFromJsonException {
          return null;
        }
      }
    }
    final text = [
      for (final part in message.parts)
        if (part case A2aTextPart(:final text)) text,
    ].join('\n').trim();
    return text.isEmpty
        ? null
        : TurnInput.text(
            text,
            reason: switch (message.metadata?[HomewardMetadata.storyReason]) {
              final String name => StoryReason.values.asNameMap()[name],
              _ => null,
            },
          );
  }

  RunningTask? _task(Request request, JsonRpcRequest rpc) {
    final id = _parse(rpc, TaskIdParams.fromJson)?.id;
    final uid = request.callerUid;
    return id == null || uid == null ? null : tasks.find(id, uid);
  }

  T? _parse<T>(JsonRpcRequest rpc, T Function(Map<String, Object?>) fromJson) {
    try {
      return switch (rpc.params) {
        final params? => fromJson(params),
        null => null,
      };
    } on CheckedFromJsonException {
      return null;
    }
  }

  Response _error(Object? id, JsonRpcError error) =>
      jsonResponse(200, JsonRpcErrorResponse(id: id, error: error));
}
