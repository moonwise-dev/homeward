import 'package:shelf/shelf.dart';

import '../auth/identity_verifier.dart';
import '../errors/homeward_failure.dart';
import '../http/failure_response.dart';
import '../request/request_values.dart';

Middleware authenticationMiddleware(IdentityVerifier identity) =>
    (inner) => (request) async {
      final token = switch (request.headers['authorization']?.split(' ')) {
        [final scheme, final value] when scheme.toLowerCase() == 'bearer' =>
          value,
        _ => null,
      };
      final uid = token == null ? null : await identity.uidFor(token);
      return uid == null
          ? failureResponse(request, 401, HomewardFailure.unauthenticated)
          : inner(request.withCallerUid(uid));
    };
