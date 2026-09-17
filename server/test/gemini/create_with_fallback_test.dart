import 'dart:async';

import 'package:homeward_server/gemini/create_with_fallback.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/interaction_cancelled.dart';
import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_input.dart';
import 'package:homeward_server/gemini/interaction_request.dart';
import 'package:homeward_server/gemini/interactions_client.dart';
import 'package:homeward_server/gemini/model_circuits.dart';
import 'package:test/test.dart';

import 'fixture_http_client.dart';

void main() {
  const preferred = 'gemini-3.8-flash';
  const fallback = 'gemini-3.5-flash';
  const request = InteractionRequest(input: InteractionInput.text('Hello'));
  var clock = DateTime.utc(2026, 9, 17, 10);

  ModelCircuits circuits() => ModelCircuits(
    models: const [preferred, fallback],
    cooldown: const Duration(minutes: 5),
    now: () => clock,
  );

  Stream<InteractionEvent> run(
    Map<String, FixtureResponse> byModel,
    ModelCircuits modelCircuits, {
    List<RecordedRequest>? recorded,
    Future<void>? cancellation,
  }) => createWithFallback(
    client: InteractionsClient(
      httpClient: fixtureClient(
        (body) => byModel[body['model']],
        recorded: recorded,
      ),
      headersDeadline: const Duration(seconds: 5),
      firstStepDeadline: const Duration(seconds: 5),
    ),
    circuits: modelCircuits,
    apiKey: 'AQ.test',
    request: request,
    cancellation: cancellation,
  );

  setUp(() => clock = DateTime.utc(2026, 9, 17, 10));

  test('an overloaded model falls back once and cools down', () async {
    final modelCircuits = circuits();
    final events = await run({
      preferred: fixture('stream_error_high_demand.sse'),
      fallback: fixture('stream_text.sse'),
    }, modelCircuits).toList();

    expect(
      events.whereType<ModelFailed>().single.model,
      preferred,
    );
    expect(events.whereType<InteractionCreated>().last.model, fallback);
    expect(events.last, isA<InteractionCompleted>());
    expect(modelCircuits.healthyModels, [fallback]);

    clock = clock.add(const Duration(minutes: 5));
    expect(modelCircuits.healthyModels, [preferred, fallback]);
  });

  test('does not fall back once output has reached the buyer', () async {
    final recorded = <RecordedRequest>[];
    await expectLater(
      run(
        {
          preferred: sse(
            'event: step.delta\ndata: {"index":1,"delta":{"type":"text","text":"Hi"},"event_type":"step.delta"}\n\n'
            'event: error\ndata: {"error":{"code":"api_error","message":"overloaded"},"event_type":"error"}\n\n',
          ),
          fallback: fixture('stream_text.sse'),
        },
        circuits(),
        recorded: recorded,
      ).drain<void>(),
      throwsA(isA<GeminiUnavailable>()),
    );
    expect(recorded.map((request) => request.body['model']), [preferred]);
  });

  test(
    'a cancelled turn aborts the stream without blaming the model',
    () async {
      final recorded = <RecordedRequest>[];
      final cancellation = Completer<void>();
      final modelCircuits = circuits();
      final events = StreamIterator(
        run(
          {
            preferred: fixture(
              'stream_stalled_after_created.sse',
              keepOpen: true,
            ),
            fallback: fixture('stream_text.sse'),
          },
          modelCircuits,
          recorded: recorded,
          cancellation: cancellation.future,
        ),
      );

      expect(await events.moveNext(), isTrue);
      cancellation.complete();

      await expectLater(
        events.moveNext(),
        throwsA(isA<InteractionCancelled>()),
      );
      expect(recorded, hasLength(1));
      expect(modelCircuits.healthyModels, [preferred, fallback]);
    },
  );

  test('never falls back on a key or quota error', () async {
    final recorded = <RecordedRequest>[];
    await expectLater(
      run(
        {
          preferred: fixture(
            'error_free_tier_request_quota_429.json',
            status: 429,
          ),
          fallback: fixture('stream_text.sse'),
        },
        circuits(),
        recorded: recorded,
      ).drain<void>(),
      throwsA(isA<GeminiQuotaExhausted>()),
    );
    expect(recorded, hasLength(1));
  });

  test(
    'fails when the last healthy model fails or every model cools down',
    () async {
      final modelCircuits = circuits()..open(preferred);
      await expectLater(
        run({
          fallback: fixture('error_high_demand_500.json', status: 500),
        }, modelCircuits).drain<void>(),
        throwsA(isA<GeminiUnavailable>()),
      );
      await expectLater(
        run(const {}, modelCircuits).drain<void>(),
        throwsA(
          isA<GeminiUnavailable>().having(
            (error) => error.message,
            'message',
            contains('cooling down'),
          ),
        ),
      );
    },
  );
}
