import 'package:common/common.dart';
import 'package:genui/genui.dart';

import 'affordability_summary/affordability_summary_item.dart';
import 'amount_slider/amount_slider_item.dart';
import 'client_functions.dart';
import 'comparison_table/comparison_table_item.dart';
import 'dynamic_recommendation_stack/dynamic_recommendation_stack_item.dart';
import 'eligibility_checklist/eligibility_checklist_item.dart';
import 'foreign_buyer_obstacles/foreign_buyer_obstacles_item.dart';
import 'household_input/household_input_item.dart';
import 'hunch/hunch_item.dart';
import 'lifestyle_commute_map/lifestyle_commute_map_item.dart';
import 'listing_card/listing_card_item.dart';
import 'location_picker/location_picker_item.dart';
import 'market_snapshot_card/market_snapshot_card_item.dart';
import 'money_input/money_input_item.dart';
import 'payment_breakdown/payment_breakdown_item.dart';
import 'photo_lineup/photo_lineup_item.dart';
import 'purchase_costs_table/purchase_costs_table_item.dart';
import 'story_draft/story_draft_item.dart';
import 'stress_test_chart/stress_test_chart_item.dart';
import 'trade_off/trade_off_item.dart';

Catalog homewardGenuiCatalog() {
  final basic = BasicCatalogItems.asNoAssetCatalog();
  return Catalog(
    [
      for (final item in basic.items)
        if (agentVisibleBasicComponents.contains(item.name)) item,
      ..._homewardCatalogItems,
    ],
    functions: [
      ...basic.functions,
      for (final function in homewardFunctions) CatalogClientFunction(function),
    ],
    catalogId: homewardCatalogId,
  );
}

final _homewardCatalogItems = <CatalogItem>[
  storyDraftItem,
  hunchItem,
  photoLineupItem,
  tradeOffItem,
  lifestyleCommuteMapItem,
  comparisonTableItem,
  dynamicRecommendationStackItem,
  listingCardItem,
  locationPickerItem,
  moneyInputItem,
  householdInputItem,
  amountSliderItem,
  marketSnapshotCardItem,
  affordabilitySummaryItem,
  paymentBreakdownItem,
  purchaseCostsTableItem,
  stressTestChartItem,
  eligibilityChecklistItem,
  foreignBuyerObstaclesItem,
];
