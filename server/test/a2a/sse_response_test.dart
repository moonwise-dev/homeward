import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/a2a/sse_response.dart';
import 'package:test/test.dart';

void main() {
  test('frames each JSON-RPC response as one unbuffered SSE event', () async {
    final response = sseResponse(
      Stream.fromIterable(const [
        JsonRpcResult(
          id: 7,
          result: {'kind': 'task', 'id': 'task-1'},
        ),
        JsonRpcErrorResponse(
          id: 7,
          error: JsonRpcError(code: -32001, message: 'Busy'),
        ),
      ]),
    );

    expect(response.headers['content-type'], 'text/event-stream');
    expect(response.headers['cache-control'], 'no-cache');
    expect(response.context['shelf.io.buffer_output'], isFalse);
    expect(
      await response.readAsString(),
      'data: ${jsonEncode({
        'jsonrpc': '2.0',
        'id': 7,
        'result': {'kind': 'task', 'id': 'task-1'},
      })}\n\n'
      'data: ${jsonEncode({
        'jsonrpc': '2.0',
        'id': 7,
        'error': {'code': -32001, 'message': 'Busy'},
      })}\n\n',
    );
  });
}
