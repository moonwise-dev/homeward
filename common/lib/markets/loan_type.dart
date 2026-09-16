import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/rate_type.dart';
import 'rate_range.dart';

import 'identified.dart';

part 'loan_type.freezed.dart';
part 'loan_type.g.dart';

@freezed
abstract class LoanType with _$LoanType implements Identified {
  const factory LoanType({
    required String id,
    required String label,
    required RateType rateType,
    required String referenceRateId,
    required RateRange typicalSpread,
    @Default(0) int fixedYears,
    required String sourceId,
  }) = _LoanType;

  factory LoanType.fromJson(Map<String, Object?> json) =>
      _$LoanTypeFromJson(json);
}
