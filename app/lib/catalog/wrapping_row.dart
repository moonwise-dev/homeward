import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:flutter/widgets.dart';

import '../ui/core/themes/dimens.dart';

ComponentImplementation wrappingRow(ComponentImplementation row) =>
    ComponentImplementation(
      name: row.name,
      schema: row.schema,
      allowedParents: row.allowedParents,
      allowedChildren: row.allowedChildren,
      builder: (context, node, props, buildChild) {
        final children = props.children('children');
        if (children.isEmpty || children.any(_flexes)) {
          return row.builder(context, node, props, buildChild);
        }
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          alignment: switch (props.string('justify')) {
            'center' => WrapAlignment.center,
            'end' => WrapAlignment.end,
            'spaceBetween' => WrapAlignment.spaceBetween,
            'spaceAround' => WrapAlignment.spaceAround,
            'spaceEvenly' => WrapAlignment.spaceEvenly,
            _ => WrapAlignment.start,
          },
          crossAxisAlignment: switch (props.string('align')) {
            'center' => WrapCrossAlignment.center,
            'end' => WrapCrossAlignment.end,
            _ => WrapCrossAlignment.start,
          },
          children: [
            for (final child in children)
              if (!child.isPlaceholder) buildChild(child),
          ],
        );
      },
    );

bool _flexes(ComponentNode<ComponentImplementation> child) =>
    ComponentProps(child.props.peek()).value('weight') != null;
