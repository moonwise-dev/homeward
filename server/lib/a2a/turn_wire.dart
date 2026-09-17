import 'package:common/common.dart';

import '../agent/turn/turn_event.dart';
import '../ids/random_hex.dart';
import 'json_rpc_errors.dart';
import 'running_task.dart';

final class TurnWire {
  TurnWire({String Function()? newMessageId})
    : _newMessageId = newMessageId ?? (() => randomHex(8));

  final String Function() _newMessageId;

  JsonRpcResponse submitted(Object? requestId, RunningTask task) =>
      JsonRpcResult(
        id: requestId,
        result: A2aStreamEvent.task(
          id: task.id,
          contextId: task.contextId,
          status: const TaskStatus(state: TaskState.submitted),
        ).toJson(),
      );

  JsonRpcResponse update(Object? requestId, RunningTask task, TurnEvent event) {
    JsonRpcResponse status(
      TaskState state, {
      List<A2aPart> parts = const [],
      bool isFinal = false,
    }) => JsonRpcResult(
      id: requestId,
      result: A2aStreamEvent.statusUpdate(
        taskId: task.id,
        contextId: task.contextId,
        status: TaskStatus(state: state, message: _message(parts)),
        isFinal: isFinal,
      ).toJson(),
    );

    return switch (event) {
      TurnWorking() => status(TaskState.working),
      TurnText(:final text) => status(
        TaskState.working,
        parts: [A2aPart.text(text: text)],
      ),
      TurnMessage(:final message) => status(
        TaskState.working,
        parts: [_a2uiPart(message)],
      ),
      TurnCompleted(:final text) => status(
        TaskState.completed,
        parts: [A2aPart.text(text: text)],
        isFinal: true,
      ),
      TurnCanceled() => status(TaskState.canceled, isFinal: true),
      TurnFailed(:final failure) => JsonRpcErrorResponse(
        id: requestId,
        error: JsonRpcErrors.homeward(failure),
      ),
    };
  }

  JsonRpcResponse snapshot(Object? requestId, RunningTask task) {
    final history = task.history;
    if (history.whereType<TurnFailed>().firstOrNull case final failed?) {
      return JsonRpcErrorResponse(
        id: requestId,
        error: JsonRpcErrors.homeward(failed.failure),
      );
    }
    final text = history.whereType<TurnText>().lastOrNull?.text ?? '';
    final state = switch (history.lastOrNull) {
      TurnCompleted() => TaskState.completed,
      TurnCanceled() => TaskState.canceled,
      _ => TaskState.working,
    };
    return JsonRpcResult(
      id: requestId,
      result: A2aStreamEvent.task(
        id: task.id,
        contextId: task.contextId,
        status: TaskStatus(
          state: state,
          message: _message([
            if (text.isNotEmpty) A2aPart.text(text: text),
            for (final event in history)
              if (event case TurnMessage(:final message)) _a2uiPart(message),
          ]),
        ),
      ).toJson(),
    );
  }

  A2aMessage? _message(List<A2aPart> parts) => parts.isEmpty
      ? null
      : A2aMessage(
          role: A2aRole.agent,
          parts: parts,
          messageId: _newMessageId(),
        );

  A2aPart _a2uiPart(Map<String, Object?> message) => A2aPart.data(
    data: message,
    metadata: const {'mimeType': A2uiExtension.mimeType},
  );
}
