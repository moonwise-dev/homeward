import 'package:freezed_annotation/freezed_annotation.dart';

import 'rounding_mode.dart';

part 'rounding.freezed.dart';
part 'rounding.g.dart';

@freezed
abstract class Rounding with _$Rounding {
  @Assert('step > 0', 'step must be positive')
  const factory Rounding({
    required RoundingMode mode,
    @Default(1) int step,
  }) = _Rounding;

  const Rounding._();

  factory Rounding.fromJson(Map<String, Object?> json) =>
      _$RoundingFromJson(json);

  static const halfUp = Rounding(mode: RoundingMode.halfUp);

  static const down = Rounding(mode: RoundingMode.down);

  static const _maxExactInteger = 9007199254740991;

  int divide(int dividend, int divisor) => scale(dividend, 1, divisor);

  int scale(int value, int multiplier, int divisor) {
    if (divisor < 0) {
      return scale(-value, multiplier, -divisor);
    }
    final limit = multiplier == 0
        ? _maxExactInteger
        : _maxExactInteger ~/ multiplier.abs();
    if (divisor > limit || value.abs() ~/ divisor > limit) {
      throw ArgumentError(
        '$value * $multiplier / $divisor exceeds exact integer range',
      );
    }
    final wholePart = value ~/ divisor * multiplier;
    final fractionalNumerator = value.remainder(divisor) * multiplier;
    return roundFraction(wholePart, fractionalNumerator, divisor);
  }

  int roundDouble(double value) {
    if (!value.isFinite || value.abs() > _maxExactInteger) {
      throw ArgumentError.value(value, 'value', 'Not an exact integer range');
    }
    final quotient = value / step;
    final truncatedSteps = quotient.truncate();
    final remainder = (quotient - truncatedSteps).abs();
    if (remainder == 0) {
      return truncatedSteps * step;
    }
    final steps =
        _roundsAwayFromZero(remainder.compareTo(0.5), truncatedSteps.isOdd)
        ? truncatedSteps + quotient.sign.toInt()
        : truncatedSteps;
    return steps * step;
  }

  int roundFraction(int wholePart, int fractionalNumerator, int divisor) {
    if (divisor <= 0 || (wholePart.sign * fractionalNumerator.sign) < 0) {
      throw ArgumentError(
        '$wholePart + $fractionalNumerator / $divisor must have one sign',
      );
    }
    final numerator = wholePart.remainder(step) * divisor + fractionalNumerator;
    final denominator = divisor * step;
    final truncatedSteps = wholePart ~/ step + numerator ~/ denominator;
    final remainder = numerator.remainder(denominator);
    if (remainder == 0) {
      return truncatedSteps * step;
    }
    final steps =
        _roundsAwayFromZero(
          (remainder.abs() * 2).compareTo(denominator),
          truncatedSteps.isOdd,
        )
        ? truncatedSteps + remainder.sign
        : truncatedSteps;
    return steps * step;
  }

  bool _roundsAwayFromZero(int comparedToHalf, bool truncatedIsOdd) =>
      switch (mode) {
        RoundingMode.down => false,
        RoundingMode.up => true,
        RoundingMode.halfUp => comparedToHalf >= 0,
        RoundingMode.halfEven =>
          comparedToHalf > 0 || (comparedToHalf == 0 && truncatedIsOdd),
      };
}
