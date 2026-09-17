import 'package:shelf/shelf.dart';

const _allowedHeaders = [
  'authorization',
  'content-type',
  'x-firebase-appcheck',
  'x-homeward-gemini-key',
  'x-a2a-extensions',
];

Middleware corsMiddleware(List<String> allowedOrigins) {
  bool allows(String origin) => allowedOrigins.any(
    (allowed) => allowed.endsWith(':*')
        ? RegExp(
            '^${RegExp.escape(allowed.substring(0, allowed.length - 2))}'
            r'(:\d+)?$',
          ).hasMatch(origin)
        : allowed == origin,
  );

  return (inner) => (request) async {
    final origin = request.headers['origin'];
    final corsHeaders = origin != null && allows(origin)
        ? {
            'access-control-allow-origin': origin,
            'access-control-expose-headers': 'x-request-id',
            'vary': 'Origin',
          }
        : const <String, String>{};
    if (request.method == 'OPTIONS') {
      return Response(
        corsHeaders.isEmpty ? 403 : 204,
        headers: {
          ...corsHeaders,
          if (corsHeaders.isNotEmpty) ...{
            'access-control-allow-methods': 'GET, POST, DELETE, OPTIONS',
            'access-control-allow-headers': _allowedHeaders.join(', '),
            'access-control-max-age': '3600',
          },
        },
      );
    }
    final response = await inner(request);
    return corsHeaders.isEmpty
        ? response
        : response.change(headers: corsHeaders);
  };
}
