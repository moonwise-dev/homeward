// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_directory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_Place', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['name', 'aliases', 'kind', 'marketIds']);
  final val = _Place(
    name: $checkedConvert('name', (v) => v as String),
    aliases: $checkedConvert(
      'aliases',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    kind: $checkedConvert('kind', (v) => $enumDecode(_$PlaceKindEnumMap, v)),
    marketIds: $checkedConvert(
      'marketIds',
      (v) => (v as List<dynamic>)
          .map((e) => const MarketIdJsonConverter().fromJson(e as String))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'name': instance.name,
  'aliases': instance.aliases,
  'kind': _$PlaceKindEnumMap[instance.kind]!,
  'marketIds': instance.marketIds
      .map(const MarketIdJsonConverter().toJson)
      .toList(),
};

const _$PlaceKindEnumMap = {
  PlaceKind.region: 'region',
  PlaceKind.island: 'island',
  PlaceKind.municipality: 'municipality',
};

_PlaceDirectory _$PlaceDirectoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PlaceDirectory', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['source', 'places']);
      final val = _PlaceDirectory(
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
        places: $checkedConvert(
          'places',
          (v) => (v as List<dynamic>)
              .map((e) => Place.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PlaceDirectoryToJson(_PlaceDirectory instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'places': instance.places.map((e) => e.toJson()).toList(),
    };
