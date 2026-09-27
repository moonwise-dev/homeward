// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeftToLiveOnRule _$LeftToLiveOnRuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LeftToLiveOnRule', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'stressRate',
          'typicalRange',
          'runningCostsMonthly',
          'transportMonthlyPerAdult',
          'sourceId',
        ],
      );
      final val = _LeftToLiveOnRule(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        stressRate: $checkedConvert(
          'stressRate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
        typicalRange: $checkedConvert(
          'typicalRange',
          (v) =>
              v == null ? null : RateRange.fromJson(v as Map<String, dynamic>),
        ),
        runningCostsMonthly: $checkedConvert(
          'runningCostsMonthly',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        transportMonthlyPerAdult: $checkedConvert(
          'transportMonthlyPerAdult',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LeftToLiveOnRuleToJson(_LeftToLiveOnRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appliesTo': ?instance.appliesTo?.toJson(),
      'stressRate': const PercentJsonConverter().toJson(instance.stressRate),
      'typicalRange': ?instance.typicalRange?.toJson(),
      'runningCostsMonthly': const ExactDecimalJsonConverter().toJson(
        instance.runningCostsMonthly,
      ),
      'transportMonthlyPerAdult': const ExactDecimalJsonConverter().toJson(
        instance.transportMonthlyPerAdult,
      ),
      'sourceId': instance.sourceId,
    };

_InterestDeductionRule _$InterestDeductionRuleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_InterestDeductionRule', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'appliesTo',
      'yearlyBrackets',
      'perBorrower',
      'sourceId',
    ],
  );
  final val = _InterestDeductionRule(
    id: $checkedConvert('id', (v) => v as String),
    appliesTo: $checkedConvert(
      'appliesTo',
      (v) =>
          v == null ? null : BuyerPredicate.fromJson(v as Map<String, dynamic>),
    ),
    yearlyBrackets: $checkedConvert(
      'yearlyBrackets',
      (v) => (v as List<dynamic>)
          .map((e) => BracketRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    perBorrower: $checkedConvert('perBorrower', (v) => v as bool),
    sourceId: $checkedConvert('sourceId', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$InterestDeductionRuleToJson(
  _InterestDeductionRule instance,
) => <String, dynamic>{
  'id': instance.id,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'yearlyBrackets': instance.yearlyBrackets.map((e) => e.toJson()).toList(),
  'perBorrower': instance.perBorrower,
  'sourceId': instance.sourceId,
};
