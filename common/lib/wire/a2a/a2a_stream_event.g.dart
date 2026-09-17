// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a2a_stream_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

A2aTask _$A2aTaskFromJson(Map<String, dynamic> json) => $checkedCreate(
  'A2aTask',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['id', 'contextId', 'status', 'kind']);
    final val = A2aTask(
      id: $checkedConvert('id', (v) => v as String),
      contextId: $checkedConvert('contextId', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => TaskStatus.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('kind', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'kind'},
);

Map<String, dynamic> _$A2aTaskToJson(A2aTask instance) => <String, dynamic>{
  'id': instance.id,
  'contextId': instance.contextId,
  'status': instance.status.toJson(),
  'kind': instance.$type,
};

TaskStatusUpdate _$TaskStatusUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TaskStatusUpdate', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['taskId', 'contextId', 'status', 'final', 'kind'],
      );
      final val = TaskStatusUpdate(
        taskId: $checkedConvert('taskId', (v) => v as String),
        contextId: $checkedConvert('contextId', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => TaskStatus.fromJson(v as Map<String, dynamic>),
        ),
        isFinal: $checkedConvert('final', (v) => v as bool? ?? false),
        $type: $checkedConvert('kind', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'isFinal': 'final', r'$type': 'kind'});

Map<String, dynamic> _$TaskStatusUpdateToJson(TaskStatusUpdate instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'contextId': instance.contextId,
      'status': instance.status.toJson(),
      'final': instance.isFinal,
      'kind': instance.$type,
    };
