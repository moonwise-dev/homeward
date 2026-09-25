// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessed_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssessedCandidate _$AssessedCandidateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AssessedCandidate', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'label',
      'rank',
      'score',
      'missesMustHave',
      'pros',
      'cons',
      'close',
      'listing',
    ],
  );
  final val = _AssessedCandidate(
    id: $checkedConvert('id', (v) => v as String),
    label: $checkedConvert('label', (v) => v as String),
    rank: $checkedConvert('rank', (v) => (v as num).toInt()),
    score: $checkedConvert('score', (v) => (v as num).toInt()),
    missesMustHave: $checkedConvert('missesMustHave', (v) => v as bool),
    pros: $checkedConvert(
      'pros',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    cons: $checkedConvert(
      'cons',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    close: $checkedConvert(
      'close',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    listing: $checkedConvert(
      'listing',
      (v) => v == null ? null : Listing.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AssessedCandidateToJson(_AssessedCandidate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'rank': instance.rank,
      'score': instance.score,
      'missesMustHave': instance.missesMustHave,
      'pros': instance.pros,
      'cons': instance.cons,
      'close': instance.close,
      'listing': ?instance.listing?.toJson(),
    };
