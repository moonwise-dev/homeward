// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criterion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Criterion _$CriterionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Criterion', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'kind',
          'anchorId',
          'withinMeters',
          'count',
          'mustHave',
        ],
      );
      final val = _Criterion(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$CriterionKindEnumMap, v),
        ),
        anchorId: $checkedConvert('anchorId', (v) => v as String?),
        withinMeters: $checkedConvert(
          'withinMeters',
          (v) => (v as num?)?.toInt(),
        ),
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
        mustHave: $checkedConvert('mustHave', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$CriterionToJson(_Criterion instance) =>
    <String, dynamic>{
      'kind': _$CriterionKindEnumMap[instance.kind]!,
      'anchorId': ?instance.anchorId,
      'withinMeters': ?instance.withinMeters,
      'count': ?instance.count,
      'mustHave': instance.mustHave,
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
