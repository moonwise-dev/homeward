import 'package:shelf/shelf.dart';

import '../errors/homeward_failure.dart';
import '../http/failure_response.dart';
import '../rate_limit/fixed_window_limiter.dart';
import '../request/request_values.dart';

Middleware rateLimitMiddleware(FixedWindowLimiter limiter) =>
    (inner) => (request) {
      final uid = request.callerUid;
      final wait = uid == null ? null : limiter.retryAfter(uid);
      return wait == null
          ? inner(request)
          : failureResponse(request, 429, HomewardFailure.rateLimited(wait));
    };
