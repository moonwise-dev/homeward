import 'dart:convert';

import 'package:homeward_server/app.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final app = buildApp();

  Future<Response> get(String path) =>
      Future.value(app(Request('GET', Uri.parse('http://localhost$path'))));

  test('health reports ok as json with a request id', () async {
    final response = await get('/health');

    expect(response.statusCode, 200);
    expect(response.headers['content-type'], 'application/json');
    expect(
      response.headers['x-request-id'],
      matches(RegExp(r'^[0-9a-f]{16}$')),
    );
    expect(jsonDecode(await response.readAsString()), {'status': 'ok'});
  });

  test('unknown routes are not found', () async {
    expect((await get('/missing')).statusCode, 404);
  });

  test('logs every request with its status and duration', () async {
    final records = <LogRecord>[];
    final subscription = Logger.root.onRecord.listen(records.add);
    addTearDown(subscription.cancel);

    await get('/health');

    expect(records.single.message, 'GET /health 200');
    expect(records.single.loggerName, 'http');
  });
}
