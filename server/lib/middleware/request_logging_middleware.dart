import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';

import '../logging/log_entry.dart';

final _log = Logger('http');

Middleware requestLoggingMiddleware() =>
    (inner) => (request) async {
      final stopwatch = Stopwatch()..start();
      final response = await inner(request);
      _log.info(
        LogEntry(
          '${request.method} ${request.requestedUri.path} ${response.statusCode}',
          fields: {
            'method': request.method,
            'path': request.requestedUri.path,
            'status': response.statusCode,
            'durationMs': stopwatch.elapsedMilliseconds,
          },
        ),
      );
      return response;
    };
