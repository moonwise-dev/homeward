import 'package:homeward_server/gemini/function_declaration.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_input.dart';
import 'package:homeward_server/gemini/interaction_request.dart';
import 'package:homeward_server/gemini/interactions_client.dart';
import 'package:homeward_server/gemini/pacific_midnight.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

import 'fixture_http_client.dart';

void main() {
  const apiKey = 'AQ.test-key-never-logged';
  const model = 'gemini-3.5-flash';
  final now = DateTime.utc(2026, 9, 17, 10);
  const request = InteractionRequest(input: InteractionInput.text('Hello'));

  InteractionsClient clientFor(
    http.Client httpClient, {
    Duration deadline = const Duration(seconds: 5),
  }) => InteractionsClient(
    httpClient: httpClient,
    headersDeadline: deadline,
    firstStepDeadline: deadline,
    now: () => now,
  );

  Stream<InteractionEvent> create(
    FixtureResponse response, {
    InteractionRequest request = request,
  }) => clientFor(
    fixtureClient((_) => response),
  ).create(apiKey: apiKey, model: model, request: request);

  test('streams text and completion', () async {
    final events = await create(fixture('stream_text.sse')).toList();

    expect(events.first, isA<InteractionCreated>());
    expect(
      events.whereType<TextDelta>().map((event) => event.text).join(),
      'one, two, three, four, five',
    );
    expect(
      (events.last as InteractionCompleted).status,
      'completed',
    );
    expect((events.last as InteractionCompleted).usage?['total_tokens'], 164);
  });

  test('assembles a streamed function call and requires action', () async {
    final events = await create(fixture('stream_function_call.sse')).toList();

    expect(
      events.whereType<FunctionCall>().single,
      const InteractionEvent.functionCall(
        callId: 'call_153395',
        name: 'resolve_market',
        arguments: {'query': 'Funchal'},
      ),
    );
    expect((events.last as InteractionCompleted).status, 'requires_action');
  });

  test('sends the request shape, key header, and SSE query', () async {
    final recorded = <RecordedRequest>[];
    await clientFor(
          fixtureClient((_) => fixture('stream_text.sse'), recorded: recorded),
        )
        .create(
          apiKey: apiKey,
          model: model,
          request: const InteractionRequest(
            input: InteractionInput.functionResults([
              FunctionResult(
                callId: 'call_153395',
                name: 'resolve_market',
                result: {'marketId': 'PT-30'},
              ),
            ]),
            systemInstruction: 'You are Homeward.',
            tools: [
              FunctionDeclaration(
                name: 'resolve_market',
                description: 'Resolve a place.',
                parameters: {'type': 'object'},
              ),
            ],
            thinkingLevel: 'low',
            previousInteractionId: 'v1_previous',
          ),
        )
        .drain<void>();

    final sent = recorded.single;
    expect(sent.request.url.queryParameters['alt'], 'sse');
    expect(sent.request.headers['x-goog-api-key'], apiKey);
    expect(sent.body, {
      'model': model,
      'input': [
        {
          'type': 'function_result',
          'call_id': 'call_153395',
          'name': 'resolve_market',
          'result': {'marketId': 'PT-30'},
        },
      ],
      'system_instruction': 'You are Homeward.',
      'tools': [
        {
          'type': 'function',
          'name': 'resolve_market',
          'description': 'Resolve a place.',
          'parameters': {'type': 'object'},
        },
      ],
      'generation_config': {'thinking_level': 'low'},
      'previous_interaction_id': 'v1_previous',
      'store': true,
      'stream': true,
    });
  });

  group('errors', () {
    final continuing = request.copyWith(previousInteractionId: 'v1_gone');
    final cases = <(String, FixtureResponse, InteractionRequest, Matcher)>[
      (
        'an invalid key',
        fixture('error_invalid_key_401.json', status: 401),
        request,
        isA<GeminiKeyInvalid>(),
      ),
      (
        'the free-tier daily cap',
        fixture('error_free_tier_request_quota_429.json', status: 429),
        request,
        isA<GeminiQuotaExhausted>()
            .having(
              (error) => error.resetsAt,
              'resetsAt',
              nextPacificMidnight(now),
            )
            .having((error) => error.perModel, 'perModel', isTrue),
      ),
      (
        'a quota that is not per model',
        fixture('error_search_grounding_quota_429.json', status: 429),
        request,
        isA<GeminiQuotaExhausted>().having(
          (error) => error.perModel,
          'perModel',
          isFalse,
        ),
      ),
      (
        'depleted prepaid credits',
        fixture('error_prepayment_credits_depleted_429.json', status: 429),
        request,
        isA<GeminiCreditsDepleted>(),
      ),
      (
        'a deleted previous interaction',
        fixture('error_deleted_previous_interaction_404.json', status: 404),
        continuing,
        isA<GeminiHistoryMissing>(),
      ),
      (
        'an unknown model',
        fixture('error_unknown_model_404.json', status: 404),
        request,
        isA<GeminiRequestInvalid>(),
      ),
      (
        'a malformed key',
        fixture('error_malformed_key_400.json', status: 400),
        request,
        isA<GeminiKeyInvalid>(),
      ),
      (
        'an invalid tool',
        fixture('error_invalid_tool_400.json', status: 400),
        request,
        isA<GeminiRequestInvalid>(),
      ),
      (
        'high demand',
        fixture('error_high_demand_500.json', status: 500),
        request,
        isA<GeminiUnavailable>().having((error) => error.model, 'model', model),
      ),
      (
        'a quota event mid-stream',
        fixture('stream_error_quota_exceeded.sse'),
        request,
        isA<GeminiQuotaExhausted>().having(
          (error) => error.perModel,
          'perModel',
          isTrue,
        ),
      ),
      (
        'an overload event mid-stream',
        fixture('stream_error_high_demand.sse'),
        request,
        isA<GeminiUnavailable>(),
      ),
    ];

    for (final (name, response, sentRequest, matcher) in cases) {
      test('maps $name without echoing the key', () async {
        await expectLater(
          create(response, request: sentRequest).drain<void>(),
          throwsA(
            allOf(
              matcher,
              isA<GeminiException>().having(
                (error) => error.toString(),
                'toString',
                isNot(contains(apiKey)),
              ),
            ),
          ),
        );
      });
    }
  });

  group('deadlines', () {
    const short = Duration(milliseconds: 100);

    test('gives up when headers do not arrive', () async {
      await expectLater(
        clientFor(
          fixtureClient((_) => null),
          deadline: short,
        ).create(apiKey: apiKey, model: model, request: request).drain<void>(),
        throwsA(
          isA<GeminiUnavailable>().having(
            (error) => error.message,
            'message',
            contains('headers'),
          ),
        ),
      );
    });

    test('gives up when the stream stalls after creation', () async {
      final events = <InteractionEvent>[];
      await expectLater(
        clientFor(
              fixtureClient(
                (_) =>
                    fixture('stream_stalled_after_created.sse', keepOpen: true),
              ),
              deadline: short,
            )
            .create(apiKey: apiKey, model: model, request: request)
            .forEach(events.add),
        throwsA(
          isA<GeminiUnavailable>().having(
            (error) => error.message,
            'message',
            contains('step'),
          ),
        ),
      );
      expect(events.single, isA<InteractionCreated>());
    });
  });
}
