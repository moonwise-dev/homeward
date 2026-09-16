import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'health/health_handler.dart';
import 'middleware/internal_error_middleware.dart';
import 'middleware/request_context_middleware.dart';
import 'middleware/request_logging_middleware.dart';

Handler buildApp() {
  final router = Router()..get('/health', healthHandler);
  return const Pipeline()
      .addMiddleware(requestContextMiddleware())
      .addMiddleware(requestLoggingMiddleware())
      .addMiddleware(internalErrorMiddleware())
      .addHandler(router.call);
}
