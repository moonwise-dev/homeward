// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anchor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Anchor _$AnchorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Anchor', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'label',
          'query',
          'point',
          'mode',
          'maxMinutes',
          'perWeek',
        ],
      );
      final val = _Anchor(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        query: $checkedConvert('query', (v) => v as String),
        point: $checkedConvert(
          'point',
          (v) =>
              v == null ? null : GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
        mode: $checkedConvert(
          'mode',
          (v) =>
              $enumDecodeNullable(_$TravelModeEnumMap, v) ?? TravelMode.transit,
        ),
        maxMinutes: $checkedConvert(
          'maxMinutes',
          (v) => (v as num?)?.toInt() ?? 30,
        ),
        perWeek: $checkedConvert('perWeek', (v) => (v as num?)?.toInt() ?? 5),
      );
      return val;
    });

Map<String, dynamic> _$AnchorToJson(_Anchor instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'query': instance.query,
  'point': ?instance.point?.toJson(),
  'mode': _$TravelModeEnumMap[instance.mode]!,
  'maxMinutes': instance.maxMinutes,
  'perWeek': instance.perWeek,
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};
