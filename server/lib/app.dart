import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'a2a/a2a_handler.dart';
import 'a2a/homeward_agent_card.dart';
import 'data/providers/providers.dart';
import 'health/health_handler.dart';
import 'keys/keys_handler.dart';
import 'http/json_response.dart';
import 'middleware/app_check_middleware.dart';
import 'middleware/authentication_middleware.dart';
import 'middleware/cors_middleware.dart';
import 'middleware/gemini_key_middleware.dart';
import 'middleware/internal_error_middleware.dart';
import 'middleware/rate_limit_middleware.dart';
import 'middleware/request_context_middleware.dart';
import 'middleware/request_logging_middleware.dart';
import 'sessions/sessions_handler.dart';

Handler buildApp(Providers providers) {
  final config = providers.config;
  final agentCard = homewardAgentCard(config.publicUrl);
  final a2a = A2aHandler(turns: providers.turns, tasks: providers.tasks);
  final sessions = SessionsHandler(providers.sessions);
  final keys = KeysHandler(providers.verifyKey);
  final verified = const Pipeline()
      .addMiddleware(authenticationMiddleware(providers.identity))
      .addMiddleware(
        appCheckMiddleware(
          providers.appCheck,
          enforced: config.appCheckEnforced,
        ),
      );
  final router = Router()
    ..get('/health', healthHandler)
    ..get(
      '/.well-known/agent-card.json',
      (Request request) => jsonResponse(200, agentCard),
    )
    ..post(
      '/a2a',
      verified
          .addMiddleware(geminiKeyMiddleware())
          .addMiddleware(rateLimitMiddleware(providers.turnLimiter))
          .addHandler(a2a.call),
    )
    ..post(
      '/api/keys/verify',
      verified.addMiddleware(geminiKeyMiddleware()).addHandler(keys.verify),
    )
    ..post('/api/sessions', verified.addHandler(sessions.create));
  return const Pipeline()
      .addMiddleware(requestContextMiddleware())
      .addMiddleware(requestLoggingMiddleware())
      .addMiddleware(corsMiddleware(config.allowedOrigins))
      .addMiddleware(internalErrorMiddleware())
      .addHandler(router.call);
}
