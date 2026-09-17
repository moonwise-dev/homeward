import '../finance/monthly_payment.dart';
import '../markets/income_basis.dart';
import '../markets/lending_limits.dart';
import '../markets/lending_rules.dart';
import '../markets/resolved_market.dart';
import '../markets/rule_section.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'affordability.dart';
import 'constraint_check.dart';
import 'constraint_kind.dart';
import 'down_payment_bounds.dart';
import 'interest_deduction.dart';
import 'largest_loan.dart';
import 'monthly_ceiling.dart';
import 'stress_rate.dart';
import 'scenario_payment.dart';

Affordability assessAffordability({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final currency = market.currency;
  if (scenario.price.currency != currency ||
      scenario.downPayment.currency != currency) {
    throw ArgumentError.value(
      scenario,
      'scenario',
      'Expected amounts in ${currency.code}',
    );
  }
  final lending = market.lending;
  final missing = {
    ...market.missingFor(RuleSection.lending),
    ..._missingFacts(lending, profile),
  };
  final unconvertedCurrencies = {
    for (final amount in [
      profile.netMonthlyIncome,
      profile.grossMonthlyIncome,
      profile.monthlyDebtPayments,
      profile.savings,
    ].nonNulls)
      if (amount.currency != currency) amount.currency,
  };
  if (missing.isNotEmpty || unconvertedCurrencies.isNotEmpty) {
    return Affordability.incomplete(
      missing: missing,
      unconvertedCurrencies: unconvertedCurrencies,
    );
  }
  final livingCosts = market.livingCosts;
  if (lending.leftToLiveOn.isNotEmpty && livingCosts == null) {
    throw ArgumentError.notNull('market.livingCosts');
  }
  final annualRate = scenarioRate(scenario, market);
  final stressedRate = stressedRateFor(scenario, market);
  final loan = scenario.loan;
  final zero = Money.zero(currency);

  MonthlyPayment paymentAt(Money principal, Rate rate) => paymentFor(
    principal: principal,
    annualRate: rate,
    scenario: scenario,
    market: market,
  );

  Money deductionOn(Money monthlyInterest) => lending.interestDeduction.fold(
    zero,
    (total, rule) =>
        total +
        monthlyInterestDeduction(
          monthlyInterest: monthlyInterest,
          rule: rule,
          borrowers: profile.borrowers!,
        ),
  );

  final payment = paymentAt(loan, annualRate);
  final ceilings = {
    for (final ceiling in monthlyCeilings(
      market: market,
      profile: profile,
      scenario: scenario,
    ))
      ceiling.ruleId: ceiling.amount,
  };
  final checks = [
    for (final rule in lending.maxLtv)
      ConstraintCheck(
        kind: ConstraintKind.loanToValue,
        ruleId: rule.id,
        sourceId: rule.sourceId,
        maxLoan: scenario.price.applyRate(rule.rate, rounding: Rounding.down),
      ),
    for (final rule in lending.maxLti)
      ConstraintCheck(
        kind: ConstraintKind.loanToIncome,
        ruleId: rule.id,
        sourceId: rule.sourceId,
        maxLoan: _yearlyMultiple(_incomeFor(rule.incomeBasis, profile), rule),
      ),
    for (final rule in lending.maxDsti)
      ConstraintCheck(
        kind: ConstraintKind.debtServiceToIncome,
        ruleId: rule.id,
        sourceId: rule.sourceId,
        maxLoan: largestLoanWhere(
          upper: scenario.price,
          allows: (principal) =>
              paymentAt(principal, stressedRate).total <= ceilings[rule.id]!,
        ),
      ),
    for (final rule in lending.leftToLiveOn)
      ConstraintCheck(
        kind: ConstraintKind.leftToLiveOn,
        ruleId: rule.id,
        sourceId: rule.sourceId,
        maxLoan: largestLoanWhere(
          upper: scenario.price,
          allows: (principal) {
            final stressed = paymentAt(
              principal,
              annualRate > rule.stressRate ? annualRate : rule.stressRate,
            );
            return stressed.total - deductionOn(stressed.interest) <=
                ceilings[rule.id]!;
          },
        ),
      ),
  ];
  final binding = checks.fold<ConstraintCheck?>(
    null,
    (tightest, check) =>
        tightest == null || check.maxLoan < tightest.maxLoan ? check : tightest,
  );
  final bindingLoan = binding?.maxLoan;
  final maxLoan = bindingLoan == null || scenario.price < bindingLoan
      ? scenario.price
      : bindingLoan;
  return Affordability.assessed(
    loan: loan,
    annualRate: annualRate,
    payment: payment,
    paymentAfterDeduction: lending.interestDeduction.isEmpty
        ? null
        : payment.total - deductionOn(payment.interest),
    checks: checks,
    binding: binding,
    maxLoan: maxLoan,
    downPaymentBounds: DownPaymentBounds(
      min: scenario.price - maxLoan,
      max: scenario.price,
      step: downPaymentStep(scenario.price),
    ),
  );
}

Set<ProfileField> _missingFacts(LendingRules lending, BuyerProfile profile) {
  final needed = <(ProfileField, Object?)>[
    for (final rule in lending.maxLti) _incomeFact(rule.incomeBasis, profile),
    for (final rule in lending.maxDsti) ...[
      _incomeFact(rule.incomeBasis, profile),
      (ProfileField.monthlyDebtPayments, profile.monthlyDebtPayments),
    ],
    for (final rule in lending.incomeAdjustments) ...[
      (ProfileField.age, profile.age),
      if (rule.exceptRetired) (ProfileField.employment, profile.employment),
    ],
    if (lending.leftToLiveOn.isNotEmpty) ...[
      (ProfileField.netMonthlyIncome, profile.netMonthlyIncome),
      (ProfileField.monthlyDebtPayments, profile.monthlyDebtPayments),
      (ProfileField.age, profile.age),
      (ProfileField.household, profile.adults),
      (ProfileField.household, profile.childAges),
    ],
    if (lending.interestDeduction.isNotEmpty)
      (ProfileField.borrowers, profile.borrowers),
  ];
  return {
    for (final (field, value) in needed)
      if (value == null) field,
  };
}

(ProfileField, Object?) _incomeFact(IncomeBasis basis, BuyerProfile profile) =>
    switch (basis) {
      IncomeBasis.net => (
        ProfileField.netMonthlyIncome,
        profile.netMonthlyIncome,
      ),
      IncomeBasis.gross => (
        ProfileField.grossMonthlyIncome,
        profile.grossMonthlyIncome,
      ),
    };

Money _incomeFor(IncomeBasis basis, BuyerProfile profile) => switch (basis) {
  IncomeBasis.net => profile.netMonthlyIncome!,
  IncomeBasis.gross => profile.grossMonthlyIncome!,
};

Money _yearlyMultiple(Money monthlyIncome, LtiLimit rule) =>
    monthlyIncome.copyWith(
      minorUnits: Rounding.down.scale(
        monthlyIncome.minorUnits * 12,
        rule.multiple.scaledBy(2),
        100,
      ),
    );
