import 'package:common/common.dart';
import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:a2ui_flutter/basic_catalog.dart';

import 'affordability_summary/affordability_summary_item.dart';
import 'brief/brief_item.dart';
import 'buy_vs_rent/buy_vs_rent_item.dart';
import 'choice/choice_item.dart';
import 'down_payment_slider/down_payment_slider_item.dart';
import 'fact/fact_item.dart';
import 'home_card/home_card_item.dart';
import 'home_comparison/home_comparison_item.dart';
import 'home_swipe/home_swipe_item.dart';
import 'household_summary/household_summary_item.dart';
import 'listing_quote/listing_quote_item.dart';
import 'loan_balance_chart/loan_balance_chart_item.dart';
import 'market_snapshot_card/market_snapshot_card_item.dart';
import 'monthly_cost_breakdown/monthly_cost_breakdown_item.dart';
import 'money_input/money_input_item.dart';
import 'mortgage_options/mortgage_options_item.dart';
import 'plan_sections.dart';
import 'plan_overview/plan_overview_item.dart';
import 'purchase_costs_table/purchase_costs_table_item.dart';
import 'questions/questions_item.dart';
import 'rent_split/rent_split_item.dart';
import 'route_summary/route_summary_item.dart';
import 'rule_note/rule_note_item.dart';
import 'savings_plan/savings_plan_item.dart';
import 'shortlist/shortlist_item.dart';
import 'stress_test_chart/stress_test_chart_item.dart';
import 'week_map/week_map_item.dart';
import 'home_map/home_map_item.dart';
import 'must_have/must_have_item.dart';
import 'weekly_travel/weekly_travel_item.dart';
import 'wrapping_row.dart';

CatalogImplementation homewardRendererCatalog() {
  final basic = basicCatalog();
  return CatalogImplementation(
    id: homewardCatalogId,
    protocolVersion: A2uiProtocolVersion.v1_0,
    components: [
      for (final item in [
        for (final item in basic.components.values)
          if (agentVisibleBasicComponents.contains(item.name))
            item.name == 'Row' ? wrappingRow(item) : item,
        planOverviewItem,
        factItem,
        briefItem,
        choiceItem,
        questionsItem,
        householdSummaryItem,
        moneyInputItem,
        affordabilitySummaryItem,
        monthlyCostBreakdownItem,
        stressTestChartItem,
        purchaseCostsTableItem,
        downPaymentSliderItem,
        mortgageOptionsItem,
        loanBalanceChartItem,
        savingsPlanItem,
        marketSnapshotCardItem,
        rentSplitItem,
        buyVsRentItem,
        ruleNoteItem,
        homeCardItem,
        shortlistItem,
        homeComparisonItem,
        homeSwipeItem,
        listingQuoteItem,
        weeklyTravelItem,
        routeSummaryItem,
        weekMapItem,
        homeMapItem,
        mustHaveItem,
      ])
        asPlanSections(item),
    ],
    functions: basic.functions.values.toList(),
    definitions: basic.definitions,
  );
}
