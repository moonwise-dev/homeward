// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lending_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LendingRules _$LendingRulesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LendingRules', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'maxLtv',
      'maxDsti',
      'maxLti',
      'stress',
      'maxTermYears',
      'maxAgeAtMaturity',
      'incomeAdjustments',
      'amortization',
      'leftToLiveOn',
      'interestDeduction',
      'repaymentStyle',
    ],
  );
  final val = _LendingRules(
    maxLtv: $checkedConvert(
      'maxLtv',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => LtvLimit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    maxDsti: $checkedConvert(
      'maxDsti',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => DstiLimit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    maxLti: $checkedConvert(
      'maxLti',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => LtiLimit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    stress: $checkedConvert(
      'stress',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => StressRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    maxTermYears: $checkedConvert(
      'maxTermYears',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => YearsLimit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    maxAgeAtMaturity: $checkedConvert(
      'maxAgeAtMaturity',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => YearsLimit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    incomeAdjustments: $checkedConvert(
      'incomeAdjustments',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => IncomeAdjustment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    amortization: $checkedConvert(
      'amortization',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => AmortizationRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    leftToLiveOn: $checkedConvert(
      'leftToLiveOn',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => LeftToLiveOnRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    interestDeduction: $checkedConvert(
      'interestDeduction',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) =>
                    InterestDeductionRule.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
    repaymentStyle: $checkedConvert(
      'repaymentStyle',
      (v) => $enumDecodeNullable(_$RepaymentStyleEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$LendingRulesToJson(
  _LendingRules instance,
) => <String, dynamic>{
  'maxLtv': instance.maxLtv.map((e) => e.toJson()).toList(),
  'maxDsti': instance.maxDsti.map((e) => e.toJson()).toList(),
  'maxLti': instance.maxLti.map((e) => e.toJson()).toList(),
  'stress': instance.stress.map((e) => e.toJson()).toList(),
  'maxTermYears': instance.maxTermYears.map((e) => e.toJson()).toList(),
  'maxAgeAtMaturity': instance.maxAgeAtMaturity.map((e) => e.toJson()).toList(),
  'incomeAdjustments': instance.incomeAdjustments
      .map((e) => e.toJson())
      .toList(),
  'amortization': instance.amortization.map((e) => e.toJson()).toList(),
  'leftToLiveOn': instance.leftToLiveOn.map((e) => e.toJson()).toList(),
  'interestDeduction': instance.interestDeduction
      .map((e) => e.toJson())
      .toList(),
  'repaymentStyle': ?_$RepaymentStyleEnumMap[instance.repaymentStyle],
};

const _$RepaymentStyleEnumMap = {
  RepaymentStyle.annuity: 'annuity',
  RepaymentStyle.straight: 'straight',
};
