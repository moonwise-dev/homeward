import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../errors/app_error.dart';
import 'agent_turn_status.dart';

part 'transcript_entry.freezed.dart';

@freezed
sealed class TranscriptEntry with _$TranscriptEntry {
  const factory TranscriptEntry.buyer({
    required String id,
    required String text,
  }) = BuyerEntry;

  const factory TranscriptEntry.buyerAction({
    required String id,
    required String actionName,
  }) = BuyerActionEntry;

  const factory TranscriptEntry.agent({
    required String id,
    required TurnRequest request,
    required AgentTurnStatus status,
    @Default('') String text,
    @Default([]) List<String> surfaceIds,
    AppError? error,
  }) = AgentEntry;
}
