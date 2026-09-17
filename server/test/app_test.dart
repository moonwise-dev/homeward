import 'dart:convert';

import 'package:homeward_server/app.dart';
import 'package:homeward_server/config/server_config.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final app = buildApp(
    ServerConfig.fromEnvironment({
      'HOMEWARD_PUBLIC_URL': 'https://homeward.example.run.app',
    }),
  );

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

  test('serves the agent card with the A2UI extension and its url', () async {
    final response = await get('/.well-known/agent-card.json');
    final card =
        jsonDecode(await response.readAsString()) as Map<String, Object?>;

    expect(response.statusCode, 200);
    expect(card['url'], 'https://homeward.example.run.app/a2a');
    expect(card['protocolVersion'], isA<String>());
    expect(card['defaultInputModes'], isNotEmpty);
    expect(card['defaultOutputModes'], isNotEmpty);
    expect(card['capabilities'], {
      'streaming': true,
      'extensions': [
        {
          'uri': 'https://a2ui.org/a2a-extension/a2ui/v0.9',
          'required': true,
          'params': {
            'supportedCatalogIds': [
              'https://moonwise.se/homeward/catalogs/v1/catalog.json',
            ],
            'acceptsInlineCatalogs': false,
          },
        },
      ],
    });
    for (final skill in card['skills']! as List<Object?>) {
      expect((skill! as Map<String, Object?>)['tags'], isNotEmpty);
    }
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
