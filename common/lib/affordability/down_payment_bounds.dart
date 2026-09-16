import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';

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

Money downPaymentStep(Money price) {
  var majorUnit = 1;
  for (var i = 0; i < price.currency.minorDigits; i++) {
    majorUnit *= 10;
  }
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
