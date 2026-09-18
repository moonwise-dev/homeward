import 'package:genui/genui.dart';

import 'affordability_summary_item.dart';
import 'amount_slider_item.dart';
import 'eligibility_checklist_item.dart';
import 'foreign_buyer_obstacles_item.dart';
import 'household_input_item.dart';
import 'location_picker_item.dart';
import 'market_snapshot_card_item.dart';
import 'money_input_item.dart';
import 'payment_breakdown_item.dart';
import 'purchase_costs_table_item.dart';
import 'stress_test_chart_item.dart';

final homewardCatalogItems = <CatalogItem>[
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
