import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/choice.dart';
import 'components/fact.dart';
import 'components/monthly_cost_breakdown.dart';
import 'components/purchase_costs_table.dart';
import 'components/rule_note.dart';
import 'components/stress_test_chart.dart';
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
  RuleNote(),
];

const homewardFunctions = <CatalogFunction>[];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
