import 'dart:convert';

import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/request/request_values.dart';
import 'package:homeward_server/sessions/sessions_handler.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final sessions = InMemorySessionRepository(newId: () => 's-1');
  final handler = SessionsHandler(sessions);
  final request = Request('POST', Uri.parse('http://localhost/api/sessions'));

  test('creates an empty plan owned by the caller', () async {
    final response = await handler.create(request.withCallerUid('uid-1'));

    expect(response.statusCode, 201);
    expect(jsonDecode(await response.readAsString()), {
      'ok': true,
      'data': {'sessionId': 's-1'},
    });
    expect((await sessions.find('s-1'))?.ownerUid, 'uid-1');
  });

  test('refuses a caller without a verified identity', () async {
    final response = await handler.create(request);

    expect(response.statusCode, 401);
    expect(jsonDecode(await response.readAsString()), {
      'ok': false,
      'error': {
        'code': 'unauthenticated',
        'message': 'Sign in again to continue',
      },
    });
  });
}
