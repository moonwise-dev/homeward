import 'package:a2ui_core/a2ui_core.dart';

import 'catalog_component.dart';
import 'components/fact.dart';
import 'functions/catalog_function.dart';

const homewardCatalogId =
    'https://moonwise.se/homeward/catalogs/v1/catalog.json';

const homewardComponents = <CatalogComponent>[Fact()];

const homewardFunctions = <CatalogFunction>[];

final homewardCatalog = Catalog<CatalogComponent>(
  id: homewardCatalogId,
  components: homewardComponents,
);
