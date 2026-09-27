import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';

part 'loan_schedule.freezed.dart';
part 'loan_schedule.g.dart';

@freezed
abstract class LoanYear with _$LoanYear {
  const factory LoanYear({
    required int year,
    required Money balance,
    required Money equity,
    required Money interestPaid,
  }) = _LoanYear;

  factory LoanYear.fromJson(Map<String, Object?> json) =>
      _$LoanYearFromJson(json);
}

@freezed
abstract class AmortizationStep with _$AmortizationStep {
  const factory AmortizationStep({
    required int year,
    @JsonKey(name: 'annualRatePpm')
    @PpmJsonConverter()
    required Rate annualRate,
    @JsonKey(name: 'belowSharePpm') @PpmJsonConverter() Rate? belowShare,
  }) = _AmortizationStep;

  factory AmortizationStep.fromJson(Map<String, Object?> json) =>
      _$AmortizationStepFromJson(json);
}

@freezed
abstract class LoanSchedule with _$LoanSchedule {
  const factory LoanSchedule({
    required List<LoanYear> years,
    @Default([]) List<AmortizationStep> steps,
    int? paidOffYear,
  }) = _LoanSchedule;

  const LoanSchedule._();

  factory LoanSchedule.fromJson(Map<String, Object?> json) =>
      _$LoanScheduleFromJson(json);

  LoanYear at(int year) => years.firstWhere(
    (point) => point.year == year,
    orElse: () => years.last,
  );
}
