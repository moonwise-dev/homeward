import 'dart:io';

import 'package:common/common.dart';
import 'package:google_cloud_firestore/google_cloud_firestore.dart';
import 'package:homeward_server/data/repository/firestore_session_repository.dart';
import 'package:homeward_server/ids/random_hex.dart';
import 'package:test/test.dart';

void main() {
  final emulator = Platform.environment['FIRESTORE_EMULATOR_HOST'];
  final run = randomHex(8);
  final firestore = Firestore(
    settings: const Settings(projectId: 'homeward-test'),
  );
  var now = DateTime.utc(2026, 9, 18, 10);
  var made = 0;

  FirestoreSessionRepository repository() => FirestoreSessionRepository(
    firestore,
    newId: () => '$run-${++made}',
    now: () => now,
  );

  setUp(() => now = DateTime.utc(2026, 9, 18, 10));

  group('kept in Firestore', () {
    test('a plan outlives the server that started it', () async {
      final started = await repository().create('$run-uid-1');
      final session = started.copyWith(
        turnCount: 1,
        lastInteractionId: 'interaction-1',
        updatedAt: now,
        turns: [
          const TurnRecord(
            index: 1,
            input: RecordedInput.text('We are buying in Funchal'),
            outputText: 'Madeira it is.',
            status: TurnStatus.completed,
            messages: [
              {'version': 'v0.9'},
            ],
          ),
        ],
      );
      await repository().save(session);

      expect(await repository().find(session.id), session);
    });

    test('a later turn joins the ones already kept', () async {
      final started = await repository().create('$run-uid-2');
      const first = TurnRecord(
        index: 1,
        input: RecordedInput.text('First'),
        status: TurnStatus.completed,
      );
      const second = TurnRecord(
        index: 2,
        input: RecordedInput.text('Second'),
        status: TurnStatus.completed,
      );
      await repository().save(
        started.copyWith(turnCount: 1, turns: const [first]),
      );
      await repository().save(
        started.copyWith(turnCount: 2, turns: const [first, second]),
      );

      expect((await repository().find(started.id))?.turns, [first, second]);
    });

    test('the plans list holds the caller own plans, newest first', () async {
      final uid = '$run-uid-3';
      final older = await repository().create(uid);
      final newer = await repository().create(uid);
      final other = await repository().create('$run-uid-4');
      await repository().save(
        older.copyWith(updatedAt: now.subtract(const Duration(hours: 2))),
      );
      await repository().save(
        newer.copyWith(
          updatedAt: now,
          turnCount: 1,
          turns: const [
            TurnRecord(
              index: 1,
              input: RecordedInput.text('A flat in Stockholm'),
              status: TurnStatus.completed,
            ),
          ],
        ),
      );
      await repository().save(other.copyWith(updatedAt: now));

      final listings = await repository().listingsOf(uid);

      expect(listings.map((listing) => listing.id), [newer.id, older.id]);
      expect(listings.first.title, 'A flat in Stockholm');
    });

    test('one turn at a time runs, until the lease runs out', () async {
      final session = await repository().create('$run-uid-5');

      expect(await repository().lease(session.id), isTrue);
      expect(await repository().lease(session.id), isFalse);
      await repository().release(session.id);
      expect(await repository().lease(session.id), isTrue);

      now = now.add(const Duration(minutes: 6));

      expect(await repository().lease(session.id), isTrue);
    });

    test('a plan nobody started is nowhere to be found', () async {
      expect(await repository().find('$run-missing'), isNull);
      expect(await repository().lease('$run-missing'), isFalse);
    });
  }, skip: emulator == null ? 'Run make emulator first' : null);
}
