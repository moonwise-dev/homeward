import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'turn_input.freezed.dart';

@freezed
sealed class TurnInput with _$TurnInput {
  const factory TurnInput.text(String text, {StoryReason? reason}) =
      TextTurnInput;

  const factory TurnInput.action(
    ClientAction action, {
    @Default({}) Map<String, Object?> surfaceData,
  }) = ActionTurnInput;
}
