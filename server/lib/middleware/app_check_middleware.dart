import 'package:shelf/shelf.dart';

import '../auth/app_check_verifier.dart';
import '../errors/homeward_failure.dart';
import '../http/failure_response.dart';

Middleware appCheckMiddleware(
  AppCheckVerifier appCheck, {
  required bool enforced,
}) =>
    (inner) => (request) async {
      if (!enforced) {
        return inner(request);
      }
      final token = request.headers['x-firebase-appcheck'];
      return token != null && await appCheck.verify(token)
          ? inner(request)
          : failureResponse(request, 401, HomewardFailure.appCheckFailed);
    };
