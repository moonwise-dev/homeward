import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_summary.freezed.dart';

@freezed
abstract class PlanSummary with _$PlanSummary {
  const factory PlanSummary({
    required String id,
    required DateTime lastActivityAt,
    String? title,
  }) = _PlanSummary;
}
