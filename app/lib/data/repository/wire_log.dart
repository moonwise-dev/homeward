import 'dart:async';

import '../models/wire_entry.dart';

class WireLog {
  WireLog({DateTime Function()? now, this.capacity = 200})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final int capacity;
  final _entries = <WireEntry>[];
  final _changes = StreamController<void>.broadcast(sync: true);
  var _localSinceNetwork = 0;

  List<WireEntry> get entries => List.unmodifiable(_entries);

  int get localSinceNetwork => _localSinceNetwork;

  Stream<List<WireEntry>> watch() => Stream.multi((listener) {
    listener.add(entries);
    final subscription = _changes.stream.listen((_) => listener.add(entries));
    listener.onCancel = subscription.cancel;
  });

  void sent(String label, {String? detail}) =>
      _add(WireDirection.sent, label, detail);

  void received(String label, {String? detail}) =>
      _add(WireDirection.received, label, detail);

  void recomputed(String label, {String? detail}) =>
      _add(WireDirection.local, label, detail);

  void clear() {
    _entries.clear();
    _localSinceNetwork = 0;
    _changes.add(null);
  }

  void _add(WireDirection direction, String label, String? detail) {
    if (direction == WireDirection.local) {
      _localSinceNetwork++;
    } else {
      _localSinceNetwork = 0;
    }
    _entries.add(
      WireEntry(at: _now(), direction: direction, label: label, detail: detail),
    );
    if (_entries.length > capacity) {
      _entries.removeRange(0, _entries.length - capacity);
    }
    _changes.add(null);
  }
}

final wireLogInstance = WireLog();
