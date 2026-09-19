import 'dart:async';

import 'package:homeward_server/logging/log_entry.dart';
import 'package:logging/logging.dart';

final class TurnLog {
  TurnLog() {
    Logger.root.level = Level.ALL;
    _subscription = Logger.root.onRecord.listen(_read);
  }

  late final StreamSubscription<LogRecord> _subscription;
  final _toolsCalled = <String>[];
  final _toolsRun = <String>{};
  final _rejections = <String>[];
  var _modelRounds = 0;
  var _corrections = 0;

  List<String> get toolsCalled => List.unmodifiable(_toolsCalled);

  Set<String> get toolsRun => Set.unmodifiable(_toolsRun);

  List<String> get rejections => List.unmodifiable(_rejections);

  int get modelRounds => _modelRounds;

  int get corrections => _corrections;

  void reset() {
    _toolsCalled.clear();
    _toolsRun.clear();
    _rejections.clear();
    _modelRounds = 0;
    _corrections = 0;
  }

  Future<void> close() => _subscription.cancel();

  void _read(LogRecord record) {
    if (record.object case LogEntry(:final fields)) {
      if (fields['functionCalls'] case final List<Object?> calls) {
        _toolsCalled.addAll(calls.cast<String>());
      }
      if (fields['tool'] case final String tool) {
        _toolsRun.add(tool);
      }
      if (fields case {'path': final String path, 'reason': final String why}) {
        _rejections.add('$path: $why');
      }
      if (fields['modelRounds'] case final int rounds) {
        _modelRounds = rounds;
      }
      if (fields['corrections'] case final int corrections) {
        _corrections = corrections;
      }
    }
  }
}
