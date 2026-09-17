// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_id_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskIdParams _$TaskIdParamsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaskIdParams', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'historyLength', 'metadata']);
      final val = _TaskIdParams(
        id: $checkedConvert('id', (v) => v as String),
        historyLength: $checkedConvert(
          'historyLength',
          (v) => (v as num?)?.toInt(),
        ),
        metadata: $checkedConvert(
          'metadata',
          (v) => v as Map<String, dynamic>?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$TaskIdParamsToJson(_TaskIdParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'historyLength': ?instance.historyLength,
      'metadata': ?instance.metadata,
    };
