import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../http/json_response.dart';
import 'gemini_key_names.dart';

const _localHosts = {'localhost', '127.0.0.1'};

Handler developmentHandler(Map<String, String> environment) {
  final geminiKeys = [
    for (final name in developmentGeminiKeyNames)
      if (environment[name]?.trim() case final key? when key.isNotEmpty) key,
  ];
  final router = Router()
    ..get(
      '/config',
      (Request request) => jsonResponse(200, {'geminiKeys': geminiKeys}),
    );
  return const Pipeline().addMiddleware(_localOnly).addHandler(router.call);
}

Handler _localOnly(Handler inner) =>
    (request) => _localHosts.contains(request.requestedUri.host)
    ? inner(request)
    : Response.notFound('Not found');
