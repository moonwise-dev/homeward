// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoutinePlace _$RoutinePlaceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RoutinePlace', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'label', 'perWeek', 'pin']);
      final val = _RoutinePlace(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        perWeek: $checkedConvert('perWeek', (v) => (v as num?)?.toInt() ?? 1),
        pin: $checkedConvert(
          'pin',
          (v) =>
              v == null ? null : GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RoutinePlaceToJson(_RoutinePlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'perWeek': instance.perWeek,
      'pin': ?instance.pin?.toJson(),
    };
