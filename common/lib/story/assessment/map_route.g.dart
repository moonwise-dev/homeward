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
        'origin',
        'destination',
        'perWeek',
        'path',
      ],
    );
    final val = _MapRoute(
      candidateId: $checkedConvert('candidateId', (v) => v as String),
      anchorId: $checkedConvert('anchorId', (v) => v as String),
      mode: $checkedConvert('mode', (v) => $enumDecode(_$TravelModeEnumMap, v)),
      minutes: $checkedConvert('minutes', (v) => (v as num).toInt()),
      label: $checkedConvert('label', (v) => v as String),
      origin: $checkedConvert(
        'origin',
        (v) => MapPin.fromJson(v as Map<String, dynamic>),
      ),
      destination: $checkedConvert(
        'destination',
        (v) => MapPin.fromJson(v as Map<String, dynamic>),
      ),
      perWeek: $checkedConvert('perWeek', (v) => (v as num?)?.toInt() ?? 1),
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
  'origin': instance.origin.toJson(),
  'destination': instance.destination.toJson(),
  'perWeek': instance.perWeek,
  'path': instance.path,
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};
