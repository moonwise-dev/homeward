import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/bound_scenario_slices.dart';
import '../views/payment_breakdown_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final paymentBreakdownItem = catalogItemFor(const PaymentBreakdown(), (
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
      final MonthlyPayment payment;
      final Rate annualRate;
      final Affordability affordability;
      try {
        payment = scenarioPayment(scenario, market);
        annualRate = scenarioRate(scenario, market);
        affordability = assessAffordability(
          scenario: scenario,
          market: market,
          profile: profile,
        );
      } on ArgumentError {
        return const WaitingForDetails();
      }
      return PaymentBreakdownView(
        payment: payment,
        annualRate: annualRate,
        locale: market.locale,
        associationFee: scenario.associationFee,
        afterDeduction: switch (affordability) {
          AssessedAffordability(:final paymentAfterDeduction) =>
            paymentAfterDeduction,
          IncompleteAffordability() => null,
        },
        onExplain: data['explain'] == null
            ? null
            : () => dispatchAction(itemContext, data['explain']),
      );
    },
  );
});
