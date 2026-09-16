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

  int divide(int dividend, int divisor) => scale(dividend, 1, divisor);

  int scale(int value, int multiplier, int divisor) {
    if (divisor < 0) {
      return scale(-value, multiplier, -divisor);
    }
    final wholePart = value ~/ divisor * multiplier;
    final fractionalNumerator = value.remainder(divisor) * multiplier;
    return _roundToStep(wholePart, fractionalNumerator, divisor);
  }

  int _roundToStep(int wholePart, int fractionalNumerator, int divisor) {
    final numerator = wholePart.remainder(step) * divisor + fractionalNumerator;
    final denominator = divisor * step;
    final truncatedSteps = wholePart ~/ step + numerator ~/ denominator;
    final remainder = numerator.remainder(denominator);
    if (remainder == 0) {
      return truncatedSteps * step;
    }
    final doubledRemainder = remainder.abs() * 2;
    final roundsAwayFromZero = switch (mode) {
      RoundingMode.down => false,
      RoundingMode.up => true,
      RoundingMode.halfUp => doubledRemainder >= denominator,
      RoundingMode.halfEven =>
        doubledRemainder > denominator ||
            (doubledRemainder == denominator && truncatedSteps.isOdd),
    };
    final steps = roundsAwayFromZero
        ? truncatedSteps + remainder.sign
        : truncatedSteps;
    return steps * step;
  }
}
