// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brief_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BriefItem _$BriefItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_BriefItem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const ['id', 'kind', 'text', 'source', 'words'],
    );
    final val = _BriefItem(
      id: $checkedConvert('id', (v) => v as String),
      kind: $checkedConvert('kind', (v) => $enumDecode(_$BriefKindEnumMap, v)),
      text: $checkedConvert('text', (v) => v as String),
      source: $checkedConvert(
        'source',
        (v) => $enumDecode(_$FactSourceEnumMap, v),
      ),
      words: $checkedConvert('words', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$BriefItemToJson(_BriefItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$BriefKindEnumMap[instance.kind]!,
      'text': instance.text,
      'source': _$FactSourceEnumMap[instance.source]!,
      'words': ?instance.words,
    };

const _$BriefKindEnumMap = {
  BriefKind.household: 'household',
  BriefKind.money: 'money',
  BriefKind.need: 'need',
  BriefKind.habit: 'habit',
  BriefKind.want: 'want',
  BriefKind.place: 'place',
  BriefKind.open: 'open',
};

const _$FactSourceEnumMap = {
  FactSource.said: 'said',
  FactSource.deduced: 'deduced',
  FactSource.confirmed: 'confirmed',
  FactSource.measured: 'measured',
  FactSource.quoted: 'quoted',
  FactSource.estimate: 'estimate',
};
