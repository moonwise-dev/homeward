import 'package:common/common.dart';
import 'package:genui/genui.dart';

import 'affordability_summary/affordability_summary_item.dart';
import 'choice/choice_item.dart';
import 'client_functions.dart';
import 'down_payment_slider/down_payment_slider_item.dart';
import 'fact/fact_item.dart';
import 'home_card/home_card_item.dart';
import 'home_comparison/home_comparison_item.dart';
import 'monthly_cost_breakdown/monthly_cost_breakdown_item.dart';
import 'mortgage_options/mortgage_options_item.dart';
import 'purchase_costs_table/purchase_costs_table_item.dart';
import 'rule_note/rule_note_item.dart';
import 'shortlist/shortlist_item.dart';
import 'stress_test_chart/stress_test_chart_item.dart';

Catalog homewardGenuiCatalog() {
  final basic = BasicCatalogItems.asNoAssetCatalog();
  return Catalog(
    [
      for (final item in basic.items)
        if (agentVisibleBasicComponents.contains(item.name)) item,
      factItem,
      choiceItem,
      affordabilitySummaryItem,
      monthlyCostBreakdownItem,
      stressTestChartItem,
      purchaseCostsTableItem,
      downPaymentSliderItem,
      mortgageOptionsItem,
      ruleNoteItem,
      homeCardItem,
      shortlistItem,
      homeComparisonItem,
    ],
    functions: [
      ...basic.functions,
      for (final function in homewardFunctions) CatalogClientFunction(function),
    ],
    catalogId: homewardCatalogId,
  );
}
