import 'dart:math';

import '../costs/purchase_costs.dart';
import '../finance/amortization_tier.dart';
import '../finance/repayment_style.dart';
import '../markets/resolved_market.dart';
import '../markets/rule_section.dart';
import '../money/currency.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import '../profile/profile_field.dart';
import 'affordability.dart';
import 'affordability_slice.dart';
import 'assess_affordability.dart';
import 'constraint_check.dart';
import 'maximum_price.dart';

const defaultTermYears = 30;

sealed class AffordabilityAnswer {
  const AffordabilityAnswer();
}

final class AffordabilityNeeds extends AffordabilityAnswer {
  const AffordabilityNeeds({
    required this.missing,
    this.unconverted = const {},
  });

  final Set<ProfileField> missing;
  final Set<Currency> unconverted;
}

final class AffordabilityAnswered extends AffordabilityAnswer {
  const AffordabilityAnswered({
    required this.assessed,
    required this.slice,
  });

  final AssessedAffordability assessed;
  final AffordabilitySlice slice;
}

AffordabilityAnswer answerAffordability({
  required ResolvedMarket market,
  required BuyerProfile profile,
  Money? price,
  Money? downPayment,
  Money? monthlyFee,
  int? termYears,
}) {
  final zero = Money.zero(market.currency);
  final loanType = market.loanTypes.first;
  final term = termYears ?? termYearsFor(market, profile);
  Scenario at(Money price, Money downPayment) => Scenario(
    price: price,
    downPayment: downPayment,
    termYears: term,
    loanTypeId: loanType.id,
    rateSpread: loanType.defaultSpread,
    associationFee: monthlyFee,
  );
  final savings = market.converted(profile.savings);
  final probe = at(price ?? savings ?? zero, zero);
  if (assessAffordability(scenario: probe, market: market, profile: profile)
      case IncompleteAffordability(
        :final missing,
        :final unconvertedCurrencies,
      )) {
    return AffordabilityNeeds(
      missing: {
        ...missing,
        if (price == null && savings == null) ProfileField.savings,
      },
      unconverted: unconvertedCurrencies,
    );
  }
  final highest = savings == null
      ? null
      : maximumPrice(scenario: probe, market: market, profile: profile);
  final target = price ?? highest;
  if (target == null) {
    return AffordabilityNeeds(
      missing: {
        if (savings == null) ProfileField.savings,
        ...market.missingFor(RuleSection.purchaseCosts),
      },
    );
  }
  final open = assessAffordability(
    scenario: at(target, zero),
    market: market,
    profile: profile,
  ) as AssessedAffordability;
  final down =
      downPayment ?? (open.maxLoan < target ? target - open.maxLoan : zero);
  final scenario = at(target, down);
  final assessed = assessAffordability(
    scenario: scenario,
    market: market,
    profile: profile,
  ) as AssessedAffordability;
  final cashNeeded = switch (estimatePurchaseCosts(
    scenario: scenario,
    market: market,
  )) {
    EstimatedPurchaseCosts(:final cashNeeded) => cashNeeded,
    IncompletePurchaseCosts() => null,
  };
  RuleCheck rule(ConstraintCheck check) => RuleCheck(
    kind: check.kind,
    ruleId: check.ruleId,
    maxLoan: check.maxLoan,
    allows: check.allows(assessed.loan),
    marketName: market.name,
    source: market.sourceOf(check.sourceId),
  );
  return AffordabilityAnswered(
    assessed: assessed,
    slice: AffordabilitySlice(
      marketId: market.id.code,
      marketName: market.name,
      price: target,
      maxPrice: highest,
      loan: assessed.loan,
      maxLoan: assessed.maxLoan,
      downPayment: down,
      cashNeeded: cashNeeded,
      savings: savings,
      annualRate: assessed.annualRate,
      termYears: term,
      loanType: loanType.label,
      monthly: MonthlyFigures(
        interest: assessed.payment.interest,
        amortization: assessed.payment.amortization,
        total: assessed.payment.total,
        afterDeduction: assessed.paymentAfterDeduction,
        amortizationRate: termMovesPayment(market)
            ? null
            : requiredAmortizationRate(
                loan: assessed.loan,
                value: target,
                tiers: market.lending.amortization.map((rule) => rule.tier),
              ),
        fee: monthlyFee,
      ),
      binding: switch (assessed.binding) {
        final binding? => rule(binding),
        null => null,
      },
      checks: [for (final check in assessed.checks) rule(check)],
      exchangeRates: [...market.exchangeRates.values],
    ),
  );
}

bool termMovesPayment(ResolvedMarket market) =>
    (market.lending.repaymentStyle ?? RepaymentStyle.annuity) ==
    RepaymentStyle.annuity;

int termYearsFor(ResolvedMarket market, BuyerProfile profile) {
  final lending = market.lending;
  final age = profile.age;
  final limits = [
    for (final limit in lending.maxTermYears) limit.years,
    if (age != null)
      for (final limit in lending.maxAgeAtMaturity) limit.years - age,
  ];
  return limits.isEmpty ? defaultTermYears : limits.reduce(min);
}
