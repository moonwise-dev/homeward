import '../finance/bracket.dart';
import '../money/money.dart';
import '../money/rounding.dart';
import '../markets/household_rules.dart';

Money monthlyInterestDeduction({
  required Money monthlyInterest,
  required InterestDeductionRule rule,
  required int borrowers,
}) {
  if (borrowers < 1) {
    throw ArgumentError.value(borrowers, 'borrowers', 'Must be positive');
  }
  final sharing = rule.perBorrower ? borrowers : 1;
  final yearlyInterest = monthlyInterest * 12;
  final share = yearlyInterest.copyWith(
    minorUnits: Rounding.down.divide(yearlyInterest.minorUnits, sharing),
  );
  final yearlyDeduction =
      marginalCharge(
        base: share,
        brackets: [
          for (final bracket in rule.yearlyBrackets)
            bracket.toBracket(monthlyInterest.currency),
        ],
        rounding: Rounding.halfUp,
      ) *
      sharing;
  return yearlyDeduction.copyWith(
    minorUnits: Rounding.halfUp.divide(yearlyDeduction.minorUnits, 12),
  );
}
