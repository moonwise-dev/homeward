import '../finance/amortization_tier.dart';
import '../finance/annuity.dart';
import '../finance/monthly_payment.dart';
import '../finance/repayment_style.dart';
import '../finance/straight.dart';
import '../markets/loan_type.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import '../plan/scenario.dart';

LoanType loanTypeOf(Scenario scenario, ResolvedMarket market) =>
    market.loanTypes.firstWhere(
      (type) => type.id == scenario.loanTypeId,
      orElse: () => throw ArgumentError.value(
        scenario.loanTypeId,
        'scenario.loanTypeId',
        'Not a loan type of ${market.id.code}',
      ),
    );

Rate scenarioRate(Scenario scenario, ResolvedMarket market) {
  final referenceRateId = loanTypeOf(scenario, market).referenceRateId;
  final referenceRate =
      market.referenceRates[referenceRateId] ??
      (throw ArgumentError.value(
        referenceRateId,
        'market.referenceRates',
        'Missing',
      ));
  return referenceRate.rate + scenario.rateSpread + scenario.rateShock;
}

MonthlyPayment scenarioPayment(Scenario scenario, ResolvedMarket market) =>
    paymentFor(
      principal: scenario.loan,
      annualRate: scenarioRate(scenario, market),
      scenario: scenario,
      market: market,
    );

MonthlyPayment paymentFor({
  required Money principal,
  required Rate annualRate,
  required Scenario scenario,
  required ResolvedMarket market,
}) => switch (market.lending.repaymentStyle ?? RepaymentStyle.annuity) {
  RepaymentStyle.annuity => firstAnnuityPayment(
    principal: principal,
    annualRate: annualRate,
    months: scenario.months,
    rounding: Rounding.halfUp,
  ),
  RepaymentStyle.straight => firstStraightPayment(
    principal: principal,
    annualRate: annualRate,
    annualAmortizationRate: requiredAmortizationRate(
      loan: principal,
      value: scenario.price,
      tiers: market.lending.amortization.map((rule) => rule.tier),
    ),
    rounding: Rounding.halfUp,
  ),
};
