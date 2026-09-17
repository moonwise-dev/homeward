import 'package:shelf/shelf.dart';

import '../data/repository/session_repository.dart';
import '../errors/homeward_failure.dart';
import '../http/api_envelope.dart';
import '../request/request_values.dart';

final class SessionsHandler {
  const SessionsHandler(this.sessions);

  final SessionRepository sessions;

  Future<Response> create(Request request) async {
    final uid = request.callerUid;
    if (uid == null) {
      return apiError(401, HomewardFailure.unauthenticated);
    }
    final session = await sessions.create(uid);
    return apiOk(201, {'sessionId': session.id});
  }
}
