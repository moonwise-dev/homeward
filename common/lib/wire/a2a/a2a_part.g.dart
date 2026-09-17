// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'a2a_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

A2aTextPart _$A2aTextPartFromJson(Map<String, dynamic> json) => $checkedCreate(
  'A2aTextPart',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['text', 'metadata', 'kind']);
    final val = A2aTextPart(
      text: $checkedConvert('text', (v) => v as String),
      metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
      $type: $checkedConvert('kind', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'kind'},
);

Map<String, dynamic> _$A2aTextPartToJson(A2aTextPart instance) =>
    <String, dynamic>{
      'text': instance.text,
      'metadata': ?instance.metadata,
      'kind': instance.$type,
    };

A2aDataPart _$A2aDataPartFromJson(Map<String, dynamic> json) => $checkedCreate(
  'A2aDataPart',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['data', 'metadata', 'kind']);
    final val = A2aDataPart(
      data: $checkedConvert('data', (v) => v as Map<String, dynamic>),
      metadata: $checkedConvert('metadata', (v) => v as Map<String, dynamic>?),
      $type: $checkedConvert('kind', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {r'$type': 'kind'},
);

Map<String, dynamic> _$A2aDataPartToJson(A2aDataPart instance) =>
    <String, dynamic>{
      'data': instance.data,
      'metadata': ?instance.metadata,
      'kind': instance.$type,
    };
