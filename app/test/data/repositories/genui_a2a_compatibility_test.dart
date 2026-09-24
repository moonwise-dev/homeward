import 'dart:convert';
import 'dart:io';

import 'package:a2ui_core/a2ui_core.dart' as core;
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genui/genui.dart';
import 'package:genui_a2a/genui_a2a.dart';
import 'package:homeward/catalog/homeward_catalog.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() {
  late HttpServer server;
  late List<Map<String, Object?>> received;

  setUp(() async {
    received = [];
    final recorded = File('test/fixtures/recorded_turn.sse').readAsStringSync();
    server = await shelf_io.serve(
      (request) async {
        received.add(
          jsonDecode(await request.readAsString()) as Map<String, Object?>,
        );
        return Response.ok(
          recorded,
          headers: {'content-type': 'text/event-stream'},
        );
      },
      'localhost',
      0,
    );
  });

  tearDown(() => server.close(force: true));

  test('a genui_a2a client renders a Homeward turn', () async {
    final catalog = homewardGenuiCatalog();
    final surfaces = SurfaceController(catalogs: [catalog]);
    final connector = A2uiAgentConnector(
      url: Uri.parse('http://localhost:${server.port}/a2a'),
    );
    final messages = <core.A2uiMessage>[];
    final subscription = connector.stream.listen(messages.add);

    final text = await connector.connectAndSend(
      ChatMessage.user('A 3:a in Södermalm'),
      clientCapabilities: const A2UiClientCapabilities(
        supportedCatalogIds: [homewardCatalogId],
      ),
    );
    for (final message in messages) {
      surfaces.handleMessage(message);
    }
    await subscription.cancel();

    expect(
      received.single['params'],
      containsPair(
        'message',
        containsPair(
          'metadata',
          containsPair('a2uiClientCapabilities', {
            'v0.9': {
              'supportedCatalogIds': [homewardCatalogId],
            },
          }),
        ),
      ),
    );
    expect(text, 'Sweden is a curated market. Tell me about your household.');
    expect(
      [for (final message in messages) message.runtimeType.toString()],
      [
        'CreateSurfaceMessage',
        'UpdateDataModelMessage',
        'UpdateDataModelMessage',
        'UpdateComponentsMessage',
        'CreateSurfaceMessage',
        'UpdateDataModelMessage',
        'UpdateDataModelMessage',
        'UpdateDataModelMessage',
        'UpdateComponentsMessage',
      ],
    );
    final surface = surfaces.contextFor('t1-profile');
    expect(
      surface.dataModel.getValue<Object?>(
        DataPath(marketSlice.pathOf('currency')),
      ),
      'SEK',
    );
    final components = surface.definition.value!.components;
    expect(components['household']?.type, 'HouseholdInput');
    expect(
      _componentNames(surfaceExamples.first.components),
      everyElement(isIn([for (final item in catalog.items) item.name])),
    );

    final board = surfaces.contextFor(InlineSurfaces.boardId);
    expect(
      board.definition.value!.components['market']?.type,
      'MarketSnapshotCard',
    );
    expect(
      board.dataModel.getValue<Object?>(DataPath(marketSlice.pathOf('name'))),
      'Sweden',
    );
  });
}

Set<String> _componentNames(List<Map<String, Object?>> components) => {
  for (final component in components) component['component']! as String,
};
