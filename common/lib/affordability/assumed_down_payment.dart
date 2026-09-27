import '../costs/purchase_costs.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import 'down_payment_bounds.dart';

Money assumedDownPayment({
  required ResolvedMarket market,
  required Scenario Function(Money downPayment) scenarioWith,
  required Money price,
  required Money minimum,
  required Money? savings,
}) {
  Money cashNeeded(Money downPayment) => switch (estimatePurchaseCosts(
    scenario: scenarioWith(downPayment),
    market: market,
  )) {
    EstimatedPurchaseCosts(:final cashNeeded) => cashNeeded,
    IncompletePurchaseCosts() => downPayment,
  };
  if (savings == null || cashNeeded(minimum) <= savings) {
    return minimum;
  }
  final floor = loanToValueBounds(price: price, lending: market.lending).min;
  final step = downPaymentStep(price).minorUnits;
  for (
    var units = savings.minorUnits ~/ step * step;
    units > floor.minorUnits;
    units -= step
  ) {
    final downPayment = price.copyWith(minorUnits: units);
    if (cashNeeded(downPayment) <= savings) {
      return downPayment;
    }
  }
  return floor;
}
