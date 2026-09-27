import '../finance/bracket.dart';
import '../markets/cost_base.dart';
import '../markets/cost_calculation.dart';
import '../markets/cost_rule.dart';
import '../money/money.dart';

Money chargeFor(CostRule rule, {required Money price, required Money loan}) {
  final base = switch (rule.base) {
    CostBase.price => price,
    CostBase.loan || CostBase.pledgedAmount => loan,
    CostBase.fixed => Money.zero(price.currency),
  };
  final brackets = switch (rule.calculation) {
    BracketsCalculation(:final brackets) => [
      for (final bracket in brackets) bracket.toBracket(base.currency),
    ],
    _ => const <Bracket>[],
  };
  return switch (rule.calculation) {
    FlatRateCalculation(:final rate) => base.applyRate(
      rate,
      rounding: rule.rounding,
    ),
    FixedCalculation(:final amount) => amount.toMoney(base.currency),
    PercentWithMinCalculation(:final rate, :final min) => _atLeast(
      base.applyRate(rate, rounding: rule.rounding),
      min.toMoney(base.currency),
    ),
    BracketsCalculation(marginal: true) => marginalCharge(
      base: base,
      brackets: brackets,
      rounding: rule.rounding,
    ),
    BracketsCalculation() => deductionCharge(
      base: base,
      brackets: brackets,
      rounding: rule.rounding,
    ),
  };
}

Money _atLeast(Money amount, Money minimum) =>
    amount < minimum ? minimum : amount;
