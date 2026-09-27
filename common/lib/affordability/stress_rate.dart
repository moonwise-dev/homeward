import '../markets/applicability.dart';
import '../markets/resolved_market.dart';
import '../markets/stress_kind.dart';
import '../money/rate.dart';
import '../plan/scenario.dart';
import 'scenario_payment.dart';

Rate stressedRateFor(Scenario scenario, ResolvedMarket market) {
  final annualRate = scenarioRate(scenario, market);
  final loanType = loanTypeOf(scenario, market);
  return market.lending.stress
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
          StressKind.fixedRate =>
            annualRate > rule.rate ? annualRate : rule.rate,
        },
      )
      .fold(annualRate, (highest, rate) => rate > highest ? rate : highest);
}

Rate stressTestRateFor(Scenario scenario, ResolvedMarket market) => market
    .lending
    .leftToLiveOn
    .map((rule) => rule.stressRate)
    .fold(
      stressedRateFor(scenario, market),
      (highest, rate) => rate > highest ? rate : highest,
    );
