import 'lending_rules.dart';

enum LendingRuleKind {
  loanToValue,
  loanToIncome,
  debtServiceToIncome,
  stressTest,
  amortizationRequirement,
  leftToLiveOn,
  interestDeduction,
  termLimit,
  ageAtMaturity,
}

List<LendingRuleKind> lendingRuleKinds(LendingRules lending) => [
  if (lending.maxLtv.isNotEmpty) LendingRuleKind.loanToValue,
  if (lending.maxLti.isNotEmpty) LendingRuleKind.loanToIncome,
  if (lending.maxDsti.isNotEmpty) LendingRuleKind.debtServiceToIncome,
  if (lending.stress.isNotEmpty) LendingRuleKind.stressTest,
  if (lending.amortization.isNotEmpty) LendingRuleKind.amortizationRequirement,
  if (lending.leftToLiveOn.isNotEmpty) LendingRuleKind.leftToLiveOn,
  if (lending.interestDeduction.isNotEmpty) LendingRuleKind.interestDeduction,
  if (lending.maxTermYears.isNotEmpty) LendingRuleKind.termLimit,
  if (lending.maxAgeAtMaturity.isNotEmpty) LendingRuleKind.ageAtMaturity,
];
