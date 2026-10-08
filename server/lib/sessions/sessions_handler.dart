import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../data/repository/session_repository.dart';
import '../errors/homeward_failure.dart';
import '../http/api_envelope.dart';

final class SessionsHandler {
  const SessionsHandler(this.sessions);

  final SessionRepository sessions;

  Response create(Request request) =>
      apiOk(201, {'sessionId': sessions.create().id});

  Response transcript(Request request, String sessionId) =>
      switch (sessions.find(sessionId)) {
        final session? => apiOk(
          200,
          PlanTranscript(sessionId: session.id, turns: session.turns).toJson(),
        ),
        null => apiError(404, HomewardFailure.sessionNotFound),
      };
}
