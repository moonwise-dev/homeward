import '../../ids/random_hex.dart';
import '../models/session.dart';

final class SessionRepository {
  SessionRepository({String Function()? newId, this.capacity = 500})
    : _newId = newId ?? (() => randomHex(16));

  final String Function() _newId;
  final int capacity;
  final _sessions = <String, Session>{};
  final _leased = <String>{};

  Session create() {
    final session = Session(id: _newId());
    save(session);
    while (_sessions.length > capacity) {
      _sessions.remove(_sessions.keys.first);
    }
    return session;
  }

  Session? find(String id) => _sessions[id];

  void save(Session session) => _sessions
    ..remove(session.id)
    ..[session.id] = session;

  bool lease(String id) => _sessions.containsKey(id) && _leased.add(id);

  void release(String id) => _leased.remove(id);
}
