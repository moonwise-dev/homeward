import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:google_cloud_firestore/google_cloud_firestore.dart';
import 'package:logging/logging.dart';

import '../../logging/log_entry.dart';
import '../../research/open_data/research_cache.dart';

const researchCacheCollection = 'researchCache';

final _log = Logger('research');

final class FirestoreResearchCache implements ResearchCache {
  FirestoreResearchCache(
    this._firestore, {
    this.keepFor = const Duration(days: 7),
    this.maxBytes = 900000,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final Firestore _firestore;
  final Duration keepFor;
  final int maxBytes;
  final DateTime Function() _now;

  @override
  Future<Object?> read(String key) async {
    try {
      final document = (await _document(key).get()).data();
      return switch (document) {
        {'value': final Uint8List value, 'expiresAt': final Object expiresAt}
            when _dateOf(expiresAt).isAfter(_now()) =>
          jsonDecode(utf8.decode(gzip.decode(value))),
        _ => null,
      };
    } on Object catch (error) {
      _unavailable('read', error);
      return null;
    }
  }

  @override
  Future<void> write(String key, Object value) async {
    final bytes = Uint8List.fromList(
      gzip.encode(utf8.encode(jsonEncode(value))),
    );
    if (bytes.length > maxBytes) {
      return;
    }
    try {
      await _document(key).set({
        'value': bytes,
        'expiresAt': _now().add(keepFor),
      });
    } on Object catch (error) {
      _unavailable('write', error);
    }
  }

  DocumentReference<Map<String, Object?>> _document(String key) => _firestore
      .collection(researchCacheCollection)
      .doc(sha256.convert(utf8.encode(key)).toString());

  DateTime _dateOf(Object value) => switch (value) {
    final Timestamp moment => moment.toDate(),
    final DateTime moment => moment,
    _ => DateTime.fromMillisecondsSinceEpoch(0),
  };

  void _unavailable(String operation, Object error) => _log.warning(
    LogEntry(
      'Research cache $operation failed',
      fields: {'operation': operation, 'error': error.runtimeType.toString()},
    ),
  );
}
