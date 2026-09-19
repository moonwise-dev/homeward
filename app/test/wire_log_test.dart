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

  test('counts frames and recomputes for a panel opened mid-plan', () {
    final log = WireLog(now: () => DateTime.utc(2026, 9, 18))
      ..sent('message/stream')
      ..received('data, A2UI');
    final opened = (frames: log.frames, recomputes: log.recomputes);

    log
      ..recomputed('drag')
      ..recomputed('drag')
      ..received('status-update, completed');

    expect(log.frames - opened.frames, 1);
    expect(log.recomputes - opened.recomputes, 2);
    log.clear();
    expect((log.frames, log.recomputes), (0, 0));
  });

  test('a frame carries its size, its surface, and what it said', () {
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

    expect(log.entries.single.bytes, 2480);
    expect(log.entries.single.surfaceId, 't1-market');
    expect(log.entries.single.payload, isNotNull);
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
