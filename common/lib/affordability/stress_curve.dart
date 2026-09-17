import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../money/rate.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import 'constraint_kind.dart';
import 'interest_deduction.dart';
import 'monthly_ceiling.dart';
import 'scenario_payment.dart';
import 'stress_rate.dart';

part 'stress_curve.freezed.dart';

@freezed
abstract class StressCurve with _$StressCurve {
  const factory StressCurve({
    required List<StressPoint> points,
    required Rate todayRate,
    required Rate stressRate,
    required bool afterDeduction,
    Money? limit,
    ConstraintKind? limitKind,
  }) = _StressCurve;
}

@freezed
abstract class StressPoint with _$StressPoint {
  const factory StressPoint({
    required Rate annualRate,
    required Money cost,
  }) = _StressPoint;
}

const stressCurveStep = Rate.ppm(5000);
const stressCurveMargin = Rate.ppm(20000);

StressCurve stressCurveFor({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final todayRate = scenarioRate(scenario, market);
  final stressRate = stressTestRateFor(scenario, market);
  final borrowers = profile.borrowers;
  final deducts = market.lending.interestDeduction.isNotEmpty;
  final afterDeduction = deducts && borrowers != null;

  Money costAt(Rate annualRate) {
    final payment = paymentFor(
      principal: scenario.loan,
      annualRate: annualRate,
      scenario: scenario,
      market: market,
    );
    if (!afterDeduction) {
      return payment.total;
    }
    return market.lending.interestDeduction.fold(
      payment.total,
      (total, rule) =>
          total -
          monthlyInterestDeduction(
            monthlyInterest: payment.interest,
            rule: rule,
            borrowers: borrowers,
          ),
    );
  }

  final last = stressRate + stressCurveMargin;
  final rates = {todayRate, stressRate, last};
  for (var rate = todayRate; rate <= last; rate += stressCurveStep) {
    rates.add(rate);
  }
  final tightest =
      monthlyCeilings(
            market: market,
            profile: profile,
            scenario: scenario,
          )
          .where((ceiling) => ceiling.afterDeduction == afterDeduction)
          .fold<MonthlyCeiling?>(null, (lowest, ceiling) {
            return lowest == null || ceiling.amount < lowest.amount
                ? ceiling
                : lowest;
          });
  return StressCurve(
    points: [
      for (final rate in rates.toList()..sort((a, b) => a.compareTo(b)))
        StressPoint(annualRate: rate, cost: costAt(rate)),
    ],
    todayRate: todayRate,
    stressRate: stressRate,
    afterDeduction: afterDeduction,
    limit: tightest?.amount,
    limitKind: tightest?.kind,
  );
}
