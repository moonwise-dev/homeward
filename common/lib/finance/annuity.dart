import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';
import 'compound_growth.dart';
import 'monthly_amount.dart';
import 'monthly_payment.dart';

Money annuityPayment({
  required Money principal,
  required Rate annualRate,
  required int months,
  required Rounding rounding,
}) {
  _checkMonths(months);
  if (annualRate == Rate.zero) {
    return principal.copyWith(
      minorUnits: rounding.divide(principal.minorUnits, months),
    );
  }
  final monthlyRate = monthlyFraction(annualRate);
  final growth = compoundGrowth(monthlyRate, months);
  return principal.copyWith(
    minorUnits: rounding.roundDouble(
      principal.minorUnits * monthlyRate * growth / (growth - 1),
    ),
  );
}

MonthlyPayment firstAnnuityPayment({
  required Money principal,
  required Rate annualRate,
  required int months,
  required Rounding rounding,
}) {
  final total = annuityPayment(
    principal: principal,
    annualRate: annualRate,
    months: months,
    rounding: rounding,
  );
  final interest = monthlyAmountAtAnnualRate(
    amount: principal,
    annualRate: annualRate,
    rounding: rounding,
  );
  return MonthlyPayment(interest: interest, amortization: total - interest);
}

Money maxAnnuityPrincipal({
  required Money payment,
  required Rate annualRate,
  required int months,
  required Rounding rounding,
}) {
  _checkMonths(months);
  if (annualRate == Rate.zero) {
    return payment * months;
  }
  final monthlyRate = monthlyFraction(annualRate);
  final growth = compoundGrowth(monthlyRate, months);
  return payment.copyWith(
    minorUnits: rounding.roundDouble(
      payment.minorUnits * (growth - 1) / (monthlyRate * growth),
    ),
  );
}

void _checkMonths(int months) {
  if (months <= 0) {
    throw ArgumentError.value(months, 'months', 'Must be positive');
  }
}
