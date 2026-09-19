import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart' as a2ui;
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:genui/genui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:homeward/data/models/agent_turn_status.dart';
import 'package:homeward/data/models/plan_conversation.dart';
import 'package:homeward/data/models/transcript_entry.dart';
import 'package:homeward/data/models/turn_failure.dart';
import 'package:homeward/catalog/homeward_genui_catalog.dart';
import 'package:homeward/data/providers/repository_providers.dart';
import 'package:homeward/data/repository/agent_repository.dart';
import 'package:homeward/data/repository/wire_log.dart';
import 'package:homeward/features/wire_inspector/wire_inspector_pane.dart';
import 'package:homeward/ui/app_theme.dart';

class _StillAgentRepository implements AgentRepository {
  _StillAgentRepository(this.conversation)
    : _surfaces = SurfaceController(catalogs: [homewardGenuiCatalog()]) {
    for (final message in [
      {
        'createSurface': {
          'surfaceId': 't1-market',
          'catalogId': homewardCatalogId,
        },
      },
      {
        'updateDataModel': {
          'surfaceId': 't1-market',
          'path': '/market',
          'value': {'name': 'Madeira, Portugal'},
        },
      },
    ]) {
      _surfaces.handleMessage(
        a2ui.A2uiMessage.fromJson(
          jsonDecode(jsonEncode({'version': A2uiExtension.version, ...message}))
              as Map<String, dynamic>,
        ),
      );
    }
  }

  final PlanConversation conversation;
  final SurfaceController _surfaces;

  @override
  Stream<PlanConversation> watchConversation(String sessionId) =>
      Stream.value(conversation);

  @override
  Stream<TurnFailure> watchFailures(String sessionId) => const Stream.empty();

  @override
  Future<void> open(String sessionId) async {}

  @override
  SurfaceContext surfaceContext(String sessionId, String surfaceId) =>
      _surfaces.contextFor(surfaceId);

  @override
  Future<void> sendText(String sessionId, String text) async {}

  @override
  Future<void> retry(String sessionId, String entryId) async {}

  @override
  Future<void> stop(String sessionId) async {}
}

void main() {
  Future<void> pump(WidgetTester tester, {required WireLog log}) =>
      tester.pumpWidget(
        ProviderScope(
          overrides: [
            wireLogProvider.overrideWithValue(log),
            agentRepositoryProvider.overrideWithValue(
              _StillAgentRepository(
                const PlanConversation(
                  entries: [
                    TranscriptEntry.agent(
                      id: 'e1',
                      request: TurnRequest.text('We are buying in Funchal'),
                      status: AgentTurnStatus.completed,
                      surfaceIds: ['t1-market'],
                    ),
                  ],
                ),
              ),
            ),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            home: const Scaffold(
              body: SizedBox(
                width: 380,
                child: WireInspectorPane(sessionId: 's-1'),
              ),
            ),
          ),
        ),
      );

  testWidgets('it counts the frames and what the device recomputed', (
    tester,
  ) async {
    final log = WireLog(now: () => DateTime.utc(2026, 9, 18));

    await pump(tester, log: log);
    await tester.pumpAndSettle();

    expect(find.text('Frames over the network'), findsOneWidget);
    expect(find.text('No traffic yet'), findsOneWidget);

    log
      ..sent('message/stream', bytes: 812)
      ..received(
        'data, A2UI',
        detail: 'createSurface',
        surfaceId: 't1-market',
        bytes: 2480,
        payload: const {
          'createSurface': {'surfaceId': 't1-market'},
        },
      )
      ..recomputed('Recomputed on the device', detail: '/scenario');
    await tester.pumpAndSettle();

    expect(find.text('2'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.textContaining('2.5 kB'), findsOneWidget);
  });

  testWidgets('a frame opens to the message it carried', (tester) async {
    final log = WireLog(now: () => DateTime.utc(2026, 9, 18))
      ..received(
        'data, A2UI',
        detail: 'createSurface',
        surfaceId: 't1-market',
        bytes: 2480,
        payload: const {
          'createSurface': {'surfaceId': 't1-market'},
        },
      );

    await pump(tester, log: log);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ExpansionTile));
    await tester.pumpAndSettle();

    expect(find.textContaining('"createSurface"'), findsOneWidget);
  });

  testWidgets('it lists the surfaces a plan has drawn', (tester) async {
    await pump(tester, log: WireLog(now: () => DateTime.utc(2026, 9, 18)));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Data'));
    await tester.pumpAndSettle();

    expect(find.text('t1-market'), findsWidgets);
    expect(find.textContaining('Madeira, Portugal'), findsWidgets);
  });
}
