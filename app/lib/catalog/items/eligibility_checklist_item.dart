import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/eligibility_checklist_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final eligibilityChecklistItem = catalogItemFor(const EligibilityChecklist(), (
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
      final Eligibility eligibility;
      try {
        eligibility = eligibilityFor(
          scenario: scenario,
          market: market,
          profile: profile,
        );
      } on ArgumentError {
        return const WaitingForDetails();
      }
      return EligibilityChecklistView(
        eligibility: eligibility,
        locale: market.locale,
        onExplain: data['explain'] == null
            ? null
            : () => dispatchAction(itemContext, data['explain']),
      );
    },
  );
});
