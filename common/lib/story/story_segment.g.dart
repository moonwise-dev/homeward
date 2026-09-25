// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StorySegment _$StorySegmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StorySegment', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['type', 'text', 'kind', 'id', 'label', 'assumed'],
      );
      final val = _StorySegment(
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$StorySegmentTypeEnumMap, v),
        ),
        text: $checkedConvert('text', (v) => v as String?),
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecodeNullable(_$CriterionKindEnumMap, v),
        ),
        id: $checkedConvert('id', (v) => v as String?),
        label: $checkedConvert('label', (v) => v as String?),
        assumed: $checkedConvert('assumed', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$StorySegmentToJson(_StorySegment instance) =>
    <String, dynamic>{
      'type': _$StorySegmentTypeEnumMap[instance.type]!,
      'text': ?instance.text,
      'kind': ?_$CriterionKindEnumMap[instance.kind],
      'id': ?instance.id,
      'label': ?instance.label,
      'assumed': instance.assumed,
    };

const _$StorySegmentTypeEnumMap = {
  StorySegmentType.text: 'text',
  StorySegmentType.mode: 'mode',
  StorySegmentType.maxMinutes: 'maxMinutes',
  StorySegmentType.criterion: 'criterion',
  StorySegmentType.place: 'place',
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
