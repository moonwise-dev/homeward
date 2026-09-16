import 'dart:async';

import 'package:shelf/shelf.dart';

import '../request/parse_request_context.dart';
import '../request/random_request_id.dart';
import '../request/request_context.dart';

Middleware requestContextMiddleware({
  String Function() newRequestId = randomRequestId,
}) =>
    (inner) => (request) {
      final context = parseRequestContext(
        request.headers,
        newRequestId: newRequestId,
      );
      return runZoned(() async {
        final response = await inner(request);
        return response.change(headers: {'x-request-id': context.requestId});
      }, zoneValues: {RequestContext.zoneKey: context});
    };
