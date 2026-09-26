import 'package:google_cloud_firestore/google_cloud_firestore.dart';

import '../../ids/random_hex.dart';
import '../firestore/session_documents.dart';
import '../models/session.dart';
import '../models/session_listing.dart';
import 'session_repository.dart';

final class FirestoreSessionRepository implements SessionRepository {
  FirestoreSessionRepository(
    this._firestore, {
    String Function()? newId,
    DateTime Function()? now,
    this.leaseFor = const Duration(minutes: 5),
  }) : _newId = newId ?? (() => randomHex(16)),
       _now = now ?? DateTime.now;

  final Firestore _firestore;
  final String Function() _newId;
  final DateTime Function() _now;
  final Duration leaseFor;

  @override
  Future<Session> create(String ownerUid) async {
    final session = Session(
      id: _newId(),
      ownerUid: ownerUid,
      updatedAt: _now(),
    );
    await _session(session.id).set({
      ...sessionDocument(session),
      'createdAt': session.updatedAt,
    });
    return session;
  }

  @override
  Future<Session?> find(String id) async {
    final document = (await _session(id).get()).data();
    if (document == null) {
      return null;
    }
    final count = countOf(document['turnCount']);
    final turns = count == 0
        ? const <DocumentSnapshot<DocumentData>>[]
        : await _firestore.getAll([
            for (var index = 1; index <= count; index++) _turn(id, index),
          ]);
    return sessionOf(
      id: id,
      document: document,
      turns: [for (final turn in turns) ?turn.data()],
    );
  }

  @override
  Future<List<SessionListing>> listingsOf(String ownerUid) async {
    final found = await _firestore
        .collection(sessionsCollection)
        .where('ownerUid', WhereFilter.equal, ownerUid)
        .orderBy('updatedAt', descending: true)
        .get();
    return [
      for (final document in found.docs)
        listingOf(document.id, document.data()),
    ];
  }

  @override
  Future<void> save(Session session) async {
    final stored = (await _session(session.id).get()).data();
    final written = countOf(stored?['turnCount']);
    final batch = _firestore.batch()
      ..set(
        _session(session.id),
        mergeable(sessionDocument(session)),
        options: const SetOptions.merge(),
      );
    for (final turn in session.turns) {
      if (turn.index > written) {
        batch.set(
          _turn(session.id, turn.index),
          turnDocument(session, turn),
        );
      }
    }
    await batch.commit();
  }

  @override
  Future<bool> lease(String id) =>
      _firestore.runTransaction((transaction) async {
        final document = (await transaction.get(_session(id))).data();
        if (document == null) {
          return false;
        }
        final until = dateTimeOf(document['leaseUntil']);
        if (until != null && until.isAfter(_now())) {
          return false;
        }
        transaction.set(_session(id), {
          'leaseUntil': _now().add(leaseFor),
        }, options: const SetOptions.merge());
        return true;
      });

  @override
  Future<void> release(String id) async => _session(id).set(
    mergeable({'leaseUntil': null}),
    options: const SetOptions.merge(),
  );

  DocumentReference<DocumentData> _session(String id) =>
      _firestore.collection(sessionsCollection).doc(id);

  DocumentReference<DocumentData> _turn(String sessionId, int index) =>
      _firestore
          .collection(turnsCollection)
          .doc(turnDocumentId(sessionId, index));
}
