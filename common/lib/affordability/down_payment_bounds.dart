import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/lending_rules.dart';
import '../money/money.dart';
import '../money/rounding.dart';

part 'down_payment_bounds.freezed.dart';
part 'down_payment_bounds.g.dart';

@freezed
abstract class DownPaymentBounds with _$DownPaymentBounds {
  const factory DownPaymentBounds({
    required Money min,
    required Money max,
    required Money step,
  }) = _DownPaymentBounds;

  factory DownPaymentBounds.fromJson(Map<String, Object?> json) =>
      _$DownPaymentBoundsFromJson(json);
}

Money loanToValueLimit({required Money price, required LendingRules lending}) =>
    lending.maxLtv
        .map((limit) => price.applyRate(limit.rate, rounding: Rounding.down))
        .fold(price, (lowest, cap) => cap < lowest ? cap : lowest);

DownPaymentBounds loanToValueBounds({
  required Money price,
  required LendingRules lending,
}) => DownPaymentBounds(
  min: price - loanToValueLimit(price: price, lending: lending),
  max: price,
  step: downPaymentStep(price),
);

Money downPaymentStep(Money price) {
  final majorUnit = price.currency.majorUnit;
  final target = price.minorUnits ~/ 200;
  var magnitude = majorUnit;
  while (magnitude * 10 <= target) {
    magnitude *= 10;
  }
  final step = [1, 2, 5, 10]
      .map((factor) => factor * magnitude)
      .reduce(
        (nearest, candidate) =>
            (candidate - target).abs() < (nearest - target).abs()
            ? candidate
            : nearest,
      );
  return price.copyWith(minorUnits: step);
}
