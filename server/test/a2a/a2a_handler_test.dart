import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/a2a/a2a_handler.dart';
import 'package:homeward_server/a2a/task_registry.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/agent/turn/tool_belt.dart';
import 'package:homeward_server/agent/turn/turn_orchestrator.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/gemini/gemini_exception.dart';
import 'package:homeward_server/request/request_values.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../agent/turn/scripted_interactions.dart';
import '../support/test_markets.dart';
import '../support/test_research.dart';

void main() {
  final prompts = PromptAssembler.load(Directory('prompts'));
  final catalog = CatalogValidator(homewardCatalogDocument());
  late InMemorySessionRepository sessions;

  setUp(() async {
    sessions = InMemorySessionRepository(newId: () => 's-1');
    await sessions.create('uid-1');
  });

  A2aHandler handlerFor(ScriptedInteractions script) => A2aHandler(
    turns: TurnOrchestrator(
      sessions: sessions,
      createInteraction: script.call,
      prompts: prompts,
      tools: ToolBelt(homewardTools(testMarkets, testResearch)),
      catalog: catalog,
      now: () => DateTime.utc(2026, 9, 17, 12),
    ),
    tasks: TaskRegistry(retention: Duration.zero),
    newTaskId: () => 'task-1',
  );

  Request rpc(
    String method,
    Map<String, Object?> params, {
    String uid = 'uid-1',
    String? apiKey = 'key',
    bool extension = true,
  }) {
    final request = Request(
      'POST',
      Uri.parse('http://localhost/a2a'),
      body: jsonEncode({
        'jsonrpc': '2.0',
        'id': 7,
        'method': method,
        'params': params,
      }),
      headers: {if (extension) A2uiExtension.header: A2uiExtension.uri},
    ).withCallerUid(uid);
    return apiKey == null ? request : request.withGeminiKey(apiKey);
  }

  Map<String, Object?> textMessage(String text) => {
    'message': {
      'role': 'user',
      'parts': [
        {'kind': 'text', 'text': text},
      ],
      'messageId': 'm-1',
      'contextId': 's-1',
      'kind': 'message',
    },
  };

  Future<List<Map<String, Object?>>> events(Response response) async => [
    await for (final event in decodeSse(response.read()))
      jsonDecode(event.data) as Map<String, Object?>,
  ];

  Future<Map<String, Object?>> body(Response response) async =>
      jsonDecode(await response.readAsString()) as Map<String, Object?>;

  test(
    'streams a turn as a task, working updates, and a final status',
    () async {
      final handler = handlerFor(
        ScriptedInteractions([reply('i1', text: 'Where are you buying?')]),
      );

      final response = await handler(rpc('message/stream', textMessage('Hi')));
      final results = [
        for (final event in await events(response))
          event['result']! as Map<String, Object?>,
      ];

      expect(response.headers['content-type'], 'text/event-stream');
      expect(results.first, {
        'kind': 'task',
        'id': 'task-1',
        'contextId': 's-1',
        'status': {'state': 'submitted'},
      });
      final states = [
        for (final result in results) (result['status']! as Map)['state'],
      ];
      expect(states.first, 'submitted');
      expect(states.skip(1).take(states.length - 2), everyElement('working'));
      expect(states.last, 'completed');
      expect(results.last['final'], isTrue);
      expect(
        jsonEncode(results.last),
        contains('"text":"Where are you buying?"'),
      );

      final task = await body(
        await handler(rpc('tasks/get', {'id': 'task-1'})),
      );
      expect(
        (task['result']! as Map)['status'],
        containsPair('state', 'completed'),
      );
      expect(
        await body(
          await handler(rpc('tasks/get', {'id': 'task-1'}, uid: 'uid-2')),
        ),
        containsPair('error', {'code': -32001, 'message': 'Task not found'}),
      );
    },
  );

  test(
    'hands an action and its surface data to the model',
    () async {
      final script = ScriptedInteractions([reply('i1', text: 'Saved.')]);
      final handler = handlerFor(script);

      await events(
        await handler(
          rpc('message/stream', {
            'message': {
              'role': 'user',
              'parts': [
                {
                  'kind': 'data',
                  'data': {
                    'version': 'v0.9',
                    'action': {
                      'surfaceId': 't1-start',
                      'name': 'keep_home',
                      'sourceComponentId': 'keep',
                      'timestamp': '2026-09-17T10:00:00.000',
                      'context': {'homeId': 'h1'},
                    },
                  },
                },
              ],
              'messageId': 'm-2',
              'contextId': 's-1',
              'metadata': {
                'a2uiClientDataModel': {
                  'version': 'v0.9',
                  'surfaces': {
                    't1-start': {'notes': 'A garden for the dog'},
                  },
                },
              },
            },
          }),
        ),
      );

      final input = jsonEncode(script.requests.first.input.toJson());
      expect(input, contains('keep_home'));
      expect(input, contains('A garden for the dog'));
    },
  );

  test(
    'ends a failed turn with a JSON-RPC error carrying the Homeward code',
    () async {
      final handler = handlerFor(
        ScriptedInteractions([
          failing(
            GeminiQuotaExhausted(
              'Quota',
              resetsAt: DateTime.utc(2026, 9, 17, 13),
            ),
          ),
        ]),
      );

      final all = await events(
        await handler(rpc('message/stream', textMessage('Hi'))),
      );

      expect(all.last, {
        'jsonrpc': '2.0',
        'id': 7,
        'error': {
          'code': -32000,
          'message': 'Your Gemini key has reached a request limit',
          'data': {'code': 'gemini_quota_exhausted', 'retryAfterSeconds': 3600},
        },
      });
    },
  );

  test('cancels a running turn and frees the session', () async {
    final gate = Completer<void>();
    final handler = handlerFor(
      ScriptedInteractions([silentUntil(gate.future)]),
    );

    final stream = await handler(rpc('message/stream', textMessage('Hi')));
    final received = events(stream);
    await pumpEventQueue();
    final canceled = await body(
      await handler(rpc('tasks/cancel', {'id': 'task-1'})),
    );

    expect((canceled['result']! as Map)['status'], {'state': 'canceled'});
    final states = [
      for (final event in await received)
        ((event['result']! as Map)['status']! as Map)['state'],
    ];
    expect(states, ['submitted', 'working', 'canceled']);
    expect(await sessions.lease('s-1'), isTrue);
    expect(
      await body(await handler(rpc('tasks/cancel', {'id': 'task-1'}))),
      containsPair('error', containsPair('code', -32002)),
    );
  });

  test('refuses requests the protocol does not allow', () async {
    final handler = handlerFor(ScriptedInteractions([]));

    Future<Object?> errorFor(Request request) async =>
        (await body(await handler(request)))['error'];

    expect(
      await errorFor(
        rpc('message/stream', textMessage('Hi'), extension: false),
      ),
      containsPair('code', -32600),
    );
    expect(
      await errorFor(rpc('message/stream', textMessage('Hi'), apiKey: null)),
      containsPair('data', {'code': 'gemini_key_missing'}),
    );
    expect(
      await errorFor(
        rpc('message/stream', {
          'message': {'role': 'user'},
        }),
      ),
      containsPair('code', -32602),
    );
    expect(
      await errorFor(rpc('message/send', textMessage('Hi'))),
      containsPair('code', -32601),
    );
    expect(
      await errorFor(
        Request('POST', Uri.parse('http://localhost/a2a'), body: '{'),
      ),
      containsPair('code', -32700),
    );
  });
}
