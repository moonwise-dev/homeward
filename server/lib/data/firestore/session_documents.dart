import 'dart:convert';

import 'package:common/common.dart';
import 'package:google_cloud_firestore/google_cloud_firestore.dart';

import '../models/session.dart';
import '../models/session_listing.dart';

const sessionsCollection = 'sessions';
const plansCollection = 'plans';
const turnsCollection = 'turns';

String turnDocumentId(String sessionId, int index) => '$sessionId-$index';

Map<String, Object?> sessionDocument(Session session) => {
  'ownerUid': session.ownerUid,
  'title': session.title,
  'marketId': session.plan.marketId?.code,
  'turnCount': session.turnCount,
  'lastInteractionId': session.lastInteractionId,
  'updatedAt': session.updatedAt,
};

Map<String, Object?> planDocument(Session session) => {
  'ownerUid': session.ownerUid,
  'planJson': jsonEncode(session.plan.toJson()),
  'updatedAt': session.updatedAt,
};

Map<String, Object?> turnDocument(Session session, TurnRecord turn) => {
  'sessionId': session.id,
  'ownerUid': session.ownerUid,
  'index': turn.index,
  'status': turn.status.name,
  'recordJson': jsonEncode(turn.toJson()),
};

Map<String, Object?> mergeable(Map<String, Object?> document) => {
  for (final MapEntry(:key, :value) in document.entries)
    key: value ?? FieldValue.delete,
};

Session sessionOf({
  required String id,
  required Map<String, Object?> document,
  Map<String, Object?>? plan,
  List<Map<String, Object?>> turns = const [],
}) => Session(
  id: id,
  ownerUid: document['ownerUid']! as String,
  plan: plan == null ? const Plan() : Plan.fromJson(_decode(plan['planJson'])),
  turnCount: countOf(document['turnCount']),
  lastInteractionId: document['lastInteractionId'] as String?,
  updatedAt: dateTimeOf(document['updatedAt']),
  turns: [
    for (final turn in turns) TurnRecord.fromJson(_decode(turn['recordJson'])),
  ],
);

SessionListing listingOf(String id, Map<String, Object?> document) =>
    SessionListing(
      id: id,
      turnCount: countOf(document['turnCount']),
      title: document['title'] as String?,
      marketId: document['marketId'] as String?,
      updatedAt: dateTimeOf(document['updatedAt']),
    );

int countOf(Object? value) => switch (value) {
  final int count => count,
  final BigInt count => count.toInt(),
  _ => 0,
};

DateTime? dateTimeOf(Object? value) => switch (value) {
  final DateTime moment => moment,
  final Timestamp moment => moment.toDate(),
  final String moment => DateTime.tryParse(moment),
  _ => null,
};

Map<String, Object?> _decode(Object? value) =>
    jsonDecode(value! as String) as Map<String, Object?>;
