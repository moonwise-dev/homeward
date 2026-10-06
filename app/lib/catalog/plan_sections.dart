import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/motion.dart';
import '../ui/core/ui/app_card.dart';
import '../ui/core/ui/app_surface_entry.dart';

const _rootId = 'root';

CatalogItem asPlanSections(CatalogItem item) => CatalogItem(
  name: item.name,
  dataSchema: item.dataSchema,
  exampleData: item.exampleData,
  isImplicitlyFlexible: item.isImplicitlyFlexible,
  widgetBuilder: (itemContext) {
    if (itemContext.surfaceId != planSurfaceId || itemContext.id != _rootId) {
      return item.widgetBuilder(itemContext);
    }
    final sections = switch (itemContext.data) {
      {'children': final List<Object?> ids} when item.name == 'Column' => [
        for (final id in ids)
          if (id is String) id,
      ],
      _ => null,
    };
    if (sections == null) {
      return _Section(child: item.widgetBuilder(itemContext));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.md,
      children: [
        for (final id in sections)
          if (itemContext.getComponent(id)?.type case final type?
              when type != 'Divider')
            AppSurfaceEntry(
              key: ValueKey(id),
              child: type == 'Card'
                  ? itemContext.buildChild(id)
                  : _Section(child: itemContext.buildChild(id)),
            ),
      ],
    );
  },
);

class _Section extends StatelessWidget {
  const _Section({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => AppCard(
    child: AnimatedSize(
      duration: AppMotion.of(context, AppMotion.surface),
      curve: AppMotion.curve,
      alignment: Alignment.topCenter,
      child: SizedBox(width: double.infinity, child: child),
    ),
  );
}
