import 'package:common/common.dart';
import 'package:homeward_server/app.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../agent/turn/scripted_interactions.dart';
import '../support/test_providers.dart';

void main() {
  HomewardClient clientFor(ScriptedInteractions script) {
    final app = buildApp(testProviders(script: script));
    return HomewardClient(
      httpClient: MockClient.streaming((request, body) async {
        final response = await app(
          Request(
            request.method,
            request.url,
            headers: request.headers,
            body: body,
          ),
        );
        return http.StreamedResponse(
          response.read(),
          response.statusCode,
          headers: response.headers,
        );
      }),
      server: Uri.parse('http://localhost'),
    );
  }

  test('the app client reads a turn exactly as the server writes it', () async {
    final client = clientFor(
      ScriptedInteractions([
        reply(
          'i1',
          text:
              'Where are you buying?\n'
              '```a2ui\n'
              '{"version":"v0.9","createSurface":{"surfaceId":"plan",'
              '"catalogId":"$homewardCatalogId","sendDataModel":true}}\n'
              '{"version":"v0.9","updateComponents":{"surfaceId":"plan",'
              '"components":[{"id":"root","component":"Text",'
              '"text":"Tell me the city"}]}}\n'
              '```\n',
        ),
      ]),
    );

    final sessionId = await client.createSession();
    await client.verifyKey('gemini-key-1');
    final events = await client
        .send(
          sessionId: sessionId,
          geminiKey: 'gemini-key-1',
          request: const TurnRequest.text('Hi'),
        )
        .toList();

    expect(events.first, isA<AgentStarted>());
    expect(events.whereType<AgentText>().last.text, 'Where are you buying?');
    expect(
      [
        for (final event in events.whereType<AgentA2ui>())
          event.message.keys.last,
      ],
      ['createSurface', 'updateComponents'],
    );
    expect(events.last, const AgentEvent.completed('Where are you buying?'));
  });

  test('the app client surfaces a failed turn as its error code', () async {
    final client = clientFor(
      ScriptedInteractions([
        failing(const FormatException('scripted failure')),
      ]),
    );

    final sessionId = await client.createSession();

    await expectLater(
      client
          .send(
            sessionId: sessionId,
            geminiKey: 'gemini-key-1',
            request: const TurnRequest.text('Hi'),
          )
          .drain<void>(),
      throwsA(
        isA<HomewardApiException>().having(
          (error) => error.code,
          'code',
          HomewardErrorCode.internal,
        ),
      ),
    );
    await expectLater(
      client.verifyKey('AQ.wrong'),
      throwsA(
        isA<HomewardApiException>().having(
          (error) => error.code,
          'code',
          HomewardErrorCode.geminiKeyInvalid,
        ),
      ),
    );
  });
}
