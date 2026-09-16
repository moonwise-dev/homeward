import 'package:common/common.dart';

int exactScale(Rounding rounding, int value, int multiplier, int divisor) {
  final numerator =
      BigInt.from(value) * BigInt.from(multiplier) * BigInt.from(divisor.sign);
  final denominator = BigInt.from(divisor.abs()) * BigInt.from(rounding.step);
  final truncated = numerator ~/ denominator;
  final remainder = numerator.remainder(denominator);
  final doubledRemainder = remainder.abs() * BigInt.two;
  final roundsAwayFromZero =
      remainder != BigInt.zero &&
      switch (rounding.mode) {
        RoundingMode.down => false,
        RoundingMode.up => true,
        RoundingMode.halfUp => doubledRemainder >= denominator,
        RoundingMode.halfEven =>
          doubledRemainder > denominator ||
              (doubledRemainder == denominator && truncated.isOdd),
      };
  final steps = roundsAwayFromZero
      ? truncated + BigInt.from(remainder.sign)
      : truncated;
  return (steps * BigInt.from(rounding.step)).toInt();
}
