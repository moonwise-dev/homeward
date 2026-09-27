import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/rate_type.dart';
import '../markets/exchange_rate.dart';
import '../markets/refund_rule.dart';
import '../markets/source.dart';
import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';
import 'constraint_kind.dart';
import 'stress_curve.dart';

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
    String? loanTypeId,
    required MonthlyFigures monthly,
    RuleCheck? binding,
    required List<RuleCheck> checks,
    @Default([]) List<ExchangeRate> exchangeRates,
    StressCurve? stress,
    @Default([]) List<CostLine> purchaseCosts,
    Money? purchaseCostsTotal,
    DownPaymentWhatIf? whatIf,
    @Default([]) List<MortgageOption> mortgageOptions,
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
    @JsonKey(name: 'amortizationRatePpm')
    @PpmJsonConverter()
    Rate? amortizationRate,
    Money? fee,
  }) = _MonthlyFigures;

  const MonthlyFigures._();

  Money get totalWithFee => _withFee(total);

  Money? get afterDeductionWithFee => switch (afterDeduction) {
    final amount? => _withFee(amount),
    null => null,
  };

  Money _withFee(Money amount) => switch (fee) {
    final fee? => amount + fee,
    null => amount,
  };

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

@freezed
abstract class CostLine with _$CostLine {
  const factory CostLine({
    required String label,
    String? localTerm,
    required Money amount,
    Money? refundable,
    RefundRule? refund,
    Source? source,
  }) = _CostLine;

  factory CostLine.fromJson(Map<String, Object?> json) =>
      _$CostLineFromJson(json);
}

@freezed
abstract class DownPaymentWhatIf with _$DownPaymentWhatIf {
  const factory DownPaymentWhatIf({
    required Money step,
    required List<WhatIfStep> steps,
  }) = _DownPaymentWhatIf;

  factory DownPaymentWhatIf.fromJson(Map<String, Object?> json) =>
      _$DownPaymentWhatIfFromJson(json);
}

@freezed
abstract class WhatIfStep with _$WhatIfStep {
  const factory WhatIfStep({
    required Money downPayment,
    required Money loan,
    required MonthlyFigures monthly,
    Money? cashNeeded,
    required bool withinRules,
  }) = _WhatIfStep;

  factory WhatIfStep.fromJson(Map<String, Object?> json) =>
      _$WhatIfStepFromJson(json);
}

@freezed
abstract class MortgageOption with _$MortgageOption {
  const factory MortgageOption({
    required String loanTypeId,
    required String label,
    required RateType rateType,
    @Default(0) int fixedYears,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    required MonthlyFigures monthly,
    required bool withinRules,
    Source? source,
  }) = _MortgageOption;

  factory MortgageOption.fromJson(Map<String, Object?> json) =>
      _$MortgageOptionFromJson(json);
}
