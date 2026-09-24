// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapRoute _$MapRouteFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MapRoute',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'candidateId',
        'anchorId',
        'mode',
        'minutes',
        'label',
        'path',
      ],
    );
    final val = _MapRoute(
      candidateId: $checkedConvert('candidateId', (v) => v as String),
      anchorId: $checkedConvert('anchorId', (v) => v as String),
      mode: $checkedConvert('mode', (v) => $enumDecode(_$TravelModeEnumMap, v)),
      minutes: $checkedConvert('minutes', (v) => (v as num).toInt()),
      label: $checkedConvert('label', (v) => v as String),
      path: $checkedConvert(
        'path',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => (e as List<dynamic>)
                      .map((e) => (e as num).toDouble())
                      .toList(),
                )
                .toList() ??
            const [],
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$MapRouteToJson(_MapRoute instance) => <String, dynamic>{
  'candidateId': instance.candidateId,
  'anchorId': instance.anchorId,
  'mode': _$TravelModeEnumMap[instance.mode]!,
  'minutes': instance.minutes,
  'label': instance.label,
  'path': instance.path,
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};
