// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Source',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'publisher',
        'title',
        'url',
        'kind',
        'retrievedAt',
      ],
    );
    final val = _Source(
      id: $checkedConvert('id', (v) => v as String),
      publisher: $checkedConvert('publisher', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      url: $checkedConvert('url', (v) => v as String),
      kind: $checkedConvert('kind', (v) => $enumDecode(_$SourceKindEnumMap, v)),
      retrievedAt: $checkedConvert(
        'retrievedAt',
        (v) => const CalendarDateJsonConverter().fromJson(v as String),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$SourceToJson(_Source instance) => <String, dynamic>{
  'id': instance.id,
  'publisher': instance.publisher,
  'title': instance.title,
  'url': instance.url,
  'kind': _$SourceKindEnumMap[instance.kind]!,
  'retrievedAt': const CalendarDateJsonConverter().toJson(instance.retrievedAt),
};

const _$SourceKindEnumMap = {
  SourceKind.law: 'law',
  SourceKind.regulator: 'regulator',
  SourceKind.taxAuthority: 'taxAuthority',
  SourceKind.officialStatistics: 'officialStatistics',
  SourceKind.lenderNorm: 'lenderNorm',
  SourceKind.secondary: 'secondary',
};
