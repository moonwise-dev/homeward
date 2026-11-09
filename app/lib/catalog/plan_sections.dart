import 'dart:async';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';
import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../domain/models/plan_conversation.dart';
import '../ui/core/themes/colors.dart';
import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/motion.dart';
import '../ui/core/themes/text_styles.dart';
import '../ui/core/ui/app_card.dart';
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
        final area = PlanAreaScope.maybeOf(context);
        final children = [
          for (final child in props.children('children'))
            if (!child.isPlaceholder && child.type != 'Divider') child,
        ];
        if (area == null) {
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
                PlanArea.of(child.type) == area)
              child,
        ];
        final waiting = [
          for (final more in children)
            if (more.componentId == planMoreId)
              for (final card in waitingCardsIn(more))
                if (PlanArea.of(card.type) == area) card,
        ];
        return _Sections(
          children: [
            for (final child in shown) _marked(child, buildChild),
            if (shown.isEmpty) _AreaEmpty(area: area),
            if (waiting.isNotEmpty)
              WaitingChips(key: const ValueKey(planMoreId), cards: waiting),
          ],
        );
      },
    );

Widget _marked(
  ComponentNode<ComponentImplementation> child,
  ChildWidgetBuilder buildChild,
) => AppSurfaceEntry(
  key: ValueKey(child.componentId),
  child: _MarkedSection(
    sectionId: child.componentId,
    child: child.type == 'Card'
        ? buildChild(child)
        : _Section(child: buildChild(child)),
  ),
);

class _Sections extends StatelessWidget {
  const _Sections({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: AppSpacing.md,
    children: children,
  );
}

class _AreaEmpty extends StatelessWidget {
  const _AreaEmpty({required this.area});

  final PlanArea area;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        spacing: AppSpacing.xs,
        children: [
          Icon(area.icon, color: colors.textTertiary, size: 32),
          Text(
            area.empty,
            style: styles.body.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
          Text(
            'Ask the assistant, and it appears here.',
            style: styles.caption.copyWith(color: colors.textTertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

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

class PlanMarks extends InheritedWidget {
  const PlanMarks({
    required this.changes,
    required this.focus,
    required super.child,
    super.key,
  });

  final List<PlanChange> changes;
  final ValueNotifier<String?> focus;

  static PlanMarks? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PlanMarks>();

  @override
  bool updateShouldNotify(PlanMarks oldWidget) =>
      !listEquals(changes, oldWidget.changes) || focus != oldWidget.focus;
}

class _MarkedSection extends HookWidget {
  const _MarkedSection({required this.sectionId, required this.child});

  final String sectionId;
  final Widget child;

  static const _wash = Duration(milliseconds: 1200);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final marks = PlanMarks.maybeOf(context);
    final focus = marks?.focus;
    final change = marks?.changes
        .where((change) => change.sectionId == sectionId)
        .firstOrNull;
    final wash = useAnimationController(duration: _wash, initialValue: 1);
    useEffect(() {
      if (focus == null) {
        return null;
      }
      Future<void> show() async {
        if (!context.mounted || focus.value != sectionId) {
          return;
        }
        focus.value = null;
        if (!_startsInUpperHalf(context)) {
          await Scrollable.ensureVisible(
            context,
            alignment: 0.04,
            duration: AppMotion.of(context, AppMotion.page),
            curve: AppMotion.curve,
          );
        }
        if (context.mounted) {
          wash
            ..duration = AppMotion.of(context, _wash)
            ..forward(from: 0);
        }
      }

      final settled = Timer(AppMotion.surface, show);
      focus.addListener(show);
      return () {
        settled.cancel();
        focus.removeListener(show);
      };
    }, [focus]);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedBuilder(
          animation: wash,
          child: child,
          builder: (context, child) {
            final strength = 1 - wash.value;
            return DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                color: colors.accent.withValues(alpha: 0.22 * strength),
                borderRadius: BorderRadius.circular(AppRadii.md),
                border: Border.all(
                  color: colors.accent.withValues(
                    alpha: change == null ? strength : 1,
                  ),
                ),
              ),
              child: child,
            );
          },
        ),
        if (change != null)
          Positioned(
            top: -AppSpacing.sm,
            left: AppSpacing.sm,
            child: _Mark(text: change.isNew ? 'New' : 'Updated'),
          ),
      ],
    );
  }
}

bool _startsInUpperHalf(BuildContext context) {
  final section = context.findRenderObject();
  final viewport = Scrollable.maybeOf(context)?.context.findRenderObject();
  if (section is! RenderBox || viewport is! RenderBox) {
    return false;
  }
  final top = section.localToGlobal(Offset.zero, ancestor: viewport).dy;
  return top >= 0 && top < viewport.size.height / 2;
}

class _Mark extends StatelessWidget {
  const _Mark({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.accent,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs,
        ),
        child: Text(
          text,
          style: styles.caption.copyWith(color: colors.onAccent),
        ),
      ),
    );
  }
}
