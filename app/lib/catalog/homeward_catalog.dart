import 'package:common/common.dart';
import 'package:genui/genui.dart';

import 'client_functions.dart';

Catalog homewardGenuiCatalog() {
  final basic = BasicCatalogItems.asNoAssetCatalog();
  return Catalog(
    [
      for (final item in basic.items)
        if (agentVisibleBasicComponents.contains(item.name)) item,
    ],
    functions: [
      ...basic.functions,
      for (final function in homewardFunctions) CatalogClientFunction(function),
    ],
    catalogId: homewardCatalogId,
  );
}
