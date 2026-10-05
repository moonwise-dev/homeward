// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeekTravel _$WeekTravelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_WeekTravel', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['fromId', 'fromName', 'from', 'trips'],
      );
      final val = _WeekTravel(
        fromId: $checkedConvert('fromId', (v) => v as String),
        fromName: $checkedConvert('fromName', (v) => v as String),
        from: $checkedConvert(
          'from',
          (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
        trips: $checkedConvert(
          'trips',
          (v) => (v as List<dynamic>)
              .map((e) => Trip.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WeekTravelToJson(_WeekTravel instance) =>
    <String, dynamic>{
      'fromId': instance.fromId,
      'fromName': instance.fromName,
      'from': instance.from.toJson(),
      'trips': instance.trips.map((e) => e.toJson()).toList(),
    };

_Trip _$TripFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Trip',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'placeId',
        'placeName',
        'to',
        'perWeek',
        'mode',
        'minutes',
        'meters',
        'polyline',
      ],
    );
    final val = _Trip(
      placeId: $checkedConvert('placeId', (v) => v as String),
      placeName: $checkedConvert('placeName', (v) => v as String),
      to: $checkedConvert(
        'to',
        (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
      ),
      perWeek: $checkedConvert('perWeek', (v) => (v as num).toInt()),
      mode: $checkedConvert('mode', (v) => $enumDecode(_$TravelModeEnumMap, v)),
      minutes: $checkedConvert('minutes', (v) => (v as num?)?.toInt()),
      meters: $checkedConvert('meters', (v) => (v as num?)?.toInt()),
      polyline: $checkedConvert('polyline', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$TripToJson(_Trip instance) => <String, dynamic>{
  'placeId': instance.placeId,
  'placeName': instance.placeName,
  'to': instance.to.toJson(),
  'perWeek': instance.perWeek,
  'mode': _$TravelModeEnumMap[instance.mode]!,
  'minutes': ?instance.minutes,
  'meters': ?instance.meters,
  'polyline': ?instance.polyline,
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};
