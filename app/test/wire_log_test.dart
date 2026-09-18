import 'package:flutter_test/flutter_test.dart';
import 'package:homeward/data/models/wire_entry.dart';
import 'package:homeward/data/repository/wire_log.dart';

void main() {
  test('counts what the device recomputed since the last frame', () {
    final log = WireLog(now: () => DateTime.utc(2026, 9, 18));

    log.sent('message/stream');
    expect(log.localSinceNetwork, 0);
    log
      ..recomputed('drag')
      ..recomputed('drag');
    expect(log.localSinceNetwork, 2);
    log.received('data, A2UI');
    expect(log.localSinceNetwork, 0);
    expect(
      log.entries.map((entry) => entry.direction),
      [
        WireDirection.sent,
        WireDirection.local,
        WireDirection.local,
        WireDirection.received,
      ],
    );
  });

  test('keeps only the last entries', () {
    final log = WireLog(capacity: 3, now: () => DateTime.utc(2026, 9, 18));

    for (var index = 0; index < 5; index++) {
      log.recomputed('edit $index');
    }

    expect(log.entries.map((entry) => entry.label), [
      'edit 2',
      'edit 3',
      'edit 4',
    ]);
  });

  test('watching gives the entries so far and every change after', () async {
    final log = WireLog(now: () => DateTime.utc(2026, 9, 18))
      ..sent('message/stream');
    final seen = <int>[];
    final subscription = log.watch().listen((entries) {
      seen.add(entries.length);
    });
    await Future<void>.delayed(Duration.zero);

    log.recomputed('drag');
    await Future<void>.delayed(Duration.zero);
    log.clear();
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(seen, [1, 2, 0]);
  });
}
