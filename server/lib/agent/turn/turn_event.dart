import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../errors/homeward_failure.dart';

part 'turn_event.freezed.dart';

@freezed
sealed class TurnEvent with _$TurnEvent {
  const factory TurnEvent.working() = TurnWorking;

  const factory TurnEvent.text(String text) = TurnText;

  const factory TurnEvent.message(Map<String, Object?> message) = TurnMessage;

  const factory TurnEvent.progress(ResearchProgress progress) = TurnProgress;

  const factory TurnEvent.completed(String text) = TurnCompleted;

  const factory TurnEvent.failed(HomewardFailure failure) = TurnFailed;

  const factory TurnEvent.canceled() = TurnCanceled;
}
