import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../ui/core/themes/colors.dart';
import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/motion.dart';
import '../ui/core/ui/app_surface_entry.dart';
import 'plan_areas.dart';
import 'waiting_chips.dart';

const _rootId = 'root';

ComponentImplementation asPlanSections(ComponentImplementation item) =>
    ComponentImplementation(
      name: item.name,
      schema: item.schema,
      allowedParents: item.allowedParents,
      allowedChildren: item.allowedChildren,
      builder: (context, node, props, buildChild) {
        if (node.context?.surface.id != planSurfaceId ||
            node.componentId != _rootId) {
          return item.builder(context, node, props, buildChild);
        }
        if (item.name != 'Column') {
          return _Section(
            child: item.builder(context, node, props, buildChild),
          );
        }
        final filter = PlanSectionFilter.maybeOf(context);
        final children = [
          for (final child in props.children('children'))
            if (!child.isPlaceholder && child.type != 'Divider') child,
        ];
        if (filter == null) {
          return _Sections(
            children: [
              for (final child in children)
                if (child.componentId == planMoreId)
                  KeyedSubtree(
                    key: const ValueKey(planMoreId),
                    child: buildChild(child),
                  )
                else
                  _marked(child, buildChild),
            ],
          );
        }
        final shown = [
          for (final child in children)
            if (child.componentId != planMoreId &&
                filter.shows(child.componentId))
              child,
        ];
        final waiting = [
          if (filter.showsWaiting)
            for (final more in children)
              if (more.componentId == planMoreId)
                for (final card in waitingCardsIn(more))
                  if (filter.waits(card.type)) card,
        ];
        if (shown.isEmpty && waiting.isEmpty) {
          return const SizedBox.shrink();
        }
        return _Sections(
          children: [
            for (final child in shown) _marked(child, buildChild),
            if (waiting.isNotEmpty)
              WaitingTiles(key: const ValueKey(planMoreId), cards: waiting),
          ],
        );
      },
    );

Widget _marked(
  ComponentNode<ComponentImplementation> child,
  ChildWidgetBuilder buildChild,
) => AppSurfaceEntry(
  key: ValueKey(child.componentId),
  child: child.type == 'Card'
      ? buildChild(child)
      : _Section(child: buildChild(child)),
);

class _Sections extends StatelessWidget {
  const _Sections({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, child) in children.indexed) ...[
          if (index > 0)
            Divider(height: AppSpacing.xl * 1.5, color: colors.border),
          child,
        ],
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => AnimatedSize(
    duration: AppMotion.of(context, AppMotion.surface),
    curve: AppMotion.curve,
    alignment: Alignment.topCenter,
    child: SizedBox(width: double.infinity, child: child),
  );
}
