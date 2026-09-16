import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/rate.dart';
import 'bracket_rule.dart';
import 'buyer_predicate.dart';
import 'rate_range.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';
import 'values/percent_json_converter.dart';

import 'identified.dart';

part 'household_rules.freezed.dart';
part 'household_rules.g.dart';

@freezed
abstract class LeftToLiveOnRule
    with _$LeftToLiveOnRule
    implements ConditionalRule {
  const factory LeftToLiveOnRule({
    required String id,
    BuyerPredicate? appliesTo,
    @PercentJsonConverter() required Rate stressRate,
    RateRange? typicalRange,
    @ExactDecimalJsonConverter() required ExactDecimal runningCostsMonthly,
    required String sourceId,
  }) = _LeftToLiveOnRule;

  factory LeftToLiveOnRule.fromJson(Map<String, Object?> json) =>
      _$LeftToLiveOnRuleFromJson(json);
}

@freezed
abstract class InterestDeductionRule
    with _$InterestDeductionRule
    implements ConditionalRule {
  const factory InterestDeductionRule({
    required String id,
    BuyerPredicate? appliesTo,
    required List<BracketRule> yearlyBrackets,
    required bool perBorrower,
    required String sourceId,
  }) = _InterestDeductionRule;

  factory InterestDeductionRule.fromJson(Map<String, Object?> json) =>
      _$InterestDeductionRuleFromJson(json);
}
