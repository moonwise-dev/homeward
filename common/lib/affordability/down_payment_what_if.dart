import '../costs/purchase_costs.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import 'affordability.dart';
import 'affordability_slice.dart';
import 'assess_affordability.dart';
import 'down_payment_bounds.dart';
import 'monthly_figures_of.dart';

const maxWhatIfSteps = 40;

DownPaymentWhatIf? downPaymentWhatIf({
  required ResolvedMarket market,
  required BuyerProfile profile,
  required Scenario Function(Money downPayment) scenarioWith,
  required Money price,
  required Money minimum,
  required Money? savings,
}) {
  if (savings == null) {
    return null;
  }
  WhatIfStep stepAt(Money downPayment) {
    final scenario = scenarioWith(downPayment);
    final assessed = assessAffordability(
      scenario: scenario,
      market: market,
      profile: profile,
    ) as AssessedAffordability;
    return WhatIfStep(
      downPayment: downPayment,
      loan: assessed.loan,
      monthly: monthlyFiguresOf(assessed, scenario, market),
      cashNeeded: switch (estimatePurchaseCosts(
        scenario: scenario,
        market: market,
      )) {
        EstimatedPurchaseCosts(:final cashNeeded) => cashNeeded,
        IncompletePurchaseCosts() => null,
      },
      withinRules: assessed.loan <= assessed.maxLoan,
    );
  }

  bool withinSavings(WhatIfStep step) =>
      (step.cashNeeded ?? step.downPayment) <= savings;
  final step = _stepFor(price, minimum, savings < price ? savings : price);
  final steps = [stepAt(minimum)];
  var next = ((minimum.minorUnits ~/ step.minorUnits) + 1) * step.minorUnits;
  while (next <= price.minorUnits && withinSavings(steps.last)) {
    final candidate = stepAt(price.copyWith(minorUnits: next));
    if (!withinSavings(candidate)) {
      break;
    }
    steps.add(candidate);
    next += step.minorUnits;
  }
  return DownPaymentWhatIf(step: step, steps: steps);
}

Money _stepFor(Money price, Money minimum, Money upper) {
  final base = downPaymentStep(price);
  final span = upper.minorUnits - minimum.minorUnits;
  final count = span <= 0 ? 0 : span ~/ base.minorUnits;
  return count <= maxWhatIfSteps
      ? base
      : base.copyWith(
          minorUnits: base.minorUnits * ((count / maxWhatIfSteps).ceil()),
        );
}
