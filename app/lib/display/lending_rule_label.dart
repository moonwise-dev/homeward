import 'package:common/common.dart';

String lendingRuleLabel(LendingRuleKind kind) => switch (kind) {
  LendingRuleKind.loanToValue => 'Loan-to-value cap',
  LendingRuleKind.loanToIncome => 'Income multiple cap',
  LendingRuleKind.debtServiceToIncome => 'Debt-service limit',
  LendingRuleKind.stressTest => 'Stress test',
  LendingRuleKind.amortizationRequirement => 'Amortization requirement',
  LendingRuleKind.leftToLiveOn => 'Left-to-live-on calculation',
  LendingRuleKind.interestDeduction => 'Interest deduction',
  LendingRuleKind.termLimit => 'Maximum term',
  LendingRuleKind.ageAtMaturity => 'Age at maturity limit',
};
