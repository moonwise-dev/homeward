import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_status.dart';

part 'a2a_stream_event.freezed.dart';
part 'a2a_stream_event.g.dart';

@Freezed(unionKey: 'kind')
sealed class A2aStreamEvent with _$A2aStreamEvent {
  @FreezedUnionValue('task')
  const factory A2aStreamEvent.task({
    required String id,
    required String contextId,
    required TaskStatus status,
  }) = A2aTask;

  @FreezedUnionValue('status-update')
  const factory A2aStreamEvent.statusUpdate({
    required String taskId,
    required String contextId,
    required TaskStatus status,
    @JsonKey(name: 'final') @Default(false) bool isFinal,
  }) = TaskStatusUpdate;

  factory A2aStreamEvent.fromJson(Map<String, Object?> json) =>
      _$A2aStreamEventFromJson(json);
}
