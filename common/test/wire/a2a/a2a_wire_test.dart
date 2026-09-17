import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  Map<String, Object?> roundTrip(Object model) =>
      jsonDecode(jsonEncode(model)) as Map<String, Object?>;

  test('reads a genui_a2a action turn with explicit nulls', () {
    final request = JsonRpcRequest.fromJson({
      'jsonrpc': '2.0',
      'id': 7,
      'method': 'message/stream',
      'params': {
        'message': {
          'role': 'user',
          'parts': [
            {
              'kind': 'data',
              'data': {
                'version': 'v0.9',
                'action': {
                  'surfaceId': 't3-affordability',
                  'name': 'commit_scenario',
                  'sourceComponentId': 'commit',
                  'timestamp': '2026-10-02T09:14:03.201',
                  'context': {'scenarioPath': '/scenario'},
                },
              },
              'metadata': null,
            },
          ],
          'metadata': {
            'a2uiClientCapabilities': {
              'v0.9': {
                'supportedCatalogIds': [homewardCatalogId],
              },
            },
          },
          'extensions': null,
          'referenceTaskIds': ['task-2'],
          'messageId': 'm-7f3',
          'taskId': null,
          'contextId': 's-9a2',
          'kind': 'message',
        },
        'configuration': null,
        'metadata': null,
      },
    });

    final params = MessageSendParams.fromJson(request.params!);
    final part = params.message.parts.single as A2aDataPart;
    final action = ClientAction.fromJson(
      part.data['action']! as Map<String, Object?>,
    );

    expect(request.id, 7);
    expect(params.message.contextId, 's-9a2');
    expect(params.message.referenceTaskIds, ['task-2']);
    expect(action.name, 'commit_scenario');
    expect(action.context, {'scenarioPath': '/scenario'});
  });

  test('writes stream events in the kinds genui_a2a reads', () {
    const submitted = A2aStreamEvent.task(
      id: 'task-3',
      contextId: 's-9a2',
      status: TaskStatus(state: TaskState.submitted),
    );
    const completed = A2aStreamEvent.statusUpdate(
      taskId: 'task-3',
      contextId: 's-9a2',
      status: TaskStatus(
        state: TaskState.completed,
        message: A2aMessage(
          role: A2aRole.agent,
          messageId: 'm-1',
          parts: [
            A2aPart.text(text: 'Your limit is set by the loan-to-value cap.'),
            A2aPart.data(
              data: {'version': 'v0.9'},
              metadata: {'mimeType': 'application/json+a2ui'},
            ),
          ],
        ),
      ),
      isFinal: true,
    );

    expect(roundTrip(submitted), {
      'kind': 'task',
      'id': 'task-3',
      'contextId': 's-9a2',
      'status': {'state': 'submitted'},
    });
    expect(roundTrip(completed), {
      'kind': 'status-update',
      'taskId': 'task-3',
      'contextId': 's-9a2',
      'status': {
        'state': 'completed',
        'message': {
          'role': 'agent',
          'parts': [
            {
              'kind': 'text',
              'text': 'Your limit is set by the loan-to-value cap.',
            },
            {
              'kind': 'data',
              'data': {'version': 'v0.9'},
              'metadata': {'mimeType': 'application/json+a2ui'},
            },
          ],
          'messageId': 'm-1',
          'kind': 'message',
        },
      },
      'final': true,
    });
    expect(A2aStreamEvent.fromJson(roundTrip(completed)), completed);
  });

  test('writes JSON-RPC results and errors and reads them back', () {
    const error = JsonRpcErrorResponse(
      id: 7,
      error: JsonRpcError(
        code: -32001,
        message: 'Your Gemini quota is used up',
        data: {'code': 'gemini_quota_exhausted', 'retryAfterSeconds': 40},
      ),
    );

    expect(roundTrip(error), {
      'jsonrpc': '2.0',
      'id': 7,
      'error': {
        'code': -32001,
        'message': 'Your Gemini quota is used up',
        'data': {'code': 'gemini_quota_exhausted', 'retryAfterSeconds': 40},
      },
    });
    expect(JsonRpcResponse.fromJson(roundTrip(error)), error);
    expect(
      JsonRpcResponse.fromJson({
        'jsonrpc': '2.0',
        'id': 'c-1',
        'result': {'kind': 'task'},
      }),
      isA<JsonRpcResult>(),
    );
  });

  test('refuses parts Homeward does not accept', () {
    expect(
      () => A2aPart.fromJson({
        'kind': 'file',
        'file': {'uri': 'https://example.com/a.pdf'},
      }),
      throwsA(anything),
    );
  });
}
