import 'package:freezed_annotation/freezed_annotation.dart';

import 'a2a/client_action.dart';

part 'plan_transcript.freezed.dart';
part 'plan_transcript.g.dart';

enum TurnStatus { completed, failed, canceled }

@freezed
sealed class RecordedInput with _$RecordedInput {
  const factory RecordedInput.text(String text) = RecordedText;

  const factory RecordedInput.action({
    required String name,
    required String surfaceId,
    required String sourceComponentId,
    @Default({}) Map<String, Object?> context,
  }) = RecordedAction;

  factory RecordedInput.fromJson(Map<String, Object?> json) =>
      _$RecordedInputFromJson(json);
}

@freezed
abstract class TurnRecord with _$TurnRecord {
  const factory TurnRecord({
    required int index,
    required RecordedInput input,
    @Default('') String outputText,
    @Default([]) List<Map<String, Object?>> messages,
    required TurnStatus status,
    String? errorCode,
  }) = _TurnRecord;

  factory TurnRecord.fromJson(Map<String, Object?> json) =>
      _$TurnRecordFromJson(json);
}

@freezed
abstract class PlanListing with _$PlanListing {
  const factory PlanListing({
    required String sessionId,
    @Default(0) int turnCount,
    String? title,
    String? marketId,
    String? marketName,
    DateTime? updatedAt,
  }) = _PlanListing;

  factory PlanListing.fromJson(Map<String, Object?> json) =>
      _$PlanListingFromJson(json);
}

@freezed
abstract class PlanTranscript with _$PlanTranscript {
  const factory PlanTranscript({
    required String sessionId,
    @Default([]) List<TurnRecord> turns,
  }) = _PlanTranscript;

  factory PlanTranscript.fromJson(Map<String, Object?> json) =>
      _$PlanTranscriptFromJson(json);
}

RecordedInput recordedInputOf(ClientAction action) => RecordedInput.action(
  name: action.name,
  surfaceId: action.surfaceId,
  sourceComponentId: action.sourceComponentId,
  context: action.context,
);
