import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/stress_test_chart_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final stressTestChartItem = catalogItemFor(const StressTestChart(), (
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
      final StressCurve curve;
      try {
        curve = stressCurveFor(
          scenario: scenario,
          market: market,
          profile: profile,
        );
      } on ArgumentError {
        return const WaitingForDetails();
      }
      return StressTestChartView(
        curve: curve,
        locale: market.locale,
        onExplain: data['explain'] == null
            ? null
            : () => dispatchAction(itemContext, data['explain']),
      );
    },
  );
});
