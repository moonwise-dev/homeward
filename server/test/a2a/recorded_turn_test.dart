import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/a2a/a2a_handler.dart';
import 'package:homeward_server/a2a/task_registry.dart';
import 'package:homeward_server/a2a/turn_wire.dart';
import 'package:homeward_server/agent/prompt/prompt_assembler.dart';
import 'package:homeward_server/agent/turn/tool_belt.dart';
import 'package:homeward_server/agent/turn/turn_orchestrator.dart';
import 'package:homeward_server/data/repository/in_memory_session_repository.dart';
import 'package:homeward_server/request/request_values.dart';
import 'package:homeward_server/tools/homeward_tools.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../agent/turn/scripted_interactions.dart';
import '../support/test_markets.dart';

void main() {
  final recording = File('../app/test/fixtures/recorded_turn.sse');

  test('the turn the app test replays is the turn the server streams', () async {
    final sessions = InMemorySessionRepository(newId: () => 's-1');
    await sessions.create('uid-1');
    var messages = 0;
    final handler = A2aHandler(
      turns: TurnOrchestrator(
        sessions: sessions,
        createInteraction: ScriptedInteractions([
          reply(
            'i1',
            text:
                'A flat in Södermalm for the two of you. Anything else the '
                'home has to have?\n'
                '```a2ui\n'
                '${[for (final message in _surface()) jsonEncode(message)].join('\n')}\n'
                '```\n',
          ),
        ]).call,
        prompts: PromptAssembler.load(Directory('prompts')),
        tools: ToolBelt(homewardTools(testMarkets)),
        catalog: CatalogValidator(homewardCatalogDocument()),
        now: () => DateTime.utc(2026, 9, 17, 12),
      ),
      tasks: TaskRegistry(retention: Duration.zero),
      newTaskId: () => 'task-1',
      wire: TurnWire(newMessageId: () => 'a-${++messages}'),
    );

    final response = await handler(
      Request(
        'POST',
        Uri.parse('http://localhost/a2a'),
        body: jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'method': 'message/stream',
          'params': {
            'message': {
              'role': 'user',
              'parts': [
                {
                  'kind': 'text',
                  'text':
                      'We are a couple in Stockholm looking at a 3-room flat '
                      'in Södermalm for about 4.5 million kronor',
                },
              ],
              'messageId': 'm-1',
              'contextId': 's-1',
              'kind': 'message',
            },
          },
        }),
        headers: {A2uiExtension.header: A2uiExtension.uri},
      ).withCallerUid('uid-1').withGeminiKey('key'),
    );
    final streamed = await response.readAsString();

    if (Platform.environment['RECORD'] == '1') {
      recording.writeAsStringSync(streamed);
    }
    expect(streamed, recording.readAsStringSync());
  });
}

List<Map<String, Object?>> _surface() => [
  {
    'version': 'v0.9',
    'createSurface': {
      'surfaceId': 'plan',
      'catalogId': homewardCatalogId,
      'sendDataModel': true,
    },
  },
  {
    'version': 'v0.9',
    'updateComponents': {
      'surfaceId': 'plan',
      'components': [
        {
          'id': 'root',
          'component': 'Column',
          'children': ['title', 'notes', 'done'],
        },
        {
          'id': 'title',
          'component': 'Text',
          'text': 'What the home has to have',
          'variant': 'h3',
        },
        {
          'id': 'notes',
          'component': 'TextField',
          'label': 'Anything else?',
          'value': {'path': '/notes'},
        },
        {
          'id': 'done',
          'component': 'Button',
          'child': 'done_label',
          'variant': 'primary',
          'action': {
            'event': {
              'name': 'confirm_story',
              'context': {
                'notes': {'path': '/notes'},
              },
            },
          },
        },
        {'id': 'done_label', 'component': 'Text', 'text': 'That is it'},
      ],
    },
  },
];
