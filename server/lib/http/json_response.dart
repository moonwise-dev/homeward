import 'dart:convert';

import 'package:shelf/shelf.dart';

Response jsonResponse(int statusCode, Object body) => Response(
  statusCode,
  body: jsonEncode(body),
  headers: {'content-type': 'application/json'},
);
