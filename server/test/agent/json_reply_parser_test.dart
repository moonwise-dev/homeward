import 'dart:convert';

import 'package:homeward_server/agent/json_reply_parser.dart';
import 'package:homeward_server/agent/parsed_output.dart';
import 'package:test/test.dart';

void main() {
  const createSurface = {
    'version': 'v0.9',
    'createSurface': {'surfaceId': 't1-q', 'catalogId': 'c'},
  };

  test('reads each message out of the reply once it is complete', () {
    final parser = JsonReplyParser();
    final reply = jsonEncode({
      'messages': [createSurface],
    });

    expect(parser.add(reply.substring(0, 10)), isEmpty);
    expect(parser.add(reply.substring(10)), isEmpty);
    expect(parser.close(), [
      ParsedOutput.a2uiMessage(jsonEncode(createSurface)),
    ]);
  });

  test('hands a broken reply to validation whole, to be rejected there', () {
    final parser = JsonReplyParser()..add('{"messages": [');

    expect(parser.close(), const [ParsedOutput.a2uiMessage('{"messages": [')]);
  });
}
