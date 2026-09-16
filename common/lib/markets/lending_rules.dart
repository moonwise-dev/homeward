import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/repayment_style.dart';
import 'household_rules.dart';
import 'lending_limits.dart';

part 'lending_rules.freezed.dart';
part 'lending_rules.g.dart';

@freezed
abstract class LendingRules with _$LendingRules {
  const factory LendingRules({
    @Default([]) List<LtvLimit> maxLtv,
    @Default([]) List<DstiLimit> maxDsti,
    @Default([]) List<LtiLimit> maxLti,
    @Default([]) List<StressRule> stress,
    @Default([]) List<YearsLimit> maxTermYears,
    @Default([]) List<YearsLimit> maxAgeAtMaturity,
    @Default([]) List<IncomeAdjustment> incomeAdjustments,
    @Default([]) List<AmortizationRule> amortization,
    @Default([]) List<LeftToLiveOnRule> leftToLiveOn,
    @Default([]) List<InterestDeductionRule> interestDeduction,
    RepaymentStyle? repaymentStyle,
  }) = _LendingRules;

  factory LendingRules.fromJson(Map<String, Object?> json) =>
      _$LendingRulesFromJson(json);
}
