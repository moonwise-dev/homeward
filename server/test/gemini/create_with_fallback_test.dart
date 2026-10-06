import 'dart:async';

import 'package:homeward_server/gemini/create_with_fallback.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/interaction_cancelled.dart';
import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_input.dart';
import 'package:homeward_server/gemini/interaction_request.dart';
import 'package:homeward_server/gemini/interactions_client.dart';
import 'package:homeward_server/gemini/model_caps.dart';
import 'package:homeward_server/gemini/model_circuits.dart';
import 'package:test/test.dart';

import 'fixture_http_client.dart';

void main() {
  const preferred = 'gemini-3.8-flash';
  const fallback = 'gemini-3.5-flash';
  const last = 'gemini-3.5-flash-lite';
  const request = InteractionRequest(input: InteractionInput.text('Hello'));
  var clock = DateTime.utc(2026, 9, 17, 10);

  ModelCircuits circuits({List<String> models = const [preferred, fallback]}) =>
      ModelCircuits(
        models: models,
        cooldown: const Duration(minutes: 5),
        now: () => clock,
      );

  Stream<InteractionEvent> run(
    Map<String, FixtureResponse> byModel,
    ModelCircuits modelCircuits, {
    ModelCaps? caps,
    String apiKey = 'AQ.test',
    List<RecordedRequest>? recorded,
    Future<void>? cancellation,
    bool Function()? canFallBack,
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
    caps: caps ?? ModelCaps(now: () => clock),
    apiKey: apiKey,
    request: request,
    canFallBack: canFallBack ?? () => true,
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

  test('falls back mid-stream while the caller can take output back', () async {
    final recorded = <RecordedRequest>[];
    final events = await run(
      {
        preferred: sse(
          'event: step.delta\ndata: {"index":1,"delta":{"type":"text","text":"Hi"},"event_type":"step.delta"}\n\n'
          'event: error\ndata: {"error":{"code":"api_error","message":"overloaded"},"event_type":"error"}\n\n',
        ),
        fallback: fixture('stream_text.sse'),
      },
      circuits(),
      recorded: recorded,
    ).toList();

    expect(recorded.map((request) => request.body['model']), [
      preferred,
      fallback,
    ]);
    expect(events.first, const InteractionEvent.textDelta('Hi'));
    expect(events.whereType<ModelFailed>().single.model, preferred);
    expect(events.last, isA<InteractionCompleted>());
  });

  test('does not fall back once the caller has committed output', () async {
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
        canFallBack: () => false,
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

  test(
    'a model at its free request limit falls back and is skipped for that key '
    'for a minute',
    () async {
      final caps = ModelCaps(now: () => clock);
      final recorded = <RecordedRequest>[];
      final byModel = {
        preferred: fixture(
          'error_free_tier_request_quota_429.json',
          status: 429,
        ),
        fallback: fixture('stream_text.sse'),
      };
      List<Object?> modelsTried() => [
        for (final request in recorded) request.body['model'],
      ];

      final events = await run(
        byModel,
        circuits(),
        caps: caps,
        recorded: recorded,
      ).toList();
      expect(events.whereType<ModelFailed>().single.model, preferred);
      expect(events.last, isA<InteractionCompleted>());

      await run(
        byModel,
        circuits(),
        caps: caps,
        recorded: recorded,
      ).drain<void>();
      await run(
        byModel,
        circuits(),
        caps: caps,
        apiKey: 'AQ.other',
        recorded: recorded,
      ).drain<void>();
      clock = clock.add(const Duration(minutes: 1));
      await run(
        byModel,
        circuits(),
        caps: caps,
        recorded: recorded,
      ).drain<void>();

      expect(modelsTried(), [
        preferred,
        fallback,
        fallback,
        preferred,
        fallback,
        preferred,
        fallback,
      ]);
    },
  );

  test('moves past every model refused at a request limit', () async {
    final recorded = <RecordedRequest>[];
    final refused = fixture(
      'error_free_tier_request_quota_429.json',
      status: 429,
    );

    final events = await run(
      {preferred: refused, fallback: refused, last: fixture('stream_text.sse')},
      circuits(models: const [preferred, fallback, last]),
      recorded: recorded,
    ).toList();

    expect(
      [for (final request in recorded) request.body['model']],
      [
        preferred,
        fallback,
        last,
      ],
    );
    expect(events.whereType<ModelFailed>().map((event) => event.model), [
      preferred,
      fallback,
    ]);
    expect(events.last, isA<InteractionCompleted>());
  });

  test('retries an overloaded round on one more model only', () async {
    final recorded = <RecordedRequest>[];
    final overloaded = fixture('error_high_demand_500.json', status: 500);

    await expectLater(
      run(
        {
          preferred: overloaded,
          fallback: overloaded,
          last: fixture('stream_text.sse'),
        },
        circuits(models: const [preferred, fallback, last]),
        recorded: recorded,
      ).drain<void>(),
      throwsA(isA<GeminiUnavailable>()),
    );
    expect(
      [for (final request in recorded) request.body['model']],
      [
        preferred,
        fallback,
      ],
    );
  });

  test('asks the capped model again when every model is capped', () async {
    final refusal = GeminiQuotaExhausted(
      'Quota',
      resetsAt: clock,
      perModel: true,
    );
    final caps = ModelCaps(now: () => clock)
      ..cap('AQ.test', preferred, refusal)
      ..cap('AQ.test', fallback, refusal);
    final recorded = <RecordedRequest>[];

    await expectLater(
      run(
        {
          preferred: fixture(
            'error_free_tier_request_quota_429.json',
            status: 429,
          ),
          fallback: fixture(
            'error_free_tier_request_quota_429.json',
            status: 429,
          ),
        },
        circuits(),
        caps: caps,
        recorded: recorded,
      ).drain<void>(),
      throwsA(isA<GeminiQuotaExhausted>()),
    );
    expect(
      [for (final request in recorded) request.body['model']],
      [
        preferred,
        fallback,
      ],
    );
  });

  for (final (name, response) in [
    ('an invalid key', fixture('error_invalid_key_401.json', status: 401)),
    (
      'a quota that is not per model',
      fixture('error_search_grounding_quota_429.json', status: 429),
    ),
    (
      'depleted prepaid credits',
      fixture('error_prepayment_credits_depleted_429.json', status: 429),
    ),
  ]) {
    test('never falls back on $name', () async {
      final recorded = <RecordedRequest>[];
      await expectLater(
        run(
          {preferred: response, fallback: fixture('stream_text.sse')},
          circuits(),
          recorded: recorded,
        ).drain<void>(),
        throwsA(isA<GeminiException>()),
      );
      expect(recorded, hasLength(1));
    });
  }

  test('fails when the last healthy model fails', () async {
    final modelCircuits = circuits()..open(preferred);
    await expectLater(
      run({
        fallback: fixture('error_high_demand_500.json', status: 500),
      }, modelCircuits).drain<void>(),
      throwsA(isA<GeminiUnavailable>()),
    );
  });

  test(
    'tries only the model that recovers first when every model cools down',
    () async {
      final recorded = <RecordedRequest>[];
      final modelCircuits = circuits()..open(fallback);
      clock = clock.add(const Duration(minutes: 1));
      modelCircuits.open(preferred);

      final events = await run(
        {
          preferred: fixture('stream_text.sse'),
          fallback: fixture('stream_text.sse'),
        },
        modelCircuits,
        recorded: recorded,
      ).toList();

      expect(events.last, isA<InteractionCompleted>());
      expect(
        [for (final request in recorded) request.body['model']],
        [
          fallback,
        ],
      );
    },
  );
}
