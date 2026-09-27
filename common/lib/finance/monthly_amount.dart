import '../money/money.dart';
import '../money/rate.dart';
import '../money/rounding.dart';

const monthsPerYear = 12;

Money monthlyAmountAtAnnualRate({
  required Money amount,
  required Rate annualRate,
  required Rounding rounding,
}) => amount.copyWith(
  minorUnits: rounding.scale(
    amount.minorUnits,
    annualRate.partsPerMillion,
    Rate.hundredPercent.partsPerMillion * monthsPerYear,
  ),
);
