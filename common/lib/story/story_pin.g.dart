// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_pin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoryPin _$StoryPinFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StoryPin', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['label', 'lat', 'lng']);
      final val = _StoryPin(
        label: $checkedConvert('label', (v) => v as String),
        lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$StoryPinToJson(_StoryPin instance) => <String, dynamic>{
  'label': instance.label,
  'lat': instance.lat,
  'lng': instance.lng,
};
