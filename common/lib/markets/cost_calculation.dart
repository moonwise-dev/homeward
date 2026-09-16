import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/rate.dart';
import 'bracket_rule.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';
import 'values/percent_json_converter.dart';

part 'cost_calculation.freezed.dart';
part 'cost_calculation.g.dart';

@Freezed(unionKey: 'type')
sealed class CostCalculation with _$CostCalculation {
  const factory CostCalculation.flatRate({
    @PercentJsonConverter() required Rate rate,
  }) = FlatRateCalculation;

  const factory CostCalculation.brackets({
    required List<BracketRule> brackets,
    required bool marginal,
  }) = BracketsCalculation;

  const factory CostCalculation.fixed({
    @ExactDecimalJsonConverter() required ExactDecimal amount,
  }) = FixedCalculation;

  const factory CostCalculation.percentWithMin({
    @PercentJsonConverter() required Rate rate,
    @ExactDecimalJsonConverter() required ExactDecimal min,
  }) = PercentWithMinCalculation;

  factory CostCalculation.fromJson(Map<String, Object?> json) =>
      _$CostCalculationFromJson(json);
}
