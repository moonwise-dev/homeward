import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/purchase_costs_table_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final purchaseCostsTableItem = catalogItemFor(const PurchaseCostsTable(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundScenarioSlices(
    dataContext: itemContext.dataContext,
    data: data,
    builder: (context, scenario, market, profile) {
      if (scenario == null || market == null) {
        return const WaitingForDetails();
      }
      final PurchaseCosts costs;
      try {
        costs = estimatePurchaseCosts(scenario: scenario, market: market);
      } on ArgumentError {
        return const WaitingForDetails();
      }
      return switch (costs) {
        IncompletePurchaseCosts() => const WaitingForDetails(),
        EstimatedPurchaseCosts() => PurchaseCostsTableView(
          costs: costs,
          locale: market.locale,
          sources: market.sources,
          onExplain: data['explain'] == null
              ? null
              : () => dispatchAction(itemContext, data['explain']),
        ),
      };
    },
  );
});
