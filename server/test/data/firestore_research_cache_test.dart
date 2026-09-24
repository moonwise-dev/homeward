import 'dart:io';

import 'package:google_cloud_firestore/google_cloud_firestore.dart';
import 'package:homeward_server/data/repository/firestore_research_cache.dart';
import 'package:homeward_server/ids/random_hex.dart';
import 'package:test/test.dart';

void main() {
  final emulator = Platform.environment['FIRESTORE_EMULATOR_HOST'];
  final run = randomHex(8);
  final firestore = Firestore(
    settings: const Settings(projectId: 'homeward-test'),
  );
  var now = DateTime.utc(2026, 9, 24, 12);

  FirestoreResearchCache cache({int maxBytes = 900000}) =>
      FirestoreResearchCache(firestore, maxBytes: maxBytes, now: () => now);

  setUp(() => now = DateTime.utc(2026, 9, 24, 12));

  group('kept in Firestore', () {
    const answer = {
      'elements': [
        {'type': 'node', 'lat': 59.344, 'lon': 18.05},
      ],
    };

    test('an answer outlives the server that fetched it', () async {
      await cache().write('$run POST overpass', answer);

      expect(await cache().read('$run POST overpass'), answer);
      expect(await cache().read('$run POST elsewhere'), isNull);
    });

    test('an answer older than a week is fetched again', () async {
      await cache().write('$run GET nominatim', answer);
      now = now.add(const Duration(days: 8));

      expect(await cache().read('$run GET nominatim'), isNull);
    });

    test('an answer too large for a document is not kept', () async {
      await cache(maxBytes: 10).write('$run GET large', answer);

      expect(await cache().read('$run GET large'), isNull);
    });
  }, skip: emulator == null ? 'Run make emulator first' : null);
}
