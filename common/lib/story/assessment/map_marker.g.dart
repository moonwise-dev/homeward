// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_marker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapMarker _$MapMarkerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MapMarker', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'label',
          'kind',
          'lat',
          'lng',
          'category',
          'candidateId',
        ],
      );
      final val = _MapMarker(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$MapMarkerKindEnumMap, v),
        ),
        lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
        lng: $checkedConvert('lng', (v) => (v as num).toDouble()),
        category: $checkedConvert('category', (v) => v as String?),
        candidateId: $checkedConvert('candidateId', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$MapMarkerToJson(_MapMarker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'kind': _$MapMarkerKindEnumMap[instance.kind]!,
      'lat': instance.lat,
      'lng': instance.lng,
      'category': ?instance.category,
      'candidateId': ?instance.candidateId,
    };

const _$MapMarkerKindEnumMap = {
  MapMarkerKind.candidate: 'candidate',
  MapMarkerKind.anchor: 'anchor',
  MapMarkerKind.place: 'place',
};
