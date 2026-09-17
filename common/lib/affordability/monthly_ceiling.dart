import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/household_rules.dart';
import '../markets/income_basis.dart';
import '../markets/lending_rules.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/employment.dart';
import 'constraint_kind.dart';

part 'monthly_ceiling.freezed.dart';

@freezed
abstract class MonthlyCeiling with _$MonthlyCeiling {
  const factory MonthlyCeiling({
    required ConstraintKind kind,
    required String ruleId,
    required Money amount,
    required bool afterDeduction,
  }) = _MonthlyCeiling;
}

List<MonthlyCeiling> monthlyCeilings({
  required ResolvedMarket market,
  required BuyerProfile profile,
  required Scenario scenario,
}) {
  final lending = market.lending;
  final debts = profile.monthlyDebtPayments;
  if (debts == null) {
    return const [];
  }
  return [
    for (final rule in lending.maxDsti)
      if (adjustedIncome(
            incomeFor(rule.incomeBasis, profile),
            lending: lending,
            profile: profile,
            scenario: scenario,
          )
          case final income?)
        MonthlyCeiling(
          kind: ConstraintKind.debtServiceToIncome,
          ruleId: rule.id,
          amount: income.applyRate(rule.rate, rounding: Rounding.down) - debts,
          afterDeduction: false,
        ),
    for (final rule in lending.leftToLiveOn)
      if (_leftToLiveOn(rule, market, profile, scenario) case final amount?)
        MonthlyCeiling(
          kind: ConstraintKind.leftToLiveOn,
          ruleId: rule.id,
          amount: amount,
          afterDeduction: true,
        ),
  ];
}

Money? incomeFor(IncomeBasis basis, BuyerProfile profile) => switch (basis) {
  IncomeBasis.net => profile.netMonthlyIncome,
  IncomeBasis.gross => profile.grossMonthlyIncome,
};

Money? adjustedIncome(
  Money? income, {
  required LendingRules lending,
  required BuyerProfile profile,
  required Scenario scenario,
}) {
  if (income == null) {
    return null;
  }
  if (lending.incomeAdjustments.isEmpty) {
    return income;
  }
  final age = profile.age;
  if (age == null) {
    return null;
  }
  final reductionPpm = lending.incomeAdjustments
      .where(
        (rule) =>
            age + scenario.termYears > rule.whenAgeAtMaturityAbove &&
            !(rule.exceptRetired && profile.employment == Employment.retired),
      )
      .map((rule) {
        final yearsAbove =
            age + scenario.termYears - rule.whenAgeAtMaturityAbove;
        final share = yearsAbove < scenario.termYears
            ? yearsAbove
            : scenario.termYears;
        return rule.weightedByTermShare
            ? rule.reduction.partsPerMillion * share ~/ scenario.termYears
            : rule.reduction.partsPerMillion;
      })
      .fold(0, (highest, ppm) => ppm > highest ? ppm : highest);
  return income -
      income.applyRate(Rate.ppm(reductionPpm), rounding: Rounding.down);
}

Money? _leftToLiveOn(
  LeftToLiveOnRule rule,
  ResolvedMarket market,
  BuyerProfile profile,
  Scenario scenario,
) {
  final income = profile.netMonthlyIncome;
  final debts = profile.monthlyDebtPayments;
  final age = profile.age;
  final adults = profile.adults;
  final childAges = profile.childAges;
  final livingCosts = market.livingCosts;
  if (income == null ||
      debts == null ||
      age == null ||
      adults == null ||
      childAges == null ||
      livingCosts == null) {
    return null;
  }
  final currency = market.currency;
  return income -
      debts -
      livingCosts.monthlyFor(
        adultAge: age,
        adults: adults,
        childAges: childAges,
      ) -
      (scenario.associationFee ?? Money.zero(currency)) -
      rule.runningCostsMonthly.toMoney(currency) -
      rule.transportMonthlyPerAdult.toMoney(currency) * adults;
}
