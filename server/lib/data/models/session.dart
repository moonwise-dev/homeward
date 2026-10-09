import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    @Default(0) int turnCount,
    String? lastInteractionId,
    @Default([]) List<TurnRecord> turns,
    @Default({}) Map<String, Map<String, Object?>> handedCards,
    @Default({}) Map<String, String> cardNotes,
  }) = _Session;

  const Session._();

  List<Map<String, Object?>> get messages => [
    for (final turn in turns) ...turn.messages,
  ];

  Map<String, Object?> get slices =>
      turns.isEmpty ? const {} : turns.last.slices;
}
