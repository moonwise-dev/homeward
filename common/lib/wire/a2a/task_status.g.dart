// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskStatus _$TaskStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskStatus', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['state', 'message', 'timestamp']);
      final val = _TaskStatus(
        state: $checkedConvert(
          'state',
          (v) => $enumDecode(_$TaskStateEnumMap, v),
        ),
        message: $checkedConvert(
          'message',
          (v) =>
              v == null ? null : A2aMessage.fromJson(v as Map<String, dynamic>),
        ),
        timestamp: $checkedConvert('timestamp', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TaskStatusToJson(_TaskStatus instance) =>
    <String, dynamic>{
      'state': _$TaskStateEnumMap[instance.state]!,
      'message': ?instance.message?.toJson(),
      'timestamp': ?instance.timestamp,
    };

const _$TaskStateEnumMap = {
  TaskState.submitted: 'submitted',
  TaskState.working: 'working',
  TaskState.completed: 'completed',
  TaskState.canceled: 'canceled',
};
