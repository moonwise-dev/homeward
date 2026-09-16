import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  Future<List<SseEvent>> decode(List<String> chunks) => decodeSse(
    Stream.fromIterable([for (final chunk in chunks) utf8.encode(chunk)]),
  ).toList();

  test('dispatches named events at blank lines', () async {
    expect(
      await decode([
        'event: interaction.created\ndata: {"a":1}\n\n',
        'event: done\ndata: [DONE]\n\n',
      ]),
      const [
        SseEvent(event: 'interaction.created', data: '{"a":1}'),
        SseEvent(event: 'done', data: '[DONE]'),
      ],
    );
  });

  test('joins data lines and skips comments', () async {
    expect(await decode([': keep-alive\ndata: one\ndata:two\n\n']), const [
      SseEvent(data: 'one\ntwo'),
    ]);
  });

  test('handles CRLF and chunks split inside lines and characters', () async {
    final bytes = utf8.encode(
      'event: step.delta\r\ndata: {"text":"kr för år"}\r\n\r\n',
    );
    expect(
      await decodeSse(
        Stream.fromIterable([
          bytes.sublist(0, 10),
          bytes.sublist(10, 38),
          bytes.sublist(38),
        ]),
      ).toList(),
      const [SseEvent(event: 'step.delta', data: '{"text":"kr för år"}')],
    );
  });

  test(
    'keeps the last id and drops events without data or a blank line',
    () async {
      expect(
        await decode([
          'id: 7\ndata: a\n\nevent: empty\n\ndata: b\n\ndata: cut',
        ]),
        const [SseEvent(data: 'a', id: '7'), SseEvent(data: 'b', id: '7')],
      );
    },
  );

  test('cancelling passes through to a source that never ends', () async {
    final source = StreamController<List<int>>(sync: true);
    var cancelled = false;
    source.onCancel = () => cancelled = true;
    final events = StreamIterator(decodeSse(source.stream));
    source.add(utf8.encode('data: first\n\n'));

    expect(await events.moveNext(), isTrue);
    final pending = events.moveNext();
    await events.cancel();

    expect(await pending, isFalse);
    expect(cancelled, isTrue);
  });
}
