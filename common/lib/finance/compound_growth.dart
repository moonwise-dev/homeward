import '../money/rate.dart';
import 'monthly_amount.dart';

double monthlyFraction(Rate annualRate) =>
    annualRate.partsPerMillion /
    (Rate.hundredPercent.partsPerMillion * monthsPerYear);

double compoundGrowth(double monthlyRate, int months) {
  var growth = 1.0;
  var factor = 1.0 + monthlyRate;
  for (var remaining = months; remaining > 0; remaining ~/= 2) {
    if (remaining.isOdd) {
      growth *= factor;
    }
    factor *= factor;
  }
  return growth;
}
