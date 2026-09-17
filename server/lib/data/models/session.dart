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
    @Default([]) List<Map<String, Object?>> messages,
  }) = _Session;
}
