import 'package:freezed_annotation/freezed_annotation.dart';

import 'gemini_exception.dart';

part 'interaction_event.freezed.dart';

@freezed
sealed class InteractionEvent with _$InteractionEvent {
  const factory InteractionEvent.created({
    required String interactionId,
    required String model,
  }) = InteractionCreated;

  const factory InteractionEvent.textDelta(String text) = TextDelta;

  const factory InteractionEvent.functionCall({
    required String callId,
    required String name,
    required Map<String, Object?> arguments,
  }) = FunctionCall;

  const factory InteractionEvent.completed({
    required String interactionId,
    required String status,
    Map<String, Object?>? usage,
  }) = InteractionCompleted;

  const factory InteractionEvent.modelFailed({
    required String model,
    required GeminiUnavailable reason,
  }) = ModelFailed;
}
