import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../a2a/a2a_error_codes.dart';
import '../a2a/a2a_part.dart';
import '../a2a/a2a_stream_event.dart';
import '../a2a/json_rpc.dart';
import '../a2a/message_send_params.dart';
import '../a2a/task_id_params.dart';
import '../a2a/task_state.dart';
import '../a2ui_extension.dart';
import '../decode_sse.dart';
import '../homeward_headers.dart';
import '../plan_transcript.dart';
import '../progress/research_progress.dart';
import 'agent_event.dart';
import 'homeward_api_exception.dart';
import 'turn_request.dart';

final class HomewardClient {
  HomewardClient({
    required this.httpClient,
    required Uri server,
    String Function()? newMessageId,
  }) : server = server.path.endsWith('/')
           ? server
           : server.replace(path: '${server.path}/'),
       _newMessageId = newMessageId ?? _randomId;

  final http.Client httpClient;
  final Uri server;
  final String Function() _newMessageId;
  var _lastRequestId = 0;

  Future<String> createSession() async {
    final data = await _api('api/sessions');
    return data['sessionId']! as String;
  }

  Future<PlanTranscript> transcript(String sessionId) async =>
      PlanTranscript.fromJson(
        await _api('api/sessions/$sessionId', method: 'GET'),
      );

  Future<void> verifyKey(String geminiKey) =>
      _api('api/keys/verify', geminiKey: geminiKey);

  Stream<AgentEvent> send({
    required String sessionId,
    required String geminiKey,
    required TurnRequest request,
  }) {
    final abort = Completer<void>();
    final controller = StreamController<AgentEvent>();
    StreamSubscription<AgentEvent>? subscription;
    controller
      ..onListen = () {
        subscription =
            _events(
              sessionId: sessionId,
              geminiKey: geminiKey,
              request: request,
              abort: abort.future,
            ).listen(
              controller.add,
              onError: controller.addError,
              onDone: controller.close,
            );
      }
      ..onPause = (() => subscription?.pause())
      ..onResume = (() => subscription?.resume())
      ..onCancel = () {
        if (!abort.isCompleted) {
          abort.complete();
        }
        unawaited(
          subscription?.cancel().onError<http.RequestAbortedException>(
            (_, _) {},
          ),
        );
      };
    return controller.stream;
  }

  Future<void> cancelTask(String taskId) async {
    final response = await httpClient.post(
      server.resolve('a2a'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(
        _rpc('tasks/cancel', TaskIdParams(id: taskId).toJson()),
      ),
    );
    if (_rpcResponse(response.body)
        case JsonRpcErrorResponse(
          :final error,
        )
        when error.code != A2aErrorCodes.taskNotCancelable) {
      throw HomewardApiException.fromRpc(error);
    }
  }

  Stream<AgentEvent> _events({
    required String sessionId,
    required String geminiKey,
    required TurnRequest request,
    required Future<void> abort,
  }) async* {
    final httpRequest =
        http.AbortableRequest(
            'POST',
            server.resolve('a2a'),
            abortTrigger: abort,
          )
          ..headers.addAll({
            HomewardHeaders.geminiKey: geminiKey,
            'content-type': 'application/json',
            'accept': 'text/event-stream',
            A2uiExtension.header: A2uiExtension.uri,
          })
          ..body = jsonEncode(
            _rpc(
              'message/stream',
              MessageSendParams(
                message: request.message(
                  sessionId: sessionId,
                  messageId: _newMessageId(),
                ),
              ).toJson(),
            ),
          );
    final response = await httpClient.send(httpRequest);
    final contentType = response.headers['content-type'] ?? '';
    if (!contentType.startsWith('text/event-stream')) {
      final body = await response.stream.bytesToString();
      throw switch (_rpcResponse(body)) {
        JsonRpcErrorResponse(:final error) => HomewardApiException.fromRpc(
          error,
        ),
        JsonRpcResult() => const FormatException('Expected an event stream'),
      };
    }
    await for (final event in decodeSse(response.stream)) {
      for (final agentEvent in _agentEventsOf(_rpcResponse(event.data))) {
        yield agentEvent;
      }
    }
  }

  Iterable<AgentEvent> _agentEventsOf(JsonRpcResponse response) sync* {
    final result = switch (response) {
      JsonRpcResult(:final result) => result,
      JsonRpcErrorResponse(:final error) => throw HomewardApiException.fromRpc(
        error,
      ),
    };
    switch (A2aStreamEvent.fromJson(result)) {
      case A2aTask(:final id):
        yield AgentEvent.started(taskId: id);
      case TaskStatusUpdate(:final status):
        final parts = status.message?.parts ?? const <A2aPart>[];
        switch (status.state) {
          case TaskState.completed:
            yield AgentEvent.completed(
              parts.whereType<A2aTextPart>().lastOrNull?.text ?? '',
            );
          case TaskState.canceled:
            yield const AgentEvent.canceled();
          case TaskState.submitted || TaskState.working:
            for (final part in parts) {
              yield switch (part) {
                A2aTextPart(:final text) => AgentEvent.text(text),
                A2aDataPart(
                  :final data,
                  metadata: {'mimeType': ResearchProgress.mimeType},
                ) =>
                  AgentEvent.progress(ResearchProgress.fromJson(data)),
                A2aDataPart(:final data) => AgentEvent.a2ui(data),
              };
            }
        }
    }
  }

  Future<Map<String, Object?>> _api(
    String path, {
    String method = 'POST',
    String? geminiKey,
  }) async {
    final uri = server.resolve(path);
    final headers = {HomewardHeaders.geminiKey: ?geminiKey};
    final response = method == 'GET'
        ? await httpClient.get(uri, headers: headers)
        : await httpClient.post(uri, headers: headers);
    return switch (jsonDecode(response.body)) {
      {'ok': true, 'data': final Map<String, Object?> data} => data,
      {'ok': false, 'error': final Map<String, Object?> error} =>
        throw HomewardApiException.fromEnvelope(error),
      _ => throw FormatException(
        'Unexpected response from $path with HTTP ${response.statusCode}',
      ),
    };
  }

  Map<String, Object?> _rpc(String method, Map<String, Object?> params) =>
      JsonRpcRequest(
        jsonrpc: '2.0',
        id: ++_lastRequestId,
        method: method,
        params: params,
      ).toJson();

  JsonRpcResponse _rpcResponse(String body) =>
      JsonRpcResponse.fromJson(jsonDecode(body) as Map<String, Object?>);

  static String _randomId() {
    final random = Random.secure();
    return [
      for (var i = 0; i < 16; i++) random.nextInt(16).toRadixString(16),
    ].join();
  }
}
