import 'dart:convert';

import 'package:homeward_server/middleware/internal_error_middleware.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final request = Request('GET', Uri.parse('http://localhost/boom'));

  test('turns an unhandled error into an internal error envelope', () async {
    final records = <LogRecord>[];
    final subscription = Logger.root.onRecord.listen(records.add);
    addTearDown(subscription.cancel);

    final handler = internalErrorMiddleware()(
      (_) => throw StateError('secret detail'),
    );
    final response = await handler(request);
    final body = await response.readAsString();

    expect(response.statusCode, 500);
    expect(jsonDecode(body), {
      'ok': false,
      'error': {'code': 'internal', 'message': 'Internal error'},
    });
    expect(body, isNot(contains('secret detail')));
    expect(records.single.level, Level.SEVERE);
    expect(records.single.error, isA<StateError>());
  });

  test('lets hijacked requests through', () {
    final handler = internalErrorMiddleware()(
      (_) => throw const HijackException(),
    );

    expect(() => handler(request), throwsA(isA<HijackException>()));
  });
}
