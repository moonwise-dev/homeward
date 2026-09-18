import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String ownerUid,
    @Default(Plan()) Plan plan,
    @Default(0) int turnCount,
    String? lastInteractionId,
    DateTime? updatedAt,
    @Default([]) List<TurnRecord> turns,
  }) = _Session;

  const Session._();

  List<Map<String, Object?>> get messages => [
    for (final turn in turns) ...turn.messages,
  ];
}
