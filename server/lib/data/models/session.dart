import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'session_listing.dart';

part 'session.freezed.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String ownerUid,
    @Default(0) int turnCount,
    String? lastInteractionId,
    DateTime? updatedAt,
    @Default([]) List<TurnRecord> turns,
  }) = _Session;

  const Session._();

  List<Map<String, Object?>> get messages => [
    for (final turn in turns) ...turn.messages,
  ];

  Map<String, Object?> get slices =>
      turns.isEmpty ? const {} : turns.last.slices;

  String? get title {
    for (final turn in turns) {
      if (turn.input case RecordedText(:final text) when text.isNotEmpty) {
        return text;
      }
    }
    return null;
  }

  SessionListing get listing => SessionListing(
    id: id,
    turnCount: turnCount,
    title: title,
    updatedAt: updatedAt,
  );
}
