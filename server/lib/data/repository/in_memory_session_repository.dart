import '../../ids/random_hex.dart';
import '../models/session.dart';
import '../models/session_listing.dart';
import 'session_repository.dart';

final class InMemorySessionRepository implements SessionRepository {
  InMemorySessionRepository({String Function()? newId})
    : _newId = newId ?? (() => randomHex(16));

  final String Function() _newId;
  final _sessions = <String, Session>{};
  final _leased = <String>{};

  @override
  Future<Session> create(String ownerUid) async {
    final session = Session(id: _newId(), ownerUid: ownerUid);
    _sessions[session.id] = session;
    return session;
  }

  @override
  Future<Session?> find(String id) async => _sessions[id];

  @override
  Future<List<SessionListing>> listingsOf(String ownerUid) async => [
    for (final session in _sessions.values)
      if (session.ownerUid == ownerUid) session.listing,
  ]..sort((a, b) => _at(b.updatedAt).compareTo(_at(a.updatedAt)));

  int _at(DateTime? moment) => moment?.millisecondsSinceEpoch ?? 0;

  @override
  Future<void> save(Session session) async => _sessions[session.id] = session;

  @override
  Future<bool> lease(String id) async =>
      _sessions.containsKey(id) && _leased.add(id);

  @override
  Future<void> release(String id) async => _leased.remove(id);
}
