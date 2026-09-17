import 'package:freezed_annotation/freezed_annotation.dart';

import 'a2a_message.dart';
import 'task_state.dart';

part 'task_status.freezed.dart';
part 'task_status.g.dart';

@freezed
abstract class TaskStatus with _$TaskStatus {
  const factory TaskStatus({
    required TaskState state,
    A2aMessage? message,
    String? timestamp,
  }) = _TaskStatus;

  factory TaskStatus.fromJson(Map<String, Object?> json) =>
      _$TaskStatusFromJson(json);
}
