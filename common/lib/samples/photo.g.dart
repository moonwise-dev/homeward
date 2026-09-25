// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoCredit _$PhotoCreditFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PhotoCredit', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['name', 'url']);
      final val = _PhotoCredit(
        name: $checkedConvert('name', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PhotoCreditToJson(_PhotoCredit instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_PhotoTraits _$PhotoTraitsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_PhotoTraits', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const ['homeType', 'outdoor', 'style', 'criteria', 'areaIds'],
  );
  final val = _PhotoTraits(
    homeType: $checkedConvert(
      'homeType',
      (v) => $enumDecodeNullable(_$HomeTypeEnumMap, v),
    ),
    outdoor: $checkedConvert(
      'outdoor',
      (v) => $enumDecodeNullable(_$OutdoorSpaceEnumMap, v),
    ),
    style: $checkedConvert(
      'style',
      (v) => $enumDecodeNullable(_$HomeStyleEnumMap, v),
    ),
    criteria: $checkedConvert(
      'criteria',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CriterionKindEnumMap, e))
              .toList() ??
          const [],
    ),
    areaIds: $checkedConvert(
      'areaIds',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$PhotoTraitsToJson(
  _PhotoTraits instance,
) => <String, dynamic>{
  'homeType': ?_$HomeTypeEnumMap[instance.homeType],
  'outdoor': ?_$OutdoorSpaceEnumMap[instance.outdoor],
  'style': ?_$HomeStyleEnumMap[instance.style],
  'criteria': instance.criteria.map((e) => _$CriterionKindEnumMap[e]!).toList(),
  'areaIds': instance.areaIds,
};

const _$HomeTypeEnumMap = {HomeType.flat: 'flat', HomeType.house: 'house'};

const _$OutdoorSpaceEnumMap = {
  OutdoorSpace.none: 'none',
  OutdoorSpace.balcony: 'balcony',
  OutdoorSpace.garden: 'garden',
};

const _$HomeStyleEnumMap = {
  HomeStyle.classic: 'classic',
  HomeStyle.modern: 'modern',
};

const _$CriterionKindEnumMap = {
  CriterionKind.commute: 'commute',
  CriterionKind.schools: 'schools',
  CriterionKind.preschool: 'preschool',
  CriterionKind.groceries: 'groceries',
  CriterionKind.pharmacy: 'pharmacy',
  CriterionKind.healthcare: 'healthcare',
  CriterionKind.gym: 'gym',
  CriterionKind.swimming: 'swimming',
  CriterionKind.parks: 'parks',
  CriterionKind.running: 'running',
  CriterionKind.playground: 'playground',
  CriterionKind.water: 'water',
  CriterionKind.restaurants: 'restaurants',
  CriterionKind.cafes: 'cafes',
  CriterionKind.nightlife: 'nightlife',
  CriterionKind.quiet: 'quiet',
  CriterionKind.transit: 'transit',
  CriterionKind.parking: 'parking',
  CriterionKind.charging: 'charging',
  CriterionKind.noise: 'noise',
};

_Photo _$PhotoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Photo',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['id', 'caption', 'credit', 'traits']);
    final val = _Photo(
      id: $checkedConvert('id', (v) => v as String),
      caption: $checkedConvert('caption', (v) => v as String),
      credit: $checkedConvert(
        'credit',
        (v) => PhotoCredit.fromJson(v as Map<String, dynamic>),
      ),
      traits: $checkedConvert(
        'traits',
        (v) => v == null
            ? const PhotoTraits()
            : PhotoTraits.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'caption': instance.caption,
  'credit': instance.credit.toJson(),
  'traits': instance.traits.toJson(),
};

_PhotoManifest _$PhotoManifestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PhotoManifest', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['photos']);
      final val = _PhotoManifest(
        photos: $checkedConvert(
          'photos',
          (v) => (v as List<dynamic>)
              .map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PhotoManifestToJson(_PhotoManifest instance) =>
    <String, dynamic>{
      'photos': instance.photos.map((e) => e.toJson()).toList(),
    };
