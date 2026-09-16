import 'dart:async';
import 'dart:convert';

import 'sse_event.dart';

Stream<SseEvent> decodeSse(Stream<List<int>> bytes) =>
    Stream<SseEvent>.eventTransformed(
      bytes.transform(utf8.decoder).transform(const LineSplitter()),
      _SseLineSink.new,
    );

final class _SseLineSink implements EventSink<String> {
  _SseLineSink(this._events);

  final EventSink<SseEvent> _events;
  final _data = <String>[];
  String? _event;
  String? _id;

  @override
  void add(String line) {
    if (line.isEmpty) {
      if (_data.isNotEmpty) {
        _events.add(SseEvent(event: _event, data: _data.join('\n'), id: _id));
      }
      _event = null;
      _data.clear();
      return;
    }
    if (line.startsWith(':')) {
      return;
    }
    final colon = line.indexOf(':');
    final field = colon == -1 ? line : line.substring(0, colon);
    final raw = colon == -1 ? '' : line.substring(colon + 1);
    final value = raw.startsWith(' ') ? raw.substring(1) : raw;
    switch (field) {
      case 'event':
        _event = value;
      case 'data':
        _data.add(value);
      case 'id':
        _id = value;
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) =>
      _events.addError(error, stackTrace);

  @override
  void close() => _events.close();
}
