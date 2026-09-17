import 'dart:convert';

import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

Response sseResponse(Stream<JsonRpcResponse> events) => Response.ok(
  events.map((event) => utf8.encode('data: ${jsonEncode(event)}\n\n')),
  headers: {
    'content-type': 'text/event-stream',
    'cache-control': 'no-cache',
  },
  context: {'shelf.io.buffer_output': false},
);
