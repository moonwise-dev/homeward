import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../a2a/json_rpc_errors.dart';
import '../errors/homeward_failure.dart';
import 'api_envelope.dart';
import 'json_response.dart';

Response failureResponse(
  Request request,
  int statusCode,
  HomewardFailure failure,
) => request.url.path.startsWith('api/')
    ? apiError(statusCode, failure)
    : jsonResponse(
        statusCode,
        JsonRpcErrorResponse(error: JsonRpcErrors.homeward(failure)),
      );
