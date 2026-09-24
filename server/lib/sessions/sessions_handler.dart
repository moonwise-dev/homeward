import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

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
    final listings = await sessions.listingsOf(uid);
    return apiOk(200, {
      'sessions': [
        for (final listing in listings)
          PlanListing(
            sessionId: listing.id,
            turnCount: listing.turnCount,
            title: listing.title,
            marketId: listing.marketId,
            marketName: switch (listing.marketId) {
              final code? => markets.nameOf(MarketId.parse(code)),
              null => null,
            },
            updatedAt: listing.updatedAt,
          ).toJson(),
      ],
    });
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
      PlanTranscript(sessionId: session.id, turns: session.turns).toJson(),
    );
  }
}
