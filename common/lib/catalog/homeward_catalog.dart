import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/choice.dart';
import 'components/fact.dart';
import 'components/monthly_cost_breakdown.dart';
import 'components/rule_note.dart';
import 'functions/catalog_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[
  Fact(),
  Choice(),
  AffordabilitySummary(),
  MonthlyCostBreakdown(),
  RuleNote(),
];

const homewardFunctions = <CatalogFunction>[];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
