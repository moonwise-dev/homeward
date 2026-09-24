import 'package:common/common.dart';
import 'package:homeward_server/agent/turn/progress_log.dart';
import 'package:homeward_server/agent/turn/turn_event.dart';
import 'package:test/test.dart';

void main() {
  List<List<ResearchStep>> stepsIn(List<TurnEvent> events) => [
    for (final event in events)
      if (event case TurnProgress(:final progress)) progress.steps,
  ];

  test('a step runs, then says whether it measured anything', () async {
    final log = ProgressLog();

    final events = await log.whileRunning(() async {
      await log.track('Finding KTH on the map', () async => 'found');
      await log.track(
        'Timing the trip to KTH by bike',
        () async => null,
        measured: (route) => route != null,
      );
    }).toList();

    expect(stepsIn(events).last, const [
      ResearchStep(
        label: 'Finding KTH on the map',
        state: ResearchStepState.done,
      ),
      ResearchStep(
        label: 'Timing the trip to KTH by bike',
        state: ResearchStepState.unavailable,
      ),
    ]);
  });

  test('running a finished step again from cache stays quiet', () async {
    final log = ProgressLog();
    Future<void> find() => log.track('Finding KTH on the map', () async {});

    await log.whileRunning(find).toList();
    final again = await log.whileRunning(find).toList();

    expect(again, isEmpty);
  });

  test('a lookup that throws is unavailable and the error goes on', () async {
    final log = ProgressLog();

    final events = <TurnEvent>[];
    await expectLater(
      log
          .whileRunning(
            () => log.track<void>(
              'Finding KTH on the map',
              () async => throw StateError('down'),
            ),
          )
          .forEach(events.add),
      throwsStateError,
    );
    expect(stepsIn(events).last.single.state, ResearchStepState.unavailable);
  });
}
