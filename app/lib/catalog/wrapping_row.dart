import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../ui/core/themes/dimens.dart';

CatalogItem wrappingRow(CatalogItem row) => CatalogItem(
  name: row.name,
  dataSchema: row.dataSchema,
  exampleData: row.exampleData,
  isImplicitlyFlexible: row.isImplicitlyFlexible,
  widgetBuilder: (itemContext) {
    final data = itemContext.data as JsonMap;
    final children = data['children'];
    if (children is! List<Object?> ||
        children.any((id) => id is! String || _flexes(itemContext, id))) {
      return row.widgetBuilder(itemContext);
    }
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      alignment: switch (data['justify']) {
        'center' => WrapAlignment.center,
        'end' => WrapAlignment.end,
        'spaceBetween' => WrapAlignment.spaceBetween,
        'spaceAround' => WrapAlignment.spaceAround,
        'spaceEvenly' => WrapAlignment.spaceEvenly,
        _ => WrapAlignment.start,
      },
      crossAxisAlignment: switch (data['align']) {
        'center' => WrapCrossAlignment.center,
        'end' => WrapCrossAlignment.end,
        _ => WrapCrossAlignment.start,
      },
      children: [
        for (final id in children.cast<String>())
          itemContext.buildChild(id, itemContext.dataContext),
      ],
    );
  },
);

bool _flexes(CatalogItemContext itemContext, String id) {
  final component = itemContext.getComponent(id);
  return component?.properties['weight'] != null ||
      (itemContext
              .getCatalogItem(component?.type ?? '')
              ?.isImplicitlyFlexible ??
          false);
}
