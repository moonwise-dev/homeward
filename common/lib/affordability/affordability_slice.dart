import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/exchange_rate.dart';
import '../markets/source.dart';
import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';
import 'constraint_kind.dart';

part 'affordability_slice.freezed.dart';
part 'affordability_slice.g.dart';

@freezed
abstract class AffordabilitySlice with _$AffordabilitySlice {
  const factory AffordabilitySlice({
    required String marketId,
    required String marketName,
    @Default(true) bool sample,
    required Money price,
    Money? maxPrice,
    required Money loan,
    required Money maxLoan,
    required Money downPayment,
    Money? cashNeeded,
    Money? savings,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    required int termYears,
    required String loanType,
    required MonthlyFigures monthly,
    RuleCheck? binding,
    required List<RuleCheck> checks,
    @Default([]) List<ExchangeRate> exchangeRates,
  }) = _AffordabilitySlice;

  factory AffordabilitySlice.fromJson(Map<String, Object?> json) =>
      _$AffordabilitySliceFromJson(json);
}

@freezed
abstract class MonthlyFigures with _$MonthlyFigures {
  const factory MonthlyFigures({
    required Money interest,
    required Money amortization,
    required Money total,
    Money? afterDeduction,
  }) = _MonthlyFigures;

  factory MonthlyFigures.fromJson(Map<String, Object?> json) =>
      _$MonthlyFiguresFromJson(json);
}

@freezed
abstract class RuleCheck with _$RuleCheck {
  const factory RuleCheck({
    required ConstraintKind kind,
    required String ruleId,
    required Money maxLoan,
    required bool allows,
    required String marketName,
    Source? source,
  }) = _RuleCheck;

  factory RuleCheck.fromJson(Map<String, Object?> json) =>
      _$RuleCheckFromJson(json);
}
