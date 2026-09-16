import '../finance/amortization_tier.dart';
import '../finance/annuity.dart';
import '../finance/monthly_payment.dart';
import '../finance/repayment_style.dart';
import '../finance/straight.dart';
import '../markets/applicability.dart';
import '../markets/income_basis.dart';
import '../markets/lending_limits.dart';
import '../markets/lending_rules.dart';
import '../markets/living_costs.dart';
import '../markets/loan_type.dart';
import '../markets/reference_rate.dart';
import '../markets/resolved_market.dart';
import '../markets/rule_section.dart';
import '../markets/stress_kind.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/employment.dart';
import '../profile/profile_field.dart';
import 'affordability.dart';
import 'constraint_check.dart';
import 'constraint_kind.dart';
import 'down_payment_bounds.dart';
import 'interest_deduction.dart';
import 'largest_loan.dart';

Affordability assessAffordability({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
  required Map<String, ReferenceRate> referenceRates,
  LivingCosts? livingCosts,
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
  if (lending.leftToLiveOn.isNotEmpty && livingCosts == null) {
    throw ArgumentError.notNull('livingCosts');
  }
  final loanType = market.loanTypes.firstWhere(
    (type) => type.id == scenario.loanTypeId,
    orElse: () => throw ArgumentError.value(
      scenario.loanTypeId,
      'scenario.loanTypeId',
      'Not a loan type of ${market.id.code}',
    ),
  );
  final referenceRate =
      referenceRates[loanType.referenceRateId] ??
      (throw ArgumentError.value(
        loanType.referenceRateId,
        'referenceRates',
        'Missing',
      ));
  final annualRate =
      referenceRate.rate + scenario.rateSpread + scenario.rateShock;
  final loan = scenario.loan;
  final zero = Money.zero(currency);

  MonthlyPayment paymentAt(Money principal, Rate rate) =>
      switch (lending.repaymentStyle ?? RepaymentStyle.annuity) {
        RepaymentStyle.annuity => firstAnnuityPayment(
          principal: principal,
          annualRate: rate,
          months: scenario.months,
          rounding: Rounding.halfUp,
        ),
        RepaymentStyle.straight => firstStraightPayment(
          principal: principal,
          annualRate: rate,
          annualAmortizationRate: requiredAmortizationRate(
            loan: principal,
            value: scenario.price,
            tiers: lending.amortization.map((rule) => rule.tier),
          ),
          rounding: Rounding.halfUp,
        ),
      };

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
  final checks = [
    for (final rule in lending.maxLtv)
      ConstraintCheck(
        kind: ConstraintKind.loanToValue,
        ruleId: rule.id,
        maxLoan: scenario.price.applyRate(rule.rate, rounding: Rounding.down),
      ),
    for (final rule in lending.maxLti)
      ConstraintCheck(
        kind: ConstraintKind.loanToIncome,
        ruleId: rule.id,
        maxLoan: _yearlyMultiple(_incomeFor(rule.incomeBasis, profile), rule),
      ),
    for (final rule in lending.maxDsti)
      ConstraintCheck(
        kind: ConstraintKind.debtServiceToIncome,
        ruleId: rule.id,
        maxLoan: largestLoanWhere(
          upper: scenario.price,
          allows: (principal) =>
              paymentAt(
                principal,
                _stressedRate(annualRate, lending, loanType, scenario),
              ).total <=
              _adjustedIncome(
                    _incomeFor(rule.incomeBasis, profile),
                    lending,
                    profile,
                    scenario,
                  ).applyRate(rule.rate, rounding: Rounding.down) -
                  profile.monthlyDebtPayments!,
        ),
      ),
    for (final rule in lending.leftToLiveOn)
      ConstraintCheck(
        kind: ConstraintKind.leftToLiveOn,
        ruleId: rule.id,
        maxLoan: largestLoanWhere(
          upper: scenario.price,
          allows: (principal) {
            final stressed = paymentAt(
              principal,
              annualRate > rule.stressRate ? annualRate : rule.stressRate,
            );
            final leftOver =
                profile.netMonthlyIncome! -
                profile.monthlyDebtPayments! -
                livingCosts!.monthlyFor(
                  adultAge: profile.age!,
                  adults: profile.adults!,
                  childAges: profile.childAges!,
                ) -
                (scenario.associationFee ?? zero) -
                rule.runningCostsMonthly.toMoney(currency) -
                (stressed.total - deductionOn(stressed.interest));
            return !leftOver.isNegative;
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

Rate _stressedRate(
  Rate annualRate,
  LendingRules lending,
  LoanType loanType,
  Scenario scenario,
) => lending.stress
    .where(
      (rule) => matchesLoan(
        rule.appliesToLoan,
        rateType: loanType.rateType,
        termYears: scenario.termYears,
      ),
    )
    .map(
      (rule) => switch (rule.kind) {
        StressKind.shock => annualRate + rule.rate,
        StressKind.fixedRate => annualRate > rule.rate ? annualRate : rule.rate,
      },
    )
    .fold(annualRate, (highest, rate) => rate > highest ? rate : highest);

Money _adjustedIncome(
  Money income,
  LendingRules lending,
  BuyerProfile profile,
  Scenario scenario,
) {
  final reductionPpm = lending.incomeAdjustments
      .where(
        (rule) =>
            profile.age! + scenario.termYears > rule.whenAgeAtMaturityAbove &&
            !(rule.exceptRetired && profile.employment == Employment.retired),
      )
      .map((rule) {
        final yearsAbove =
            profile.age! + scenario.termYears - rule.whenAgeAtMaturityAbove;
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
