import 'package:common/common.dart';

int exactScale(Rounding rounding, int value, int multiplier, int divisor) =>
    exactRatio(
      rounding,
      BigInt.from(value) * BigInt.from(multiplier) * BigInt.from(divisor.sign),
      BigInt.from(divisor.abs()),
    );

int exactRatio(Rounding rounding, BigInt numerator, BigInt denominator) {
  final stepDenominator = denominator * BigInt.from(rounding.step);
  final truncated = numerator ~/ stepDenominator;
  final remainder = numerator.remainder(stepDenominator);
  final doubledRemainder = remainder.abs() * BigInt.two;
  final roundsAwayFromZero =
      remainder != BigInt.zero &&
      switch (rounding.mode) {
        RoundingMode.down => false,
        RoundingMode.up => true,
        RoundingMode.halfUp => doubledRemainder >= stepDenominator,
        RoundingMode.halfEven =>
          doubledRemainder > stepDenominator ||
              (doubledRemainder == stepDenominator && truncated.isOdd),
      };
  final steps = roundsAwayFromZero
      ? truncated + BigInt.from(remainder.sign)
      : truncated;
  return (steps * BigInt.from(rounding.step)).toInt();
}
