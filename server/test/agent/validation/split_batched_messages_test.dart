import 'dart:convert';

import 'package:homeward_server/agent/validation/split_batched_messages.dart';
import 'package:test/test.dart';

void main() {
  test('a batched envelope becomes one message per surface', () {
    final parts = splitBatchedMessages(
      jsonEncode({
        'version': 'v0.9',
        'createSurface': [
          {'surfaceId': 't1-a', 'catalogId': 'c'},
          {'surfaceId': 't1-b', 'catalogId': 'c'},
        ],
      }),
    );

    expect(parts.map(jsonDecode), [
      {
        'version': 'v0.9',
        'createSurface': {'surfaceId': 't1-a', 'catalogId': 'c'},
      },
      {
        'version': 'v0.9',
        'createSurface': {'surfaceId': 't1-b', 'catalogId': 'c'},
      },
    ]);
  });

  test('a list of messages becomes each message', () {
    final parts = splitBatchedMessages(
      jsonEncode([
        {
          'createSurface': {'surfaceId': 't1-a', 'catalogId': 'c'},
        },
        {
          'updateComponents': {'surfaceId': 't1-a', 'components': <Object?>[]},
        },
      ]),
    );

    expect(parts, hasLength(2));
  });

  test('a bare component list joins the surface drawn last', () {
    final components = [
      {'id': 'root', 'component': 'Text', 'text': 'Hello'},
    ];
    final bare = jsonEncode({
      'version': 'v0.9',
      'updateComponents': components,
    });

    expect(
      splitBatchedMessages(bare, lastSurfaceId: 't1-story').map(jsonDecode),
      [
        {
          'version': 'v0.9',
          'updateComponents': {
            'surfaceId': 't1-story',
            'components': components,
          },
        },
      ],
    );
    expect(splitBatchedMessages(bare), [bare]);
  });

  test('a well-formed message and broken JSON pass through untouched', () {
    const message = '{"createSurface":{"surfaceId":"t1-a","catalogId":"c"}}';

    expect(splitBatchedMessages(message), [message]);
    expect(splitBatchedMessages('{"create'), ['{"create']);
  });
}
