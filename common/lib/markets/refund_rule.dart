import 'package:freezed_annotation/freezed_annotation.dart';

import '../time/period.dart';
import '../time/period_json_converter.dart';
import 'buyer_predicate.dart';

part 'refund_rule.freezed.dart';
part 'refund_rule.g.dart';

@freezed
abstract class RefundRule with _$RefundRule {
  const factory RefundRule({
    required BuyerPredicate when,
    required BuyerPredicate recomputeAs,
    @PeriodJsonConverter() required Period deadline,
    @PeriodJsonConverter() required Period claimWindow,
    required String sourceId,
  }) = _RefundRule;

  factory RefundRule.fromJson(Map<String, Object?> json) =>
      _$RefundRuleFromJson(json);
}
