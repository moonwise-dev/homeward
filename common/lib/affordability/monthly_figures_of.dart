import '../finance/amortization_tier.dart';
import '../finance/repayment_style.dart';
import '../markets/resolved_market.dart';
import '../plan/scenario.dart';
import 'affordability.dart';
import 'affordability_slice.dart';

MonthlyFigures monthlyFiguresOf(
  AssessedAffordability assessed,
  Scenario scenario,
  ResolvedMarket market,
) => MonthlyFigures(
  interest: assessed.payment.interest,
  amortization: assessed.payment.amortization,
  total: assessed.payment.total,
  afterDeduction: assessed.paymentAfterDeduction,
  amortizationRate: termMovesPayment(market)
      ? null
      : requiredAmortizationRate(
          loan: assessed.loan,
          value: scenario.price,
          tiers: market.lending.amortization.map((rule) => rule.tier),
        ),
  fee: scenario.associationFee,
);

bool termMovesPayment(ResolvedMarket market) =>
    (market.lending.repaymentStyle ?? RepaymentStyle.annuity) ==
    RepaymentStyle.annuity;
