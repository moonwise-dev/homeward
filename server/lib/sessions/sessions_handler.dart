import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../agent/board/compile_board.dart';
import '../data/models/session.dart';
import '../data/repository/session_repository.dart';
import '../errors/homeward_failure.dart';
import '../http/api_envelope.dart';
import '../markets/market_directory.dart';
import '../request/request_values.dart';

final class SessionsHandler {
  const SessionsHandler(this.sessions, this.markets);

  final SessionRepository sessions;
  final MarketDirectory markets;

  Future<Response> create(Request request) async {
    final uid = request.callerUid;
    if (uid == null) {
      return apiError(401, HomewardFailure.unauthenticated);
    }
    final session = await sessions.create(uid);
    return apiOk(201, {'sessionId': session.id});
  }

  Future<Response> list(Request request) async {
    final uid = request.callerUid;
    if (uid == null) {
      return apiError(401, HomewardFailure.unauthenticated);
    }
    final owned = await sessions.ownedBy(uid);
    return apiOk(200, {
      'sessions': [
        for (final session in owned)
          PlanListing(
            sessionId: session.id,
            turnCount: session.turnCount,
            title: _titleOf(session),
            marketId: session.plan.marketId?.code,
            marketName: switch (session.plan.marketId) {
              final id? => markets.nameOf(id),
              null => null,
            },
            updatedAt: session.updatedAt,
          ).toJson(),
      ],
    });
  }

  String? _titleOf(Session session) {
    for (final turn in session.turns) {
      if (turn.input case RecordedText(:final text) when text.isNotEmpty) {
        return text;
      }
    }
    return null;
  }

  Future<Response> transcript(Request request, String sessionId) async {
    final uid = request.callerUid;
    if (uid == null) {
      return apiError(401, HomewardFailure.unauthenticated);
    }
    final session = await sessions.find(sessionId);
    if (session == null || session.ownerUid != uid) {
      return apiError(404, HomewardFailure.sessionNotFound);
    }
    return apiOk(
      200,
      PlanTranscript(
        sessionId: session.id,
        turns: session.turns,
        board: compileBoard(plan: session.plan, markets: markets),
      ).toJson(),
    );
  }
}
