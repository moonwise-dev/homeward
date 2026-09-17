import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../request/request_values.dart';

Middleware geminiKeyMiddleware() =>
    (inner) => (request) {
      final key = request.headers[HomewardHeaders.geminiKey]?.trim();
      return inner(
        key == null || key.isEmpty ? request : request.withGeminiKey(key),
      );
    };
