import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/amortization_tier.dart';
import '../money/rate.dart';
import 'buyer_predicate.dart';
import 'income_basis.dart';
import 'loan_predicate.dart';
import 'rate_range.dart';
import 'stress_kind.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';
import 'values/percent_json_converter.dart';

part 'lending_limits.freezed.dart';
part 'lending_limits.g.dart';

@freezed
abstract class LtvLimit with _$LtvLimit {
  const factory LtvLimit({
    required String id,
    BuyerPredicate? appliesTo,
    @PercentJsonConverter() required Rate rate,
    RateRange? typicalRange,
    required String sourceId,
  }) = _LtvLimit;

  factory LtvLimit.fromJson(Map<String, Object?> json) =>
      _$LtvLimitFromJson(json);
}

@freezed
abstract class DstiLimit with _$DstiLimit {
  const factory DstiLimit({
    required String id,
    BuyerPredicate? appliesTo,
    @PercentJsonConverter() required Rate rate,
    required IncomeBasis incomeBasis,
    @PercentJsonConverter() Rate? exceptionQuota,
    required String sourceId,
  }) = _DstiLimit;

  factory DstiLimit.fromJson(Map<String, Object?> json) =>
      _$DstiLimitFromJson(json);
}

@freezed
abstract class LtiLimit with _$LtiLimit {
  const factory LtiLimit({
    required String id,
    BuyerPredicate? appliesTo,
    @ExactDecimalJsonConverter() required ExactDecimal multiple,
    required IncomeBasis incomeBasis,
    RateRange? typicalRange,
    required String sourceId,
  }) = _LtiLimit;

  factory LtiLimit.fromJson(Map<String, Object?> json) =>
      _$LtiLimitFromJson(json);
}

@freezed
abstract class StressRule with _$StressRule {
  const factory StressRule({
    required String id,
    BuyerPredicate? appliesTo,
    LoanPredicate? appliesToLoan,
    required StressKind kind,
    @PercentJsonConverter() required Rate rate,
    required String sourceId,
  }) = _StressRule;

  factory StressRule.fromJson(Map<String, Object?> json) =>
      _$StressRuleFromJson(json);
}

@freezed
abstract class YearsLimit with _$YearsLimit {
  const factory YearsLimit({
    required String id,
    BuyerPredicate? appliesTo,
    required int years,
    required String sourceId,
  }) = _YearsLimit;

  factory YearsLimit.fromJson(Map<String, Object?> json) =>
      _$YearsLimitFromJson(json);
}

@freezed
abstract class IncomeAdjustment with _$IncomeAdjustment {
  const factory IncomeAdjustment({
    required String id,
    BuyerPredicate? appliesTo,
    required int whenAgeAtMaturityAbove,
    @PercentJsonConverter() required Rate reduction,
    required bool weightedByTermShare,
    required bool exceptRetired,
    required String sourceId,
  }) = _IncomeAdjustment;

  factory IncomeAdjustment.fromJson(Map<String, Object?> json) =>
      _$IncomeAdjustmentFromJson(json);
}

@freezed
abstract class AmortizationRule with _$AmortizationRule {
  const factory AmortizationRule({
    required String id,
    BuyerPredicate? appliesTo,
    @PercentJsonConverter() required Rate whenLtvAbove,
    @PercentJsonConverter() required Rate annualRate,
    required String sourceId,
  }) = _AmortizationRule;

  const AmortizationRule._();

  factory AmortizationRule.fromJson(Map<String, Object?> json) =>
      _$AmortizationRuleFromJson(json);

  AmortizationTier get tier =>
      AmortizationTier(whenLtvAbove: whenLtvAbove, annualRate: annualRate);
}
