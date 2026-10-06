import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/agent/turn/tool_belt.dart';
import 'package:homeward_server/agent/turn/tools_done_note.dart';
import 'package:homeward_server/agent/turn/turn_event.dart';
import 'package:homeward_server/agent/turn/retry_notice.dart';
import 'package:homeward_server/agent/turn/turn_input.dart';
import 'package:homeward_server/agent/turn/turn_orchestrator.dart';
import 'package:homeward_server/agent/turn/turn_settings.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/errors/homeward_failure.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/gemini/interaction_event.dart';
import 'package:homeward_server/gemini/interaction_input.dart';
import 'package:homeward_server/gemini/tool_choice.dart';
import 'package:homeward_server/tools/agent_tool.dart';
import 'package:homeward_server/tools/tool_context.dart';
import 'package:test/test.dart';

import 'scripted_interactions.dart';

void main() {
  final prompts = PromptAssembler.load(Directory('prompts'));
  final catalog = CatalogValidator(homewardCatalogDocument());
  late InMemorySessionRepository sessions;

  setUp(() => sessions = InMemorySessionRepository(newId: () => 's-1'));

  TurnOrchestrator orchestrator(
    ScriptedInteractions script, {
    TurnSettings settings = const TurnSettings(maxFinishingRounds: 0),
  }) => TurnOrchestrator(
    sessions: sessions,
    createInteraction: script.call,
    prompts: prompts,
    tools: const ToolBelt([_Locate()]),
    catalog: catalog,
    settings: settings,
    now: () => DateTime.utc(2026, 9, 17, 12),
  );

  Stream<TurnEvent> send(TurnOrchestrator agent, [String text = 'Hi']) =>
      agent.run(
        sessionId: 's-1',
        uid: 'uid-1',
        input: TurnInput.text(text),
        apiKey: 'key',
      );

  FunctionCall locate(String place) =>
      FunctionCall(callId: place, name: 'locate', arguments: {'place': place});

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

  List<Map<String, Object?>> note({String property = 'text'}) => [
    {'id': 'root', 'component': 'Text', property: 'A home near KTH'},
  ];

  List<Map<String, Object?>> messagesIn(List<TurnEvent> events) => [
    for (final event in events)
      if (event case TurnMessage(:final message)) message,
  ];

  test(
    'runs the tools the model calls and seeds its surface with their results',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        reply('i1', calls: [locate('KTH')]),
        reply(
          'i2',
          text:
              'KTH it is.\n'
              '${a2ui('plan', [
                {
                  'id': 'root',
                  'component': 'Text',
                  'text': {'path': '/places/kth/name'},
                },
              ])}',
        ),
      ]);

      final events = await send(
        orchestrator(script),
        'I study at KTH',
      ).toList();

      expect(events.first, const TurnEvent.working());
      expect(events.last, const TurnEvent.completed('KTH it is.'));
      final messages = messagesIn(events);
      expect(messages.map((message) => message.keys.last), [
        'createSurface',
        'updateDataModel',
        'updateComponents',
      ]);
      expect(messages[1]['updateDataModel'], containsPair('path', '/places'));

      final [first, second] = script.requests;
      expect(first.previousInteractionId, isNull);
      expect(first.tools.map((tool) => tool.name), ['locate']);
      expect(first.toolChoice, isNull);
      expect(second.previousInteractionId, 'i1');
      final input = second.input as FunctionResultsInput;
      expect(input.results.single.result, {'found': 'KTH'});
      expect(input.note, isNull);

      final saved = (await sessions.find('s-1'))!;
      expect(saved.turnCount, 1);
      expect(saved.lastInteractionId, 'i2');
      expect(saved.messages, messages);
    },
  );

  test('answers tool calls in the order the model made them', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      reply('i1', calls: [locate('KTH'), locate('Odenplan')]),
      reply('i2', text: 'Noted.'),
    ]);

    await send(orchestrator(script)).drain<void>();

    final results = (script.requests[1].input as FunctionResultsInput).results;
    expect(results.map((result) => result.callId), ['KTH', 'Odenplan']);
  });

  test('streams each measuring step while a tool runs', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      reply('i1', calls: [locate('KTH')]),
      reply('i2', text: 'Found it.'),
    ]);

    final events = await send(orchestrator(script)).toList();
    final steps = [
      for (final event in events)
        if (event case TurnProgress(:final progress)) progress.steps,
    ];

    expect(steps, [
      [
        const ResearchStep(
          label: 'Finding KTH on the map',
          state: ResearchStepState.running,
        ),
      ],
      [
        const ResearchStep(
          label: 'Finding KTH on the map',
          state: ResearchStepState.done,
        ),
      ],
    ]);
    expect(
      events.indexWhere((event) => event is TurnProgress),
      lessThan(events.indexWhere((event) => event is TurnText)),
    );
  });

  test('ends the tool rounds once they run out, and says so', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      reply('i1', calls: [locate('KTH')]),
      reply('i2', calls: [locate('Odenplan')]),
      reply('i3', calls: [locate('Solna')]),
      reply('i4', text: 'Here is your week.'),
    ]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests, hasLength(4));
    expect(script.requests[3].toolChoice, ToolChoice.none);
    expect(
      (script.requests[3].input as FunctionResultsInput).note,
      toolsDoneNote,
    );
    expect(events.last, const TurnEvent.completed('Here is your week.'));
  });

  test(
    'hands an action to the model with its context and surface data',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([reply('i1', text: 'Kept.')]);

      await orchestrator(script)
          .run(
            sessionId: 's-1',
            uid: 'uid-1',
            input: const TurnInput.action(
              ClientAction(
                name: 'keep_home',
                surfaceId: 'plan',
                sourceComponentId: 'keep',
                context: {'homeId': 'h1'},
              ),
              surfaceData: {'notes': 'A garden for the dog'},
            ),
            apiKey: 'key',
          )
          .drain<void>();

      final input = (script.requests.single.input as TextInput).text;
      expect(input, contains('The buyer used a control'));
      expect(input, contains('"action":"keep_home"'));
      expect(input, contains('"homeId":"h1"'));
      expect(input, contains('A garden for the dog'));
      expect(
        (await sessions.find('s-1'))!.turns.single.input,
        isA<RecordedAction>(),
      );
    },
  );

  test('a reply with no plan and no ask is asked once to finish it', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      reply('i1', text: 'A bostadsrätt is a share in an association.'),
      reply('i2', text: jsonEncode({'messages': <Object?>[]})),
    ]);

    final events = await send(
      orchestrator(script, settings: const TurnSettings()),
      'What is a bostadsrätt?',
    ).toList();

    expect(script.requests, hasLength(2));
    expect(
      (script.requests[1].input as TextInput).text,
      allOf(
        contains('drew no plan panel'),
        contains('drew no inline ask'),
        isNot(contains('no words')),
      ),
    );
    expect(script.requests[1].previousInteractionId, 'i1');
    expect(script.requests[1].responseSchema, isNotNull);
    expect(messagesIn(events), isEmpty);
    expect(
      events.last,
      const TurnEvent.completed('A bostadsrätt is a share in an association.'),
    );
  });

  test('offers a retry notice when a turn gives nothing at all', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([reply('i1')]);

    final events = await send(orchestrator(script)).toList();

    expect(messagesIn(events), isEmpty);
    expect(events.last, const TurnEvent.completed(retryNotice));
  });

  test(
    "takes back a failed model's draft and continues on the fallback",
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        (_) => Stream.fromIterable([
          const InteractionEvent.textDelta('Draft that will vanish\n'),
          const FunctionCall(
            callId: 'c1',
            name: 'locate',
            arguments: {'place': 'Atlantis'},
          ),
          const InteractionEvent.modelFailed(
            model: 'gemini-3.5-flash',
            reason: GeminiUnavailable('overloaded'),
          ),
          const InteractionEvent.textDelta('Where are you moving?'),
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
        const TurnEvent.text('Where are you moving?'),
        const TurnEvent.completed('Where are you moving?'),
      ]);
      expect(script.requests, hasLength(1));
    },
  );

  test(
    'sends rejections back and forwards the corrected surface once',
    () async {
      await sessions.create('uid-1');
      final script = ScriptedInteractions([
        reply('i1', text: a2ui('plan', note(property: 'label'))),
        reply(
          'i2',
          text: jsonEncode({
            'messages': [
              {
                'version': 'v0.9',
                'updateComponents': {
                  'surfaceId': 'plan',
                  'components': note(),
                },
              },
            ],
          }),
        ),
      ]);

      final events = await send(orchestrator(script)).toList();

      final correction = (script.requests[1].input as TextInput).text;
      expect(correction, contains('VALIDATION_FAILED'));
      expect(correction, contains('plan'));
      expect(script.requests[1].previousInteractionId, 'i1');
      expect(script.requests[0].responseSchema, isNull);
      expect(
        jsonEncode(script.requests[1].responseSchema),
        contains('component_Text'),
      );
      expect(messagesIn(events).map((message) => message.keys.last), [
        'createSurface',
        'updateComponents',
      ]);
      expect(events.last, isA<TurnCompleted>());
    },
  );

  test('a correction Gemini refuses to constrain runs again freely', () async {
    await sessions.create('uid-1');
    final script = ScriptedInteractions([
      reply('i1', text: a2ui('plan', note(property: 'label'))),
      failing(
        const GeminiRequestInvalid('Request contains an invalid argument.'),
      ),
      reply(
        'i3',
        text: [
          '```a2ui',
          jsonEncode({
            'version': 'v0.9',
            'updateComponents': {'surfaceId': 'plan', 'components': note()},
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

  test('ends with a retry notice when corrections run out', () async {
    await sessions.create('uid-1');
    final invalid = reply(
      'i1',
      text: a2ui('plan', note(property: 'label')),
    );
    final script = ScriptedInteractions([invalid, invalid]);

    final events = await send(
      orchestrator(
        script,
        settings: const TurnSettings(maxCorrections: 1, maxFinishingRounds: 0),
      ),
    ).toList();

    expect(script.requests, hasLength(2));
    expect(messagesIn(events), isEmpty);
    expect(
      events.last,
      isA<TurnCompleted>().having(
        (completed) => completed.text,
        'text',
        endsWith(retryNotice),
      ),
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
      reply('i2', text: 'Where are you moving?'),
    ]);

    final events = await send(orchestrator(script)).toList();

    expect(script.requests.map((request) => request.previousInteractionId), [
      'expired',
      null,
    ]);
    expect(events.last, const TurnEvent.completed('Where are you moving?'));
  });

  test(
    'starts the turn over in a new conversation when Gemini refuses to '
    'continue a stored one',
    () async {
      final session = await sessions.create('uid-1');
      await sessions.save(session.copyWith(lastInteractionId: 'stored'));
      final script = ScriptedInteractions([
        reply('i1', calls: [locate('KTH')]),
        failing(
          const GeminiRequestInvalid(
            'Please ensure that function response turn comes immediately '
            'after a function call turn.',
          ),
        ),
        reply('i3', calls: [locate('KTH')]),
        reply('i4', text: 'KTH it is.'),
      ]);

      final events = await send(orchestrator(script), 'Hi again').toList();

      expect(script.requests.map((request) => request.previousInteractionId), [
        'stored',
        'i1',
        null,
        'i3',
      ]);
      expect(script.requests[2].input, const InteractionInput.text('Hi again'));
      expect(events.last, const TurnEvent.completed('KTH it is.'));
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

final class _Locate extends AgentTool {
  const _Locate();

  @override
  String get name => 'locate';

  @override
  String get description => 'Finds a place on the map.';

  @override
  Map<String, Object?> get parameters => const {
    'type': 'object',
    'properties': {
      'place': {'type': 'string'},
    },
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) => context.steps.track(
    'Finding ${arguments['place']} on the map',
    () async => ToolResult(
      modelResult: {'found': arguments['place']},
      seeds: const {
        'places': {
          'kth': {'name': 'KTH'},
        },
      },
    ),
  );
}
