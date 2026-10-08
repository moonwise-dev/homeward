import 'dart:async';

import '../agent/turn/turn_event.dart';
import 'running_task.dart';

final class TaskRegistry {
  TaskRegistry({this.retention = const Duration(minutes: 10)});

  final Duration retention;
  final _tasks = <String, RunningTask>{};

  Iterable<RunningTask> get running =>
      _tasks.values.where((task) => !task.isFinished);

  RunningTask start({
    required String id,
    required String contextId,
    required Stream<TurnEvent> Function(Future<void> cancellation) run,
  }) => _tasks[id] = RunningTask(
    id: id,
    contextId: contextId,
    run: run,
    onFinished: () => Timer(retention, () => _tasks.remove(id)),
  );

  RunningTask? find(String id) => _tasks[id];
}
