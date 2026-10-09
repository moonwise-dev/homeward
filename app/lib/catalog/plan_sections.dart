import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genui/genui.dart';

import '../domain/models/plan_conversation.dart';
import '../ui/core/themes/colors.dart';
import '../ui/core/themes/dimens.dart';
import '../ui/core/themes/motion.dart';
import '../ui/core/themes/text_styles.dart';
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
          if (id == planMoreId)
            KeyedSubtree(
              key: const ValueKey(planMoreId),
              child: itemContext.buildChild(id),
            )
          else if (itemContext.getComponent(id)?.type case final type?
              when type != 'Divider')
            AppSurfaceEntry(
              key: ValueKey(id),
              child: _MarkedSection(
                sectionId: id,
                child: type == 'Card'
                    ? itemContext.buildChild(id)
                    : _Section(child: itemContext.buildChild(id)),
              ),
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
