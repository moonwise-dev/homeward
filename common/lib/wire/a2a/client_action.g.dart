// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientAction _$ClientActionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ClientAction', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'name',
          'surfaceId',
          'sourceComponentId',
          'timestamp',
          'context',
        ],
      );
      final val = _ClientAction(
        name: $checkedConvert('name', (v) => v as String),
        surfaceId: $checkedConvert('surfaceId', (v) => v as String),
        sourceComponentId: $checkedConvert(
          'sourceComponentId',
          (v) => v as String,
        ),
        timestamp: $checkedConvert('timestamp', (v) => v as String?),
        context: $checkedConvert(
          'context',
          (v) => v as Map<String, dynamic>? ?? const {},
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientActionToJson(_ClientAction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surfaceId': instance.surfaceId,
      'sourceComponentId': instance.sourceComponentId,
      'timestamp': ?instance.timestamp,
      'context': instance.context,
    };
