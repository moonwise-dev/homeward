import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/agent/turn/tool_belt.dart';
import 'package:homeward_server/agent/turn/tools_done_note.dart';
import 'package:homeward_server/agent/turn/turn_event.dart';
import 'package:homeward_server/agent/turn/turn_input.dart';
import 'package:homeward_server/errors/homeward_failure.dart';
import 'package:homeward_server/agent/turn/turn_orchestrator.dart';
import 'package:homeward_server/agent/turn/turn_settings.dart';
import 'package:homeward_server/data/models/session.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_input.dart';
import 'package:homeward_server/gemini/tool_choice.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';
import 'scripted_interactions.dart';

void main() {
  final prompts = PromptAssembler.load(Directory('prompts'));
  final catalog = CatalogValidator(homewardCatalogDocument());
  late InMemorySessionRepository sessions;

  setUp(() => sessions = InMemorySessionRepository(newId: () => 's-1'));

  TurnOrchestrator orchestrator(
    ScriptedInteractions script, {
    TurnSettings settings = const TurnSettings(),
  }) => TurnOrchestrator(
    sessions: sessions,
    createInteraction: script.call,
    prompts: prompts,
    tools: ToolBelt(tools: homewardTools, markets: realMarkets),
    catalog: catalog,
    settings: settings,
    now: () => DateTime.utc(2026, 9, 17, 12),
  );

  Future<Session> sessionWith(Plan plan) async {
    final session = await sessions.create('uid-1');
    await sessions.save(session.copyWith(plan: plan));
    return session;
  }

  Stream<TurnEvent> send(TurnOrchestrator agent, [String text = 'Hi']) =>
      agent.run(
        sessionId: 's-1',
        uid: 'uid-1',
        input: TurnInput.text(text),
        apiKey: 'key',
      );

  String a2ui(String surfaceId, List<Map<String, Object?>> components) => [
    '```a2ui',
    jsonEncode({
      'version': 'v0.9',
      'createSurface': {
        'surfaceId': surfaceId,
        'catalogId': homewardCatalogId,
        'sendDataModel': true,
      },
    }),
    jsonEncode({
      'version': 'v0.9',
      'updateComponents': {'surfaceId': surfaceId, 'components': components},
    }),
    '```',
    '',
  ].join('\n');

  List<Map<String, Object?>> incomeForm({Object? value}) => [
    {
      'id': 'root',
      'component': 'MoneyInput',
      'label': 'Household net income',
      'value': value ?? {'path': '/profile/netMonthlyIncome'},
      'currency': {'path': '/market/currency'},
    },
  ];

  List<Map<String, Object?>> messagesIn(List<TurnEvent> events) => [
    for (final event in events)
      if (event case TurnMessage(:final message)) message,
  ];

  test(
    'resolves the market, pre-runs its rules, and draws a seeded form',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        reply(
          'i1',
          calls: const [
            FunctionCall(
              callId: 'c1',
              name: 'resolve_market',
              arguments: {'placeName': 'Södermalm', 'countryCode': 'SE'},
            ),
          ],
        ),
        reply(
          'i2',
          text:
              'Sweden it is. Tell me about your income.\n'
              '${a2ui('t1-profile', surfaceExamples.first.components)}',
        ),
      ]);

      final events = await send(
        orchestrator(script),
        'A 3:a in Södermalm',
      ).toList();

      expect(events.first, const TurnEvent.working());
      expect(
        events.last,
        const TurnEvent.completed('Sweden it is. Tell me about your income.'),
      );
      final messages = messagesIn(events);
      expect(messages.map((message) => message.keys.last), [
        'createSurface',
        'updateDataModel',
        'updateDataModel',
        'updateComponents',
      ]);
      expect(
        messages.first['createSurface'],
        containsPair('sendDataModel', true),
      );
      expect(
        [
          for (final message in messages.skip(1).take(2))
            (message['updateDataModel']! as Map<String, Object?>)['path'],
        ],
        ['/profile', '/market'],
      );

      final [first, second] = script.requests;
      expect(first.previousInteractionId, isNull);
      expect(first.tools.map((tool) => tool.name), [
        'resolve_market',
        'load_market',
        'propose_profile',
        'propose_scenario',
      ]);
      expect(first.toolChoice, isNull);
      expect(second.previousInteractionId, 'i1');
      expect(second.toolChoice, ToolChoice.none);
      expect(second.systemInstruction, contains('"load_market": {'));
      final input = second.input as FunctionResultsInput;
      expect(input.results.single.result, contains('selectedMarket'));
      expect(input.note, toolsDoneNote);

      final saved = (await sessions.find('s-1'))!;
      expect(saved.plan.marketId, MarketId.parse('SE'));
      expect(saved.turnCount, 1);
      expect(saved.lastInteractionId, 'i2');
      expect(saved.messages, messages);
    },
  );

  test(
    'runs tool calls in dependency order and answers in call order',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        reply(
          'i1',
          calls: const [
            FunctionCall(
              callId: 'profile',
              name: 'propose_profile',
              arguments: {
                'netMonthlyIncome': {'amount': 62000},
              },
            ),
            FunctionCall(
              callId: 'market',
              name: 'resolve_market',
              arguments: {'placeName': 'Södermalm', 'countryCode': 'SE'},
            ),
          ],
        ),
        reply('i2', text: 'Noted.'),
      ]);

      await send(orchestrator(script)).drain<void>();

      final results =
          (script.requests[1].input as FunctionResultsInput).results;
      expect(results.map((result) => result.callId), ['profile', 'market']);
      expect(results.first.result, {
        'accepted': ['netMonthlyIncome'],
        'rejected': <Object?>[],
      });
      expect(
        (await sessions.find('s-1'))!
            .plan
            .profileDraft
            ?.netMonthlyIncome
            ?.currency,
        Currency.parse('SEK'),
      );
    },
  );

  test(
    'offers tools for one round and pre-runs affordability for a proposal',
    () async {
      await sessionWith(
        Plan(marketId: MarketId.parse('SE'), profile: stockholmProfile),
      );
      FunctionCall proposal(String callId, int price) => FunctionCall(
        callId: callId,
        name: 'propose_scenario',
        arguments: {
          'price': {'amount': price},
        },
      );
      final script = ScriptedInteractions([
        reply('i1', calls: [proposal('first', 4500000)]),
        reply(
          'i2',
          text: 'Here is what that price means.',
          calls: [proposal('second', 3000000)],
        ),
      ]);

      final events = await send(orchestrator(script)).toList();

      final [first, second] = script.requests;
      expect(
        first.tools.map((tool) => tool.name),
        isNot(contains('compute_affordability')),
      );
      expect(second.toolChoice, ToolChoice.none);
      expect(second.systemInstruction, contains('"compute_affordability": {'));
      expect(
        events.last,
        const TurnEvent.completed('Here is what that price means.'),
      );
      expect(
        (await sessions.find('s-1'))!.plan.scenarioDraft?.price,
        stockholmScenario.price,
      );
    },
  );

  test(
    'takes back a failed model\'s draft and continues on the fallback',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        (_) => Stream.fromIterable([
          const InteractionEvent.textDelta('Draft that will vanish\n'),
          const FunctionCall(
            callId: 'c1',
            name: 'resolve_market',
            arguments: {'placeName': 'Atlantis'},
          ),
          const InteractionEvent.modelFailed(
            model: 'gemini-3.5-flash',
            reason: GeminiUnavailable('overloaded'),
          ),
          const InteractionEvent.textDelta('Where are you buying?'),
          const InteractionEvent.completed(
            interactionId: 'i1',
            status: 'completed',
          ),
        ]),
      ]);

      final events = await send(orchestrator(script)).toList();

      expect(events, [
        const TurnEvent.working(),
        const TurnEvent.text('Draft that will vanish'),
        const TurnEvent.text(''),
        const TurnEvent.text('Where are you buying?'),
        const TurnEvent.completed('Where are you buying?'),
      ]);
      expect(script.requests, hasLength(1));
    },
  );

  test('sends rejections back and forwards the corrected surface once', () async {
    await sessionWith(Plan(marketId: MarketId.parse('SE')));
    final script = ScriptedInteractions([
      reply('i1', text: a2ui('t1-income', incomeForm(value: 62000))),
      reply(
        'i2',
        text:
            '```a2ui\n${jsonEncode({
              'version': 'v0.9',
              'updateComponents': {'surfaceId': 't1-income', 'components': incomeForm()},
            })}\n```\n',
      ),
    ]);

    final events = await send(orchestrator(script)).toList();

    final correction = (script.requests[1].input as TextInput).text;
    expect(correction, contains('VALIDATION_FAILED'));
    expect(correction, contains('t1-income'));
    expect(script.requests[1].previousInteractionId, 'i1');
    expect(messagesIn(events).map((message) => message.keys.last), [
      'createSurface',
      'updateDataModel',
      'updateDataModel',
      'updateComponents',
    ]);
    expect(events.last, isA<TurnCompleted>());
  });

  test('ends with a retry surface when corrections run out', () async {
    await sessionWith(Plan(marketId: MarketId.parse('SE')));
    final invalid = reply('i1', text: a2ui('t1-income', incomeForm(value: 1)));
    final script = ScriptedInteractions([invalid, invalid]);

    final events = await send(
      orchestrator(script, settings: const TurnSettings(maxCorrections: 1)),
    ).toList();

    expect(script.requests, hasLength(2));
    expect(
      [for (final message in messagesIn(events)) jsonEncode(message)],
      [contains('"t1-retry"'), contains('"t1-retry"')],
    );
    expect(events.last, isA<TurnCompleted>());
  });

  test('fails a turn on a quota error and releases the session', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      failing(
        GeminiQuotaExhausted('Quota', resetsAt: DateTime.utc(2026, 9, 18, 7)),
      ),
      reply('i2', text: 'Hello again.'),
    ]);
    final agent = orchestrator(script);

    final failed = await send(agent).toList();
    final retried = await send(agent).toList();

    expect(failed.last, isA<TurnFailed>());
    final failure = (failed.last as TurnFailed).failure;
    expect(failure.code, HomewardErrorCode.geminiQuotaExhausted);
    expect(failure.retryAfter, const Duration(hours: 19));
    expect(retried.last, const TurnEvent.completed('Hello again.'));
    expect((await sessions.find('s-1'))!.turnCount, 2);
  });

  test('starts fresh history when the previous interaction is gone', () async {
    final session = await sessions.create('uid-1');
    await sessions.save(session.copyWith(lastInteractionId: 'expired'));
    final script = ScriptedInteractions([
      failing(const GeminiHistoryMissing('not_found')),
      reply('i2', text: 'Where are you buying?'),
    ]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests.map((request) => request.previousInteractionId), [
      'expired',
      null,
    ]);
    expect(events.last, const TurnEvent.completed('Where are you buying?'));
  });

  test('refuses foreign sessions and a second turn while one runs', () async {
    await sessions.create('uid-1');
    final gate = Completer<void>();
    final script = ScriptedInteractions([silentUntil(gate.future)]);
    final agent = orchestrator(script);

    final running = StreamIterator(send(agent));
    expect(await running.moveNext(), isTrue);

    expect(
      await agent
          .run(
            sessionId: 's-1',
            uid: 'uid-2',
            input: const TurnInput.text('Hi'),
            apiKey: 'key',
          )
          .toList(),
      [const TurnEvent.failed(HomewardFailure.sessionNotFound)],
    );
    expect(await send(agent).toList(), [
      const TurnEvent.failed(HomewardFailure.turnInProgress),
    ]);

    gate.complete();
    while (await running.moveNext()) {}
    expect(await sessions.lease('s-1'), isTrue);
  });
}
