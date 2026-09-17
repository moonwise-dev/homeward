import 'dart:math';

import 'package:homeward_server/agent/parsed_output.dart';
import 'package:homeward_server/agent/stream_parser.dart';
import 'package:test/test.dart';

void main() {
  const createSurface =
      '{"version":"v0.9","createSurface":{"surfaceId":"t1-budget","catalogId":"https://moonwise.se/homeward/catalogs/v1/catalog.json","sendDataModel":true}}';
  const updateComponents =
      '{"version":"v0.9","updateComponents":{"surfaceId":"t1-budget","components":[{"id":"root","component":"Text","text":"`code` and ```a2ui"}]}}';
  final response = [
    'Here is what you can afford in Stockholm.',
    'Inline `code` stays prose, and so does ```a2ui mid-line.',
    '```a2ui',
    createSurface,
    '',
    '  $updateComponents  ',
    '```',
    'Drag the slider to try a smaller down payment.',
  ].join('\n');
  final expectedProse = [
    'Here is what you can afford in Stockholm.',
    'Inline `code` stays prose, and so does ```a2ui mid-line.',
    'Drag the slider to try a smaller down payment.',
  ].join('\n');

  void expectSplit(List<String> deltas) {
    final parser = StreamParser();
    final outputs = [
      for (final delta in deltas) ...parser.add(delta),
      ...parser.close(),
    ];
    expect(
      outputs.whereType<ProseOutput>().map((output) => output.text).join(),
      expectedProse,
      reason: '$deltas',
    );
    expect(
      outputs.whereType<A2uiLineOutput>().map((output) => output.line),
      [createSurface, updateComponents],
      reason: '$deltas',
    );
  }

  test('splits prose from a2ui lines in one delta', () {
    expectSplit([response]);
  });

  test('gives the same result for any delta boundaries', () {
    final random = Random(2026);
    for (var i = 0; i < 500; i++) {
      final deltas = <String>[];
      var start = 0;
      while (start < response.length) {
        final end = min(response.length, start + 1 + random.nextInt(12));
        deltas.add(response.substring(start, end));
        start = end;
      }
      expectSplit(deltas);
    }
  });

  test('forwards prose as soon as a line cannot become a fence', () {
    final parser = StreamParser();

    expect(parser.add('Your '), [const ParsedOutput.prose('Your ')]);
    expect(parser.add('budget'), [const ParsedOutput.prose('budget')]);
    expect(parser.add('\n``'), [const ParsedOutput.prose('\n')]);
    expect(parser.add('`a2'), isEmpty);
    expect(parser.add('ui\n{"a":1}'), isEmpty);
    expect(parser.add('\n'), [const ParsedOutput.a2uiLine('{"a":1}')]);
  });

  test('flushes an unterminated block and trailing prose on close', () {
    final block = StreamParser()..add('```a2ui\n{"a":1}');
    expect(block.close(), [const ParsedOutput.a2uiLine('{"a":1}')]);

    final prose = StreamParser()..add('`');
    expect(prose.close(), [const ParsedOutput.prose('`')]);
  });
}
