import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';

import '../http/json_response.dart';

final _log = Logger('http');

Middleware internalErrorMiddleware() =>
    (inner) => (request) async {
      try {
        return await inner(request);
      } on HijackException {
        rethrow;
      } catch (error, stackTrace) {
        _log.severe('Unhandled error', error, stackTrace);
        return jsonResponse(500, {
          'ok': false,
          'error': {'code': 'internal', 'message': 'Internal error'},
        });
      }
    };
