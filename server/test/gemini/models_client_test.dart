import 'dart:async';
import 'dart:io';

import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/models_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  const apiKey = 'AQ.test-key-never-logged';
  const model = 'gemini-3.5-flash';
  final requests = <http.BaseRequest>[];

  setUp(requests.clear);

  ModelsClient clientFor(
    int status,
    String fixture, {
    Duration deadline = const Duration(seconds: 5),
  }) => ModelsClient(
    httpClient: MockClient.streaming((request, _) async {
      requests.add(request);
      final body = File('test/fixtures/models/$fixture').readAsBytesSync();
      return http.StreamedResponse(Stream.value(body), status);
    }),
    deadline: deadline,
    now: () => DateTime.utc(2026, 9, 17, 10),
  );

  Future<void> lookUp(ModelsClient client) =>
      client.ensureAvailable(apiKey: apiKey, model: model);

  test('looks up the model with the key in a header', () async {
    await lookUp(clientFor(200, 'model_found_200.json'));

    final request = requests.single;
    expect(request.method, 'GET');
    expect(
      request.url.toString(),
      'https://generativelanguage.googleapis.com/v1beta/models/$model',
    );
    expect(request.url.query, isEmpty);
    expect(request.headers['x-goog-api-key'], apiKey);
  });

  test('reports a key Gemini rejects', () async {
    await expectLater(
      lookUp(clientFor(400, 'error_invalid_key_400.json')),
      throwsA(isA<GeminiKeyInvalid>()),
    );
  });

  test('reports a model the key cannot find as an invalid request', () async {
    await expectLater(
      lookUp(clientFor(404, 'error_unknown_model_404.json')),
      throwsA(isA<GeminiRequestInvalid>()),
    );
  });

  test('gives up when Gemini does not answer in time', () async {
    final client = ModelsClient(
      httpClient: MockClient.streaming((request, _) async {
        final abortTrigger = (request as http.Abortable).abortTrigger!;
        await abortTrigger;
        throw http.RequestAbortedException(request.url);
      }),
      deadline: const Duration(milliseconds: 10),
    );

    await expectLater(
      lookUp(client),
      throwsA(
        isA<GeminiUnavailable>().having(
          (error) => error.model,
          'model',
          model,
        ),
      ),
    );
  });
}
