import 'dart:async';

import 'package:logging/logging.dart';

import '../agent/turn/turn_event.dart';
import '../errors/homeward_failure.dart';

final _log = Logger('turn');

final class RunningTask {
  RunningTask({
    required this.id,
    required this.contextId,
    required this.ownerUid,
    required Stream<TurnEvent> Function(Future<void> cancellation) run,
    required this.onFinished,
  }) {
    _subscription = run(
      _cancellation.future,
    ).listen(_record, onError: _fail, onDone: _finish, cancelOnError: true);
  }

  final String id;
  final String contextId;
  final String ownerUid;
  final void Function() onFinished;
  final _cancellation = Completer<void>();
  final _history = <TurnEvent>[];
  final _live = StreamController<TurnEvent>.broadcast(sync: true);
  late final StreamSubscription<TurnEvent> _subscription;
  var _finished = false;

  bool get isFinished => _finished;

  List<TurnEvent> get history => List.unmodifiable(_history);

  Stream<TurnEvent> watch() => Stream.multi((watcher) {
    _history.forEach(watcher.add);
    if (_finished) {
      watcher.close();
      return;
    }
    final subscription = _live.stream.listen(
      watcher.add,
      onDone: watcher.close,
    );
    watcher.onCancel = subscription.cancel;
  });

  Future<void> cancel() async {
    if (_finished) {
      return;
    }
    _cancellation.complete();
    await _subscription.cancel();
    _record(const TurnEvent.canceled());
    _finish();
  }

  void _record(TurnEvent event) {
    _history.add(event);
    _live.add(event);
  }

  void _fail(Object error, StackTrace stackTrace) {
    _log.severe('Turn failed unexpectedly', error.runtimeType, stackTrace);
    _cancellation.complete();
    _record(const TurnEvent.failed(HomewardFailure.internal));
    _finish();
  }

  void _finish() {
    if (_finished) {
      return;
    }
    _finished = true;
    _live.close();
    onFinished();
  }
}
