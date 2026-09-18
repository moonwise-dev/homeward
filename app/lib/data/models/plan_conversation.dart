import 'package:freezed_annotation/freezed_annotation.dart';

import 'transcript_entry.dart';

part 'plan_conversation.freezed.dart';

@freezed
abstract class PlanConversation with _$PlanConversation {
  const factory PlanConversation({
    @Default([]) List<TranscriptEntry> entries,
    @Default(false) bool isRunning,
    @Default(false) bool hasBoard,
  }) = _PlanConversation;
}
