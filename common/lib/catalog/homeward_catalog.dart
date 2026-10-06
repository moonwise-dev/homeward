import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/brief.dart';
import 'components/buy_vs_rent.dart';
import 'components/choice.dart';
import 'components/down_payment_slider.dart';
import 'components/fact.dart';
import 'components/home_card.dart';
import 'components/home_comparison.dart';
import 'components/home_swipe.dart';
import 'components/household_summary.dart';
import 'components/listing_quote.dart';
import 'components/loan_balance_chart.dart';
import 'components/market_snapshot_card.dart';
import 'components/monthly_cost_breakdown.dart';
import 'components/money_input.dart';
import 'components/mortgage_options.dart';
import 'components/plan_overview.dart';
import 'components/purchase_costs_table.dart';
import 'components/questions.dart';
import 'components/rent_split.dart';
import 'components/route_summary.dart';
import 'components/rule_note.dart';
import 'components/savings_plan.dart';
import 'components/shortlist.dart';
import 'components/stress_test_chart.dart';
import 'components/week_map.dart';
import 'components/weekly_travel.dart';
import 'functions/catalog_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[
  PlanOverview(),
  Fact(),
  Brief(),
  Choice(),
  Questions(),
  HouseholdSummary(),
  MoneyInput(),
  AffordabilitySummary(),
  MonthlyCostBreakdown(),
  StressTestChart(),
  PurchaseCostsTable(),
  DownPaymentSlider(),
  MortgageOptions(),
  LoanBalanceChart(),
  SavingsPlan(),
  MarketSnapshotCard(),
  RentSplit(),
  BuyVsRent(),
  RuleNote(),
  HomeCard(),
  Shortlist(),
  HomeComparison(),
  HomeSwipe(),
  ListingQuote(),
  WeeklyTravel(),
  RouteSummary(),
  WeekMap(),
];

const homewardFunctions = <CatalogFunction>[];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
