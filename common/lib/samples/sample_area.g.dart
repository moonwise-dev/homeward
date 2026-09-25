// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SampleArea _$SampleAreaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SampleArea', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'name',
          'point',
          'character',
          'flatPricePerM2',
          'housePricePerM2',
          'sourceId',
        ],
      );
      final val = _SampleArea(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        point: $checkedConvert(
          'point',
          (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
        character: $checkedConvert('character', (v) => v as String),
        flatPricePerM2: $checkedConvert(
          'flatPricePerM2',
          (v) => (v as num?)?.toInt(),
        ),
        housePricePerM2: $checkedConvert(
          'housePricePerM2',
          (v) => (v as num?)?.toInt(),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SampleAreaToJson(_SampleArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'point': instance.point.toJson(),
      'character': instance.character,
      'flatPricePerM2': ?instance.flatPricePerM2,
      'housePricePerM2': ?instance.housePricePerM2,
      'sourceId': instance.sourceId,
    };
