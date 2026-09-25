import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/amount_slider.dart';
import 'components/comparison_table.dart';
import 'components/dynamic_recommendation_stack.dart';
import 'components/eligibility_checklist.dart';
import 'components/foreign_buyer_obstacles.dart';
import 'components/household_input.dart';
import 'components/hunch.dart';
import 'components/lifestyle_commute_map.dart';
import 'components/listing_card.dart';
import 'components/location_picker.dart';
import 'components/market_snapshot_card.dart';
import 'components/money_input.dart';
import 'components/payment_breakdown.dart';
import 'components/photo_lineup.dart';
import 'components/purchase_costs_table.dart';
import 'components/story_draft.dart';
import 'components/stress_test_chart.dart';
import 'components/trade_off.dart';
import 'functions/cash_needed_function.dart';
import 'functions/catalog_function.dart';
import 'functions/monthly_payment_function.dart';
import 'functions/within_max_ltv_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[
  StoryDraft(),
  Hunch(),
  PhotoLineup(),
  TradeOff(),
  LifestyleCommuteMap(),
  ComparisonTable(),
  DynamicRecommendationStack(),
  ListingCard(),
  LocationPicker(),
  MoneyInput(),
  HouseholdInput(),
  AmountSlider(),
  MarketSnapshotCard(),
  AffordabilitySummary(),
  PaymentBreakdown(),
  PurchaseCostsTable(),
  StressTestChart(),
  EligibilityChecklist(),
  ForeignBuyerObstacles(),
];

const homewardFunctions = <CatalogFunction>[
  CashNeededFunction(),
  MonthlyPaymentFunction(),
  WithinMaxLtvFunction(),
];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
