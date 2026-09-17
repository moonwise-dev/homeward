import 'package:shelf/shelf.dart';

import '../errors/homeward_failure.dart';
import 'json_response.dart';

Response apiOk(int statusCode, Object data) =>
    jsonResponse(statusCode, {'ok': true, 'data': data});

Response apiError(int statusCode, HomewardFailure failure) =>
    jsonResponse(statusCode, {
      'ok': false,
      'error': {'code': failure.code.wireName, 'message': failure.message},
    });
