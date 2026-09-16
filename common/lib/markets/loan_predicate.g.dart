// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_predicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanPredicate _$LoanPredicateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoanPredicate', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['rateType', 'termYears']);
      final val = _LoanPredicate(
        rateType: $checkedConvert(
          'rateType',
          (v) => $enumDecodeNullable(_$RateTypeEnumMap, v),
        ),
        termYears: $checkedConvert(
          'termYears',
          (v) =>
              v == null ? null : YearRange.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoanPredicateToJson(_LoanPredicate instance) =>
    <String, dynamic>{
      'rateType': ?_$RateTypeEnumMap[instance.rateType],
      'termYears': ?instance.termYears?.toJson(),
    };

const _$RateTypeEnumMap = {
  RateType.variable: 'variable',
  RateType.mixed: 'mixed',
  RateType.fixed: 'fixed',
};
