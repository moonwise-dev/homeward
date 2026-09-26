// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapPin _$MapPinFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapPin', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['lat', 'lng', 'label']);
      final val = _MapPin(
        lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num).toDouble()),
        label: $checkedConvert('label', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$MapPinToJson(_MapPin instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'label': instance.label,
};
