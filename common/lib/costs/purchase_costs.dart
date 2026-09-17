import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/cost_rule.dart';
import '../markets/refund_rule.dart';
import '../markets/resolved_market.dart';
import '../markets/rule_section.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import '../profile/profile_field.dart';
import 'cost_charge.dart';

part 'purchase_costs.freezed.dart';

@freezed
sealed class PurchaseCosts with _$PurchaseCosts {
  const factory PurchaseCosts.incomplete({
    required Set<ProfileField> missing,
  }) = IncompletePurchaseCosts;

  const factory PurchaseCosts.estimated({
    required List<PurchaseCharge> charges,
    required Money total,
    required Money refundable,
    required Money cashNeeded,
  }) = EstimatedPurchaseCosts;
}

@freezed
abstract class PurchaseCharge with _$PurchaseCharge {
  const factory PurchaseCharge({
    required String ruleId,
    required String label,
    String? localTerm,
    required Money amount,
    Money? refundable,
    RefundRule? refund,
    required String sourceId,
  }) = _PurchaseCharge;
}

PurchaseCosts estimatePurchaseCosts({
  required Scenario scenario,
  required ResolvedMarket market,
}) {
  final currency = market.currency;
  if (scenario.price.currency != currency) {
    throw ArgumentError.value(
      scenario,
      'scenario',
      'Expected amounts in ${currency.code}',
    );
  }
  final missing = market.missingFor(RuleSection.purchaseCosts);
  if (missing.isNotEmpty) {
    return PurchaseCosts.incomplete(missing: missing);
  }
  Money charge(CostRule rule) =>
      chargeFor(rule, price: scenario.price, loan: scenario.loan);
  final charges = [
    for (final rule in market.purchaseCosts)
      PurchaseCharge(
        ruleId: rule.id,
        label: rule.label,
        localTerm: rule.localTerm,
        amount: charge(rule),
        refundable: switch (market.refundBaselines[rule.id]) {
          final baseline? => charge(rule) - charge(baseline),
          null => null,
        },
        refund: rule.refund,
        sourceId: rule.sourceId,
      ),
  ];
  final zero = Money.zero(currency);
  final total = charges.fold(zero, (sum, charge) => sum + charge.amount);
  return PurchaseCosts.estimated(
    charges: charges,
    total: total,
    refundable: charges.fold(
      zero,
      (sum, charge) => sum + (charge.refundable ?? zero),
    ),
    cashNeeded: scenario.downPayment + total,
  );
}
