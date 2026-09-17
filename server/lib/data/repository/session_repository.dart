import '../models/session.dart';

abstract interface class SessionRepository {
  Future<Session> create(String ownerUid);

  Future<Session?> find(String id);

  Future<void> save(Session session);

  Future<bool> lease(String id);

  Future<void> release(String id);
}
