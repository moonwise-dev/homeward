import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wire_log.freezed.dart';
part 'wire_log.g.dart';

class WireLog {
  WireLog({DateTime Function()? now, this.capacity = 200})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final int capacity;
  final _entries = <WireEntry>[];
  final _changes = StreamController<void>.broadcast(sync: true);
  var _localSinceNetwork = 0;
  var _frames = 0;
  var _recomputes = 0;

  List<WireEntry> get entries => List.unmodifiable(_entries);

  int get localSinceNetwork => _localSinceNetwork;

  int get frames => _frames;

  int get recomputes => _recomputes;

  Stream<List<WireEntry>> watch() => Stream.multi((listener) {
    listener.add(entries);
    final subscription = _changes.stream.listen((_) => listener.add(entries));
    listener.onCancel = subscription.cancel;
  });

  void sent(
    String label, {
    String? detail,
    String? surfaceId,
    int? bytes,
    Map<String, Object?>? payload,
  }) => _add(
    WireDirection.sent,
    label,
    detail: detail,
    surfaceId: surfaceId,
    bytes: bytes,
    payload: payload,
  );

  void received(
    String label, {
    String? detail,
    String? surfaceId,
    int? bytes,
    Map<String, Object?>? payload,
  }) => _add(
    WireDirection.received,
    label,
    detail: detail,
    surfaceId: surfaceId,
    bytes: bytes,
    payload: payload,
  );

  void recomputed(String label, {String? detail}) =>
      _add(WireDirection.local, label, detail: detail);

  void clear() {
    _entries.clear();
    _localSinceNetwork = 0;
    _frames = 0;
    _recomputes = 0;
    _changes.add(null);
  }

  void _add(
    WireDirection direction,
    String label, {
    String? detail,
    String? surfaceId,
    int? bytes,
    Map<String, Object?>? payload,
  }) {
    if (direction == WireDirection.local) {
      _localSinceNetwork++;
      _recomputes++;
    } else {
      _localSinceNetwork = 0;
      _frames++;
    }
    _entries.add(
      WireEntry(
        at: _now(),
        direction: direction,
        label: label,
        detail: detail,
        surfaceId: surfaceId,
        bytes: bytes,
        payload: payload,
      ),
    );
    if (_entries.length > capacity) {
      _entries.removeRange(0, _entries.length - capacity);
    }
    _changes.add(null);
  }
}

final wireLogInstance = WireLog();

enum WireDirection { sent, received, local }

@freezed
abstract class WireEntry with _$WireEntry {
  const factory WireEntry({
    required DateTime at,
    required WireDirection direction,
    required String label,
    String? detail,
    String? surfaceId,
    int? bytes,
    Map<String, Object?>? payload,
  }) = _WireEntry;
}

@Riverpod(keepAlive: true)
WireLog wireLog(Ref ref) => wireLogInstance;

@riverpod
Stream<List<WireEntry>> wireEntries(Ref ref) =>
    ref.watch(wireLogProvider).watch();
