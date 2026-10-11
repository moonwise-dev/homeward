import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

const _quietBeforeComment = Duration(milliseconds: 50);
final _comment = utf8.encode(':\n\n');

Response sseResponse(Stream<JsonRpcResponse> events) => Response.ok(
  _followedByComment(
    events.map<List<int>>(
      (event) => utf8.encode('data: ${jsonEncode(event)}\n\n'),
    ),
  ),
  headers: {
    'content-type': 'text/event-stream',
    'cache-control': 'no-cache',
  },
  context: {'shelf.io.buffer_output': false},
);

Stream<List<int>> _followedByComment(Stream<List<int>> events) {
  late final StreamController<List<int>> written;
  StreamSubscription<List<int>>? source;
  Timer? quiet;
  written = StreamController<List<int>>(
    onListen: () => source = events.listen(
      (event) {
        written.add(event);
        quiet?.cancel();
        quiet = Timer(_quietBeforeComment, () => written.add(_comment));
      },
      onError: written.addError,
      onDone: () {
        quiet?.cancel();
        unawaited(written.close());
      },
    ),
    onPause: () => source?.pause(),
    onResume: () => source?.resume(),
    onCancel: () {
      quiet?.cancel();
      return source?.cancel();
    },
  );
  return written.stream;
}
