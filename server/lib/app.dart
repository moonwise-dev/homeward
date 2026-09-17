import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'a2a/homeward_agent_card.dart';
import 'config/server_config.dart';
import 'health/health_handler.dart';
import 'http/json_response.dart';
import 'middleware/internal_error_middleware.dart';
import 'middleware/request_context_middleware.dart';
import 'middleware/request_logging_middleware.dart';

Handler buildApp(ServerConfig config) {
  final agentCard = homewardAgentCard(config.publicUrl);
  final router = Router()
    ..get('/health', healthHandler)
    ..get(
      '/.well-known/agent-card.json',
      (Request request) => jsonResponse(200, agentCard),
    );
  return const Pipeline()
      .addMiddleware(requestContextMiddleware())
      .addMiddleware(requestLoggingMiddleware())
      .addMiddleware(internalErrorMiddleware())
      .addHandler(router.call);
}
