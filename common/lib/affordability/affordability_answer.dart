import 'dart:math';

import '../costs/purchase_costs.dart';
import '../markets/loan_type.dart';
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
import 'down_payment_what_if.dart';
import 'maximum_price.dart';
import 'monthly_figures_of.dart';
import 'stress_curve.dart';

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
  String? loanTypeId,
}) {
  final zero = Money.zero(market.currency);
  final loanType =
      market.loanTypes.where((type) => type.id == loanTypeId).firstOrNull ??
      market.loanTypes.first;
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
  final costs = switch (estimatePurchaseCosts(
    scenario: scenario,
    market: market,
  )) {
    final EstimatedPurchaseCosts costs => costs,
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
      cashNeeded: costs?.cashNeeded,
      savings: savings,
      annualRate: assessed.annualRate,
      termYears: term,
      loanType: loanType.label,
      loanTypeId: loanType.id,
      monthly: monthlyFiguresOf(assessed, scenario, market),
      binding: switch (assessed.binding) {
        final binding? => rule(binding),
        null => null,
      },
      checks: [for (final check in assessed.checks) rule(check)],
      exchangeRates: [...market.exchangeRates.values],
      stress: _stressCurve(scenario, market, profile),
      purchaseCosts: [
        for (final charge in costs?.charges ?? const <PurchaseCharge>[])
          CostLine(
            label: charge.label,
            localTerm: charge.localTerm,
            amount: charge.amount,
            refundable: charge.refundable,
            refund: charge.refund,
            source: market.sourceOf(charge.sourceId),
          ),
      ],
      purchaseCostsTotal: costs?.total,
      mortgageOptions: [
        for (final option in market.loanTypes)
          _mortgageOption(
            scenario.copyWith(
              loanTypeId: option.id,
              rateSpread: option.defaultSpread,
            ),
            option,
            market,
            profile,
          ),
      ],
      whatIf: downPaymentWhatIf(
        market: market,
        profile: profile,
        scenarioWith: (downPayment) => at(target, downPayment),
        price: target,
        minimum: open.maxLoan < target ? target - open.maxLoan : zero,
        savings: savings,
      ),
      profile: profile,
      downPaymentStated: downPayment != null,
    ),
  );
}

MortgageOption _mortgageOption(
  Scenario scenario,
  LoanType loanType,
  ResolvedMarket market,
  BuyerProfile profile,
) {
  final assessed = assessAffordability(
    scenario: scenario,
    market: market,
    profile: profile,
  ) as AssessedAffordability;
  return MortgageOption(
    loanTypeId: loanType.id,
    label: loanType.label,
    rateType: loanType.rateType,
    fixedYears: loanType.fixedYears,
    annualRate: assessed.annualRate,
    monthly: monthlyFiguresOf(assessed, scenario, market),
    withinRules: assessed.loan <= assessed.maxLoan,
    source: market.sourceOf(loanType.sourceId),
  );
}

StressCurve? _stressCurve(
  Scenario scenario,
  ResolvedMarket market,
  BuyerProfile profile,
) {
  try {
    return stressCurveFor(scenario: scenario, market: market, profile: profile);
  } on ArgumentError {
    return null;
  }
}

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
