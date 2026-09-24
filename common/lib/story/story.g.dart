// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Story _$StoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Story', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'reason',
          'city',
          'anchors',
          'candidates',
          'criteria',
          'committed',
          'chosenCandidateId',
        ],
      );
      final val = _Story(
        reason: $checkedConvert(
          'reason',
          (v) => $enumDecodeNullable(_$StoryReasonEnumMap, v),
        ),
        city: $checkedConvert('city', (v) => v as String?),
        anchors: $checkedConvert(
          'anchors',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => Anchor.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
        candidates: $checkedConvert(
          'candidates',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
        criteria: $checkedConvert(
          'criteria',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => Criterion.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
        committed: $checkedConvert('committed', (v) => v as bool? ?? false),
        chosenCandidateId: $checkedConvert(
          'chosenCandidateId',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$StoryToJson(_Story instance) => <String, dynamic>{
  'reason': ?_$StoryReasonEnumMap[instance.reason],
  'city': ?instance.city,
  'anchors': instance.anchors.map((e) => e.toJson()).toList(),
  'candidates': instance.candidates.map((e) => e.toJson()).toList(),
  'criteria': instance.criteria.map((e) => e.toJson()).toList(),
  'committed': instance.committed,
  'chosenCandidateId': ?instance.chosenCandidateId,
};

const _$StoryReasonEnumMap = {
  StoryReason.work: 'work',
  StoryReason.study: 'study',
  StoryReason.family: 'family',
  StoryReason.lifestyle: 'lifestyle',
  StoryReason.retirement: 'retirement',
  StoryReason.investment: 'investment',
  StoryReason.other: 'other',
};
