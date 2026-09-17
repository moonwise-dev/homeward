import 'package:common/common.dart';
import 'package:genui/genui.dart';

import 'functions/catalog_client_function.dart';
import 'items/homeward_catalog_items.dart';

Catalog homewardGenuiCatalog() {
  final basic = BasicCatalogItems.asNoAssetCatalog();
  return Catalog(
    [
      for (final item in basic.items)
        if (agentVisibleBasicComponents.contains(item.name)) item,
      ...homewardCatalogItems,
    ],
    functions: [
      ...basic.functions,
      for (final function in homewardFunctions) CatalogClientFunction(function),
    ],
    catalogId: homewardCatalogId,
  );
}
