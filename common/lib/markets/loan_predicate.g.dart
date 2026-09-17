// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_predicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanPredicate _$LoanPredicateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoanPredicate', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['rateTypes', 'termYears']);
      final val = _LoanPredicate(
        rateTypes: $checkedConvert(
          'rateTypes',
          (v) => (v as List<dynamic>?)
              ?.map((e) => $enumDecode(_$RateTypeEnumMap, e))
              .toList(),
        ),
        termYears: $checkedConvert(
          'termYears',
          (v) =>
              v == null ? null : YearRange.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoanPredicateToJson(
  _LoanPredicate instance,
) => <String, dynamic>{
  'rateTypes': ?instance.rateTypes?.map((e) => _$RateTypeEnumMap[e]!).toList(),
  'termYears': ?instance.termYears?.toJson(),
};

const _$RateTypeEnumMap = {
  RateType.variable: 'variable',
  RateType.mixed: 'mixed',
  RateType.fixed: 'fixed',
};
