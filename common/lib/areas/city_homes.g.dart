// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_homes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeMap _$HomeMapFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_HomeMap',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'cityId',
        'cityName',
        'centre',
        'renting',
        'highestPrice',
        'household',
        'places',
        'areas',
        'homes',
      ],
    );
    final val = _HomeMap(
      cityId: $checkedConvert('cityId', (v) => v as String),
      cityName: $checkedConvert('cityName', (v) => v as String),
      centre: $checkedConvert(
        'centre',
        (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
      ),
      renting: $checkedConvert('renting', (v) => v as bool? ?? false),
      highestPrice: $checkedConvert(
        'highestPrice',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      household: $checkedConvert(
        'household',
        (v) =>
            v == null ? null : MapHousehold.fromJson(v as Map<String, dynamic>),
      ),
      places: $checkedConvert(
        'places',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => MapPlace.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      areas: $checkedConvert(
        'areas',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => MapArea.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      homes: $checkedConvert(
        'homes',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => MapHome.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$HomeMapToJson(_HomeMap instance) => <String, dynamic>{
  'cityId': instance.cityId,
  'cityName': instance.cityName,
  'centre': instance.centre.toJson(),
  'renting': instance.renting,
  'highestPrice': ?instance.highestPrice?.toJson(),
  'household': ?instance.household?.toJson(),
  'places': instance.places.map((e) => e.toJson()).toList(),
  'areas': instance.areas.map((e) => e.toJson()).toList(),
  'homes': instance.homes.map((e) => e.toJson()).toList(),
};

_MapHousehold _$MapHouseholdFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapHousehold', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'adults',
          'childAges',
          'grossMonthlyIncome',
          'savings',
          'maxRent',
          'assumed',
        ],
      );
      final val = _MapHousehold(
        adults: $checkedConvert('adults', (v) => (v as num?)?.toInt()),
        childAges: $checkedConvert(
          'childAges',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
        grossMonthlyIncome: $checkedConvert(
          'grossMonthlyIncome',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        savings: $checkedConvert(
          'savings',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        maxRent: $checkedConvert(
          'maxRent',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        assumed: $checkedConvert(
          'assumed',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$ProfileAssumptionEnumMap, e))
                  .toSet() ??
              const {},
        ),
      );
      return val;
    });

Map<String, dynamic> _$MapHouseholdToJson(_MapHousehold instance) =>
    <String, dynamic>{
      'adults': ?instance.adults,
      'childAges': ?instance.childAges,
      'grossMonthlyIncome': ?instance.grossMonthlyIncome?.toJson(),
      'savings': ?instance.savings?.toJson(),
      'maxRent': ?instance.maxRent?.toJson(),
      'assumed': instance.assumed
          .map((e) => _$ProfileAssumptionEnumMap[e]!)
          .toList(),
    };

const _$ProfileAssumptionEnumMap = {
  ProfileAssumption.takeHomePay: 'takeHomePay',
  ProfileAssumption.debts: 'debts',
  ProfileAssumption.children: 'children',
  ProfileAssumption.adults: 'adults',
  ProfileAssumption.residency: 'residency',
  ProfileAssumption.use: 'use',
  ProfileAssumption.employment: 'employment',
  ProfileAssumption.age: 'age',
};

_MapPlace _$MapPlaceFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MapPlace',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['id', 'name', 'point', 'perWeek', 'mode', 'assumed'],
    );
    final val = _MapPlace(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      point: $checkedConvert(
        'point',
        (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
      ),
      perWeek: $checkedConvert('perWeek', (v) => (v as num).toInt()),
      mode: $checkedConvert('mode', (v) => $enumDecode(_$TravelModeEnumMap, v)),
      assumed: $checkedConvert('assumed', (v) => v as bool? ?? false),
    );
    return val;
  },
);

Map<String, dynamic> _$MapPlaceToJson(_MapPlace instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'point': instance.point.toJson(),
  'perWeek': instance.perWeek,
  'mode': _$TravelModeEnumMap[instance.mode]!,
  'assumed': instance.assumed,
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};

_MapArea _$MapAreaFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MapArea',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['areaId', 'areaName', 'centre', 'minutes', 'routes'],
    );
    final val = _MapArea(
      areaId: $checkedConvert('areaId', (v) => v as String),
      areaName: $checkedConvert('areaName', (v) => v as String),
      centre: $checkedConvert(
        'centre',
        (v) => GeoPoint.fromJson(v as Map<String, dynamic>),
      ),
      minutes: $checkedConvert(
        'minutes',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, (e as num).toInt()),
            ) ??
            const {},
      ),
      routes: $checkedConvert(
        'routes',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, e as String),
            ) ??
            const {},
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$MapAreaToJson(_MapArea instance) => <String, dynamic>{
  'areaId': instance.areaId,
  'areaName': instance.areaName,
  'centre': instance.centre.toJson(),
  'minutes': instance.minutes,
  'routes': instance.routes,
};

_MapHome _$MapHomeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapHome', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'listing',
          'cost',
          'rent',
          'ifRatesRise',
          'withinBudget',
          'why',
        ],
      );
      final val = _MapHome(
        listing: $checkedConvert(
          'listing',
          (v) => Listing.fromJson(v as Map<String, dynamic>),
        ),
        cost: $checkedConvert(
          'cost',
          (v) =>
              v == null ? null : HomeCost.fromJson(v as Map<String, dynamic>),
        ),
        rent: $checkedConvert(
          'rent',
          (v) =>
              v == null ? null : RentFigure.fromJson(v as Map<String, dynamic>),
        ),
        ifRatesRise: $checkedConvert(
          'ifRatesRise',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        withinBudget: $checkedConvert('withinBudget', (v) => v as bool?),
        why: $checkedConvert('why', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$MapHomeToJson(_MapHome instance) => <String, dynamic>{
  'listing': instance.listing.toJson(),
  'cost': ?instance.cost?.toJson(),
  'rent': ?instance.rent?.toJson(),
  'ifRatesRise': ?instance.ifRatesRise?.toJson(),
  'withinBudget': ?instance.withinBudget,
  'why': ?instance.why,
};
