import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/affordability_summary_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final affordabilitySummaryItem = catalogItemFor(const AffordabilitySummary(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundScenarioSlices(
    dataContext: itemContext.dataContext,
    data: data,
    builder: (context, scenario, market, profile) {
      if (scenario == null || market == null || profile == null) {
        return const WaitingForDetails();
      }
      final Affordability affordability;
      try {
        affordability = assessAffordability(
          scenario: scenario,
          market: market,
          profile: profile,
        );
      } on ArgumentError {
        return const WaitingForDetails();
      }
      return AffordabilitySummaryView(
        affordability: affordability,
        locale: market.locale,
        maxPrice: maximumPrice(
          scenario: scenario,
          market: market,
          profile: profile,
        ),
        exchangeRates: market.exchangeRates.values.toList(),
        onExplain: data['explain'] == null
            ? null
            : () => dispatchAction(itemContext, data['explain']),
      );
    },
  );
});
