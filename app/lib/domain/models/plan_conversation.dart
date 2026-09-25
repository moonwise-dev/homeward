import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_error.dart';

part 'plan_conversation.freezed.dart';

@freezed
abstract class PlanConversation with _$PlanConversation {
  const factory PlanConversation({
    @Default([]) List<TranscriptEntry> entries,
    @Default(false) bool isRunning,
  }) = _PlanConversation;
}

@freezed
sealed class TranscriptEntry with _$TranscriptEntry {
  const factory TranscriptEntry.buyer({
    required String id,
    required String text,
  }) = BuyerEntry;

  const factory TranscriptEntry.buyerAction({
    required String id,
    required String actionName,
    String? label,
  }) = BuyerActionEntry;

  const factory TranscriptEntry.agent({
    required String id,
    required TurnRequest request,
    required AgentTurnStatus status,
    @Default('') String text,
    @Default([]) List<String> surfaceIds,
    @Default(ResearchProgress()) ResearchProgress progress,
    AppError? error,
  }) = AgentEntry;
}

enum AgentTurnStatus { streaming, completed, canceled, failed }

@freezed
abstract class TurnFailure with _$TurnFailure {
  const factory TurnFailure({
    required String entryId,
    required AppError error,
  }) = _TurnFailure;
}
