import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/buy_vs_rent.dart';
import 'components/choice.dart';
import 'components/down_payment_slider.dart';
import 'components/fact.dart';
import 'components/home_card.dart';
import 'components/home_comparison.dart';
import 'components/listing_quote.dart';
import 'components/monthly_cost_breakdown.dart';
import 'components/mortgage_options.dart';
import 'components/purchase_costs_table.dart';
import 'components/rent_split.dart';
import 'components/route_summary.dart';
import 'components/rule_note.dart';
import 'components/shortlist.dart';
import 'components/stress_test_chart.dart';
import 'components/weekly_travel.dart';
import 'functions/catalog_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[
  Fact(),
  Choice(),
  AffordabilitySummary(),
  MonthlyCostBreakdown(),
  StressTestChart(),
  PurchaseCostsTable(),
  DownPaymentSlider(),
  MortgageOptions(),
  RentSplit(),
  BuyVsRent(),
  RuleNote(),
  HomeCard(),
  Shortlist(),
  HomeComparison(),
  ListingQuote(),
  WeeklyTravel(),
  RouteSummary(),
];

const homewardFunctions = <CatalogFunction>[];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
