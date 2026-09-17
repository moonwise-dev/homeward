import 'dart:convert';

import 'package:homeward_server/app.dart';
import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import 'agent/turn/scripted_interactions.dart';
import 'support/test_providers.dart';

void main() {
  const hosting = 'https://homeward-genui.web.app';
  const verifiedHeaders = {
    'authorization': 'Bearer id-token-1',
    'x-firebase-appcheck': 'app-check-1',
  };

  Handler app({
    Map<String, String> environment = const {},
    ScriptedInteractions? script,
  }) => buildApp(testProviders(environment: environment, script: script));

  Future<Response> send(
    Handler handler,
    String method,
    String path, {
    Map<String, String> headers = const {},
    String? body,
  }) async => handler(
    Request(
      method,
      Uri.parse('http://localhost$path'),
      headers: headers,
      body: body,
    ),
  );

  Future<Map<String, Object?>> json(Response response) async =>
      jsonDecode(await response.readAsString()) as Map<String, Object?>;

  test('health reports ok as json with a request id', () async {
    final response = await send(app(), 'GET', '/health');

    expect(response.statusCode, 200);
    expect(response.headers['content-type'], 'application/json');
    expect(
      response.headers['x-request-id'],
      matches(RegExp(r'^[0-9a-f]{16}$')),
    );
    expect(await json(response), {'status': 'ok'});
  });

  test('serves the agent card with the A2UI extension and its url', () async {
    final card = await json(
      await send(app(), 'GET', '/.well-known/agent-card.json'),
    );

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

  test('answers preflight for Hosting and local origins only', () async {
    final handler = app();

    Future<Response> preflight(String origin) => send(
      handler,
      'OPTIONS',
      '/a2a',
      headers: {
        'origin': origin,
        'access-control-request-method': 'POST',
      },
    );

    final hostingPreflight = await preflight(hosting);
    expect(hostingPreflight.statusCode, 204);
    expect(hostingPreflight.headers['access-control-allow-origin'], hosting);
    expect(hostingPreflight.headers['access-control-max-age'], '3600');
    expect(
      hostingPreflight.headers['access-control-allow-headers'],
      allOf(contains('x-homeward-gemini-key'), contains('x-a2a-extensions')),
    );
    expect((await preflight('http://localhost:61234')).statusCode, 204);
    expect((await preflight('https://evil.example')).statusCode, 403);
    expect((await preflight('http://localhost.evil.example')).statusCode, 403);
  });

  test('creates sessions only for verified callers', () async {
    final handler = app();

    final anonymous = await send(handler, 'POST', '/api/sessions');
    final withoutAppCheck = await send(
      handler,
      'POST',
      '/api/sessions',
      headers: {'authorization': 'Bearer id-token-1'},
    );
    final verified = await send(
      handler,
      'POST',
      '/api/sessions',
      headers: {...verifiedHeaders, 'origin': hosting},
    );

    expect(anonymous.statusCode, 401);
    expect(await json(anonymous), {
      'ok': false,
      'error': {
        'code': 'unauthenticated',
        'message': 'Sign in again to continue',
      },
    });
    expect(withoutAppCheck.statusCode, 401);
    expect(
      (await json(withoutAppCheck))['error'],
      containsPair('code', 'app_check_failed'),
    );
    expect(verified.statusCode, 201);
    expect(verified.headers['access-control-allow-origin'], hosting);
    expect(
      (await json(verified))['data'],
      containsPair('sessionId', isA<String>()),
    );
  });

  test('verifies Gemini keys only for verified callers', () async {
    final handler = app();

    Future<Response> verify(Map<String, String> headers) =>
        send(handler, 'POST', '/api/keys/verify', headers: headers);

    final anonymous = await verify({'x-homeward-gemini-key': 'gemini-key-1'});
    final missing = await verify(verifiedHeaders);
    final valid = await verify({
      ...verifiedHeaders,
      'x-homeward-gemini-key': 'gemini-key-1',
    });
    final invalid = await verify({
      ...verifiedHeaders,
      'x-homeward-gemini-key': 'AQ.wrong',
    });

    expect(anonymous.statusCode, 401);
    expect(missing.statusCode, 400);
    expect(
      (await json(missing))['error'],
      containsPair('code', 'gemini_key_missing'),
    );
    expect(valid.statusCode, 200);
    expect(await json(valid), {'ok': true, 'data': <String, Object?>{}});
    expect(invalid.statusCode, 422);
    expect(
      (await json(invalid))['error'],
      containsPair('code', 'gemini_key_invalid'),
    );
  });

  test('skips App Check when it is not enforced', () async {
    final response = await send(
      app(environment: {'HOMEWARD_APP_CHECK_ENFORCED': 'false'}),
      'POST',
      '/api/sessions',
      headers: {'authorization': 'Bearer id-token-1'},
    );

    expect(response.statusCode, 201);
  });

  test('answers A2A auth failures as JSON-RPC errors', () async {
    final response = await send(app(), 'POST', '/a2a', body: '{}');

    expect(response.statusCode, 401);
    expect(await json(response), {
      'jsonrpc': '2.0',
      'error': {
        'code': -32000,
        'message': 'Sign in again to continue',
        'data': {'code': 'unauthenticated'},
      },
    });
  });

  test('limits turns per caller and never logs keys or tokens', () async {
    final records = <LogRecord>[];
    final subscription = Logger.root.onRecord.listen(records.add);
    addTearDown(subscription.cancel);
    final handler = app();
    const secret = 'AQ.secret-gemini-key';

    Future<Response> call() => send(
      handler,
      'POST',
      '/a2a',
      headers: {...verifiedHeaders, 'x-homeward-gemini-key': secret},
      body: jsonEncode({
        'jsonrpc': '2.0',
        'id': 1,
        'method': 'tasks/get',
        'params': {'id': 'missing'},
      }),
    );

    final responses = [for (var i = 0; i < 31; i++) await call()];

    expect(responses.first.statusCode, 200);
    expect(responses.last.statusCode, 429);
    expect(
      ((await json(responses.last))['error']! as Map)['data'],
      {'code': 'rate_limited', 'retryAfterSeconds': inInclusiveRange(599, 600)},
    );
    final logged = records.map(
      (record) => '${record.message} ${record.object}',
    );
    expect(logged, isNotEmpty);
    expect(logged, everyElement(isNot(contains(secret))));
    expect(logged, everyElement(isNot(contains('id-token-1'))));
  });

  test('unknown routes are not found', () async {
    expect((await send(app(), 'GET', '/missing')).statusCode, 404);
  });
}
