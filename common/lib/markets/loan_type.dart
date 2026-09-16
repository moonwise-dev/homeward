import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/rate_type.dart';
import '../money/rate.dart';
import 'rate_range.dart';
import 'values/percent_json_converter.dart';

import 'identified.dart';

part 'loan_type.freezed.dart';
part 'loan_type.g.dart';

@freezed
abstract class LoanType with _$LoanType implements Sourced {
  const factory LoanType({
    required String id,
    required String label,
    required RateType rateType,
    required String referenceRateId,
    required RateRange typicalSpread,
    @PercentJsonConverter() required Rate defaultSpread,
    @Default(0) int fixedYears,
    required String sourceId,
  }) = _LoanType;

  factory LoanType.fromJson(Map<String, Object?> json) =>
      _$LoanTypeFromJson(json);
}
