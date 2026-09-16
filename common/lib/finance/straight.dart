import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import 'monthly_amount.dart';
import 'monthly_payment.dart';

MonthlyPayment firstStraightPayment({
  required Money principal,
  required Rate annualRate,
  required Rate annualAmortizationRate,
  required Rounding rounding,
}) => MonthlyPayment(
  interest: monthlyAmountAtAnnualRate(
    amount: principal,
    annualRate: annualRate,
    rounding: rounding,
  ),
  amortization: monthlyAmountAtAnnualRate(
    amount: principal,
    annualRate: annualAmortizationRate,
    rounding: rounding,
  ),
);

Money maxStraightPrincipal({
  required Money payment,
  required Rate annualRate,
  required Rate annualAmortizationRate,
  required Rounding rounding,
}) {
  final annualCostRate = annualRate + annualAmortizationRate;
  if (annualCostRate <= Rate.zero) {
    throw ArgumentError.value(
      annualCostRate.partsPerMillion,
      'annualRate + annualAmortizationRate',
      'Must be positive',
    );
  }
  return payment.copyWith(
    minorUnits: rounding.scale(
      payment.minorUnits,
      Rate.hundredPercent.partsPerMillion * monthsPerYear,
      annualCostRate.partsPerMillion,
    ),
  );
}
