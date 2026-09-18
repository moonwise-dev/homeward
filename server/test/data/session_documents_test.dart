import 'package:common/common.dart';
import 'package:google_cloud_firestore/google_cloud_firestore.dart';
import 'package:homeward_server/data/firestore/session_documents.dart';
import 'package:homeward_server/data/models/session.dart';
import 'package:homeward_server/data/models/session_listing.dart';
import 'package:test/test.dart';

void main() {
  final updatedAt = DateTime.utc(2026, 9, 18, 9, 30);
  final session = Session(
    id: 's-1',
    ownerUid: 'uid-1',
    plan: Plan(
      marketId: MarketId.parse('PT-30'),
      profile: const BuyerProfile(adults: 2, childAges: [4, 7]),
    ),
    turnCount: 2,
    lastInteractionId: 'interaction-7',
    updatedAt: updatedAt,
    turns: [
      const TurnRecord(
        index: 1,
        input: RecordedInput.text('We are buying in Funchal'),
        outputText: 'Madeira it is.',
        status: TurnStatus.completed,
        messages: [
          {
            'version': 'v0.9',
            'createSurface': {'surfaceId': 't1-market', 'catalogId': 'c'},
          },
        ],
      ),
      const TurnRecord(
        index: 2,
        input: RecordedInput.action(
          name: 'change_down_payment',
          surfaceId: 'board',
          sourceComponentId: 'costs-change',
        ),
        status: TurnStatus.failed,
        errorCode: 'model_unavailable',
      ),
    ],
  );

  test('a session survives the round trip through its documents', () {
    final restored = sessionOf(
      id: session.id,
      document: sessionDocument(session),
      plan: planDocument(session),
      turns: [
        for (final turn in session.turns) turnDocument(session, turn),
      ],
    );

    expect(restored, session);
  });

  test('a session document carries what the plans list shows', () {
    expect(
      listingOf(session.id, sessionDocument(session)),
      SessionListing(
        id: 's-1',
        turnCount: 2,
        title: 'We are buying in Funchal',
        marketId: 'PT-30',
        updatedAt: updatedAt,
      ),
    );
  });

  test('a turn of a plan has a document of its own', () {
    expect(turnDocumentId('s-1', 2), 's-1-2');
    expect(turnDocument(session, session.turns.last), {
      'sessionId': 's-1',
      'ownerUid': 'uid-1',
      'index': 2,
      'status': 'failed',
      'recordJson': isA<String>(),
    });
  });

  test('a field nobody filled in is cleared, not skipped', () {
    expect(mergeable({'title': null, 'turnCount': 2}), {
      'title': FieldValue.delete,
      'turnCount': 2,
    });
  });

  test('a moment reads back however Firestore hands it over', () {
    expect(dateTimeOf(Timestamp.fromDate(updatedAt)), updatedAt);
    expect(dateTimeOf(updatedAt), updatedAt);
    expect(dateTimeOf(updatedAt.toIso8601String()), updatedAt);
    expect(dateTimeOf(null), isNull);
  });

  test('a plan with no turns yet lists as a new one', () {
    const started = Session(id: 's-2', ownerUid: 'uid-1');

    expect(
      sessionOf(id: 's-2', document: sessionDocument(started)),
      started,
    );
    expect(listingOf('s-2', sessionDocument(started)).title, isNull);
  });
}
