import 'package:common/common.dart';
import 'package:genui/genui.dart';

import 'affordability_summary/affordability_summary_item.dart';
import 'choice/choice_item.dart';
import 'client_functions.dart';
import 'fact/fact_item.dart';
import 'rule_note/rule_note_item.dart';

Catalog homewardGenuiCatalog() {
  final basic = BasicCatalogItems.asNoAssetCatalog();
  return Catalog(
    [
      for (final item in basic.items)
        if (agentVisibleBasicComponents.contains(item.name)) item,
      factItem,
      choiceItem,
      affordabilitySummaryItem,
      ruleNoteItem,
    ],
    functions: [
      ...basic.functions,
      for (final function in homewardFunctions) CatalogClientFunction(function),
    ],
    catalogId: homewardCatalogId,
  );
}
