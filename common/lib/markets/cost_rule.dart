import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/rounding.dart';
import 'buyer_predicate.dart';
import 'cost_base.dart';
import 'cost_calculation.dart';
import 'recurrence.dart';
import 'refund_rule.dart';

import 'identified.dart';

part 'cost_rule.freezed.dart';
part 'cost_rule.g.dart';

@freezed
abstract class CostRule with _$CostRule implements ConditionalRule {
  const factory CostRule({
    required String id,
    String? group,
    required String label,
    String? localTerm,
    BuyerPredicate? appliesTo,
    required CostBase base,
    required CostCalculation calculation,
    required Recurrence recurrence,
    @Default(Rounding.halfUp) Rounding rounding,
    RefundRule? refund,
    required String sourceId,
  }) = _CostRule;

  factory CostRule.fromJson(Map<String, Object?> json) =>
      _$CostRuleFromJson(json);
}
