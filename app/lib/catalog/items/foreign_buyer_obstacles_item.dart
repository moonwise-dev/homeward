import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/foreign_buyer_obstacles_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final foreignBuyerObstaclesItem = catalogItemFor(
  const ForeignBuyerObstacles(),
  (
    itemContext,
  ) {
    final data = itemContext.data as JsonMap;
    return BoundScenarioSlices(
      dataContext: itemContext.dataContext,
      data: data,
      builder: (context, scenario, market, profile) {
        if (market == null) {
          return const WaitingForDetails();
        }
        return ForeignBuyerObstaclesView(
          obstacles: market.obstacles,
          locale: market.locale,
          refunds: scenario == null ? const [] : _refunds(scenario, market),
          missing: market.missingFor(RuleSection.obstacles),
          onExplain: data['explain'] == null
              ? null
              : () => dispatchAction(itemContext, data['explain']),
        );
      },
    );
  },
);

List<PurchaseCharge> _refunds(Scenario scenario, ResolvedMarket market) {
  try {
    return switch (estimatePurchaseCosts(scenario: scenario, market: market)) {
      EstimatedPurchaseCosts(:final charges) => [
        for (final charge in charges)
          if (charge.refund != null && charge.refundable?.isZero == false)
            charge,
      ],
      IncompletePurchaseCosts() => const [],
    };
  } on ArgumentError {
    return const [];
  }
}
