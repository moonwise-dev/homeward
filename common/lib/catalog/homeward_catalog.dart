import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/affordability_summary.dart';
import 'components/amount_slider.dart';
import 'components/household_input.dart';
import 'components/location_picker.dart';
import 'components/money_input.dart';
import 'components/payment_breakdown.dart';
import 'functions/catalog_function.dart';
import 'functions/monthly_payment_function.dart';
import 'functions/within_max_ltv_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[
  LocationPicker(),
  MoneyInput(),
  HouseholdInput(),
  AmountSlider(),
  AffordabilitySummary(),
  PaymentBreakdown(),
];

const homewardFunctions = <CatalogFunction>[
  MonthlyPaymentFunction(),
  WithinMaxLtvFunction(),
];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
