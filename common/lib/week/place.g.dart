// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Place', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'name', 'address', 'point']);
      final val = _Place(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        address: $checkedConvert('address', (v) => v as String),
        point: $checkedConvert(
          'point',
          (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'point': instance.point.toJson(),
};
