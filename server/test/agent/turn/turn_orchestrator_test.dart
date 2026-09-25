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
import 'package:homeward_server/tools/agent_tool.dart';
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
    List<AgentTool> tools = homewardTools,
  }) => TurnOrchestrator(
    sessions: sessions,
    createInteraction: script.call,
    prompts: prompts,
    tools: ToolBelt(tools: tools, markets: realMarkets),
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

  Stream<TurnEvent> sendAction(TurnOrchestrator agent) => agent.run(
    sessionId: 's-1',
    uid: 'uid-1',
    input: const TurnInput.action(
      ClientAction(
        name: 'commit_profile',
        surfaceId: 't0-profile',
        sourceComponentId: 'save',
        context: {'profilePath': '/profile'},
      ),
      surfaceData: {},
    ),
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

  List<Map<String, Object?>> allMessagesIn(List<TurnEvent> events) => [
    for (final event in events)
      if (event case TurnMessage(:final message)) message,
  ];

  List<Map<String, Object?>> messagesIn(List<TurnEvent> events) =>
      allMessagesIn(events);

  test(
    'resolves the market, loads its rules, and draws a seeded form',
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
            FunctionCall(
              callId: 'c2',
              name: 'load_market',
              arguments: {'marketId': 'SE'},
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
      expect(second.toolChoice, isNull);
      expect(second.systemInstruction, isNot(contains('"preRun"')));
      final input = second.input as FunctionResultsInput;
      expect(input.results.map((result) => result.name), [
        'resolve_market',
        'load_market',
      ]);
      expect(input.results.first.result, contains('selectedMarket'));
      expect(input.note, isNull);

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
      expect(second.toolChoice, isNull);
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
    'lets a model that calls one tool at a time reach its surfaces',
    () async {
      await sessions.create('uid-1');
      FunctionCall call(String name, Map<String, Object?> arguments) =>
          FunctionCall(callId: name, name: name, arguments: arguments);
      final script = ScriptedInteractions([
        reply(
          'i1',
          calls: [
            call('resolve_market', const {
              'placeName': 'Södermalm',
              'countryCode': 'SE',
            }),
          ],
        ),
        reply(
          'i2',
          calls: [
            call('propose_profile', const {'adults': 2}),
          ],
        ),
        reply(
          'i3',
          calls: [
            call('propose_scenario', const {
              'price': {'amount': 4500000},
            }),
          ],
        ),
        reply('i4', text: 'Tell me about your household.'),
      ]);

      final events = await send(orchestrator(script)).toList();

      expect(script.requests, hasLength(4));
      expect(script.requests[3].toolChoice, ToolChoice.none);
      expect(
        (script.requests[3].input as FunctionResultsInput).note,
        toolsDoneNote,
      );
      expect(
        events.last,
        const TurnEvent.completed('Tell me about your household.'),
      );
      final saved = (await sessions.find('s-1'))!.plan;
      expect(saved.profileDraft?.adults, 2);
      expect(saved.scenarioDraft, isNotNull);
    },
  );

  test(
    'a round that asks again for what it has ends the tool rounds',
    () async {
      await sessions.create('uid-1');
      final calling = reply(
        'i1',
        calls: const [
          FunctionCall(
            callId: 'c',
            name: 'resolve_market',
            arguments: {'placeName': 'Sodermalm', 'countryCode': 'SE'},
          ),
        ],
      );
      final script = ScriptedInteractions([
        calling,
        calling,
        reply('i3', text: 'Tell me about your household.'),
      ]);

      final events = await send(orchestrator(script)).toList();

      expect(script.requests, hasLength(3));
      expect(script.requests[2].toolChoice, ToolChoice.none);
      expect(
        (script.requests[2].input as FunctionResultsInput).note,
        toolsDoneNote,
      );
      expect(
        events.last,
        const TurnEvent.completed('Tell me about your household.'),
      );
    },
  );

  test('offers a retry surface when a turn draws nothing at all', () async {
    await sessions.create('uid-1');
    final calling = reply(
      'i1',
      calls: const [
        FunctionCall(
          callId: 'c',
          name: 'resolve_market',
          arguments: {'placeName': 'Södermalm', 'countryCode': 'SE'},
        ),
      ],
    );
    final script = ScriptedInteractions([calling, calling, reply('i3')]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests, hasLength(3));
    expect(
      [for (final message in messagesIn(events)) jsonEncode(message)],
      [contains('"t1-retry"'), contains('"t1-retry"')],
    );
    expect(events.last, const TurnEvent.completed(''));
  });

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

  test(
    'sends rejections back and forwards the corrected surface once',
    () async {
      await sessionWith(
        Plan(marketId: MarketId.parse('SE'), story: stockholmChosen),
      );
      final script = ScriptedInteractions([
        reply('i1', text: a2ui('t1-income', incomeForm(value: 62000))),
        reply(
          'i2',
          text: jsonEncode({
            'messages': [
              {
                'version': 'v0.9',
                'updateComponents': {
                  'surfaceId': 't1-income',
                  'components': incomeForm(),
                },
              },
            ],
          }),
        ),
      ]);

      final events = await send(orchestrator(script)).toList();

      final correction = (script.requests[1].input as TextInput).text;
      expect(correction, contains('VALIDATION_FAILED'));
      expect(correction, contains('t1-income'));
      expect(script.requests[1].previousInteractionId, 'i1');
      expect(script.requests[0].responseSchema, isNull);
      expect(
        jsonEncode(script.requests[1].responseSchema),
        contains('component_MoneyInput'),
      );
      expect(messagesIn(events).map((message) => message.keys.last), [
        'createSurface',
        'updateDataModel',
        'updateDataModel',
        'updateComponents',
      ]);
      expect(events.last, isA<TurnCompleted>());
    },
  );

  test('a correction Gemini refuses to constrain runs again freely', () async {
    await sessionWith(
      Plan(marketId: MarketId.parse('SE'), story: stockholmChosen),
    );
    final script = ScriptedInteractions([
      reply('i1', text: a2ui('t1-income', incomeForm(value: 62000))),
      failing(
        const GeminiRequestInvalid('Request contains an invalid argument.'),
      ),
      reply(
        'i3',
        text: [
          '```a2ui',
          jsonEncode({
            'version': 'v0.9',
            'updateComponents': {
              'surfaceId': 't1-income',
              'components': incomeForm(),
            },
          }),
          '```',
          '',
        ].join('\n'),
      ),
    ]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests[1].responseSchema, isNotNull);
    expect(script.requests[2].responseSchema, isNull);
    expect(
      messagesIn(events).map((message) => message.keys.last),
      contains('updateComponents'),
    );
    expect(events.last, isA<TurnCompleted>());
  });

  test(
    'asks for a form that covers every fact the market still needs',
    () async {
      await sessionWith(
        Plan(marketId: MarketId.parse('SE'), story: stockholmChosen),
      );
      final incomeOnly = [
        {
          'id': 'root',
          'component': 'Column',
          'children': ['income', 'save'],
        },
        {...incomeForm().single, 'id': 'income'},
        {
          'id': 'save',
          'component': 'Button',
          'child': 'save_label',
          'action': {
            'event': {
              'name': 'commit_profile',
              'context': {'profilePath': '/profile'},
            },
          },
        },
        {'id': 'save_label', 'component': 'Text', 'text': 'Save'},
      ];
      final script = ScriptedInteractions([
        reply('i1', text: a2ui('t1-income', incomeOnly)),
      ]);

      final events = await send(orchestrator(script)).toList();

      expect(script.requests, hasLength(1));
      final drawn = messagesIn(events).firstWhere(
        (message) => message.containsKey('updateComponents'),
      );
      final components =
          ((drawn['updateComponents']! as Map<String, Object?>)['components']!
                  as List<Object?>)
              .cast<Map<String, Object?>>();
      expect(
        components.map((component) => component['id']),
        containsAll(['asked-household', 'asked-savings']),
      );
      expect(
        (components.last['children']! as List<Object?>).last,
        'save',
      );
      expect(events.last, isA<TurnCompleted>());
    },
  );

  test(
    'asks again when an action is answered with text and no surface',
    () async {
      await sessionWith(
        Plan(marketId: MarketId.parse('SE'), story: stockholmChosen),
      );
      final script = ScriptedInteractions([
        reply('i1', text: 'Here is what that means for you.'),
        reply('i2', text: a2ui('t1-income', incomeForm())),
      ]);

      final events = await sendAction(orchestrator(script)).toList();

      expect(script.requests, hasLength(2));
      expect(
        (script.requests[1].input as TextInput).text,
        contains('profileFields still open'),
      );
      expect(
        messagesIn(events).map((message) => message.keys.last),
        contains('updateComponents'),
      );
      expect(events.last, isA<TurnCompleted>());
    },
  );

  test('ends with a retry surface when corrections run out', () async {
    await sessionWith(
      Plan(marketId: MarketId.parse('SE'), story: stockholmChosen),
    );
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

  test(
    'a composition that fails validation falls back to the measured homes',
    () async {
      await sessionWith(Plan(story: stockholmStory));
      final invalid = reply(
        'i1',
        text: a2ui('t1-fit', [
          {'id': 'root', 'component': 'FitMatrix'},
        ]),
      );
      final script = ScriptedInteractions([invalid, invalid]);

      final events = await send(
        orchestrator(
          script,
          settings: const TurnSettings(maxCorrections: 1),
          tools: [const _MeasuredHomes(), ...homewardTools],
        ),
      ).toList();
      final forwarded = [
        for (final message in messagesIn(events)) jsonEncode(message),
      ];

      expect(forwarded, isNot(contains(contains('"t1-retry"'))));
      expect(forwarded, contains(contains('"LifestyleCommuteMap"')));
      expect(
        forwarded.where((message) => message.contains('"t1-homes"')),
        isEmpty,
      );
      expect(
        forwarded,
        contains(allOf(contains('"t1-fit"'), contains('"/assessment"'))),
      );
      expect(events.last, isA<TurnCompleted>());
    },
  );

  test('streams each measuring step before the model draws', () async {
    await sessionWith(Plan(story: stockholmStory));
    final script = ScriptedInteractions([reply('i1', text: 'Here they are.')]);

    final events = await send(
      orchestrator(script, tools: [const _MeasuredHomes(), ...homewardTools]),
    ).toList();
    final steps = [
      for (final event in events)
        if (event case TurnProgress(:final progress)) progress.steps,
    ];

    expect(steps, [
      [
        const ResearchStep(
          label: 'Timing the trip',
          state: ResearchStepState.running,
        ),
      ],
      [
        const ResearchStep(
          label: 'Timing the trip',
          state: ResearchStepState.done,
        ),
      ],
    ]);
    expect(
      events.indexWhere((event) => event is TurnProgress),
      lessThan(events.indexWhere((event) => event is TurnText)),
    );
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

  test(
    'starts the turn over in a new conversation when Gemini refuses to '
    'continue a stored one',
    () async {
      final session = await sessions.create('uid-1');
      await sessions.save(session.copyWith(lastInteractionId: 'stored'));
      const call = FunctionCall(
        callId: 'c1',
        name: 'propose_profile',
        arguments: {'age': 35},
      );
      final script = ScriptedInteractions([
        reply('i1', calls: const [call]),
        failing(
          const GeminiRequestInvalid(
            'Please ensure that function response turn comes immediately '
            'after a function call turn.',
          ),
        ),
        reply('i3', calls: const [call]),
        reply('i4', text: 'Tell me about your income.'),
      ]);

      final events = await send(orchestrator(script), 'Hi again').toList();

      expect(script.requests.map((request) => request.previousInteractionId), [
        'stored',
        'i1',
        null,
        'i3',
      ]);
      expect(script.requests[2].input, const InteractionInput.text('Hi again'));
      expect(
        events.last,
        const TurnEvent.completed('Tell me about your income.'),
      );
      expect((await sessions.find('s-1'))!.lastInteractionId, 'i4');
    },
  );

  test('fails the turn when the new conversation is refused too', () async {
    final session = await sessions.create('uid-1');
    await sessions.save(session.copyWith(lastInteractionId: 'stored'));
    const refused = GeminiRequestInvalid(
      'Request contains an invalid argument.',
    );
    final script = ScriptedInteractions([failing(refused), failing(refused)]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests.map((request) => request.previousInteractionId), [
      'stored',
      null,
    ]);
    expect(events.last, isA<TurnFailed>());
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

final class _MeasuredHomes extends AgentTool {
  const _MeasuredHomes();

  @override
  String get name => 'assess_story';

  @override
  Map<String, Object?>? settledArguments(ToolContext context) => const {};

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) => context.steps.track(
    'Timing the trip',
    () async => ToolResult(
      modelResult: const {},
      seeds: {
        assessmentSlice.name: assessStory(
          stockholmStory,
          stockholmStoryMeasurements,
        ).toJson(),
      },
    ),
  );
}
