import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/motion.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_pressable.dart';
import '../../ui/explore/explore_scope.dart';

class MustHaveView extends HookWidget {
  const MustHaveView({
    required this.rule,
    required this.label,
    this.fallback,
    super.key,
  });

  final MustHaveRule rule;
  final String label;
  final CityHomes? fallback;

  @override
  Widget build(BuildContext context) {
    final scope = ExploreScope.maybeOf(context);
    final local = useState(const Narrowing());
    final homes = scope?.homes ?? fallback;
    final narrowing = scope?.narrowing ?? local.value;
    final isOn = narrowing.mustHaves.contains(rule);
    final keeps = homes == null
        ? null
        : isOn
        ? homes.narrowed(narrowing).length
        : homes.keeps(narrowing, rule);
    void toggle() => scope == null
        ? local.value = local.value.toggled(rule)
        : scope.onToggle(rule);
    return MustHavePill(
      label: label,
      keeps: keeps,
      isOn: isOn,
      onTap: keeps == 0 && !isOn ? null : toggle,
    );
  }
}

class MustHavePill extends StatelessWidget {
  const MustHavePill({
    required this.label,
    required this.keeps,
    required this.isOn,
    required this.onTap,
    super.key,
  });

  final String label;
  final int? keeps;
  final bool isOn;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final ink = isOn ? colors.onAccent : colors.text;
    final keeps = this.keeps;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
      child: AppPressable(
        label: keeps == null ? label : '$label, keeps $keeps homes',
        isSelected: isOn,
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        child: AnimatedContainer(
          duration: AppMotion.of(context, AppMotion.surface),
          curve: AppMotion.curve,
          padding: const EdgeInsets.fromLTRB(10, 6, 6, 6),
          decoration: BoxDecoration(
            color: isOn ? colors.accent : colors.surface,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            border: Border.all(
              color: isOn ? colors.accent : colors.borderStrong,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Icon(
                isOn ? Icons.check_rounded : Icons.add_rounded,
                size: 16,
                color: ink,
              ),
              Text(label, style: styles.label.copyWith(color: ink)),
              if (keeps != null)
                AnimatedSwitcher(
                  duration: AppMotion.of(context, AppMotion.figure),
                  child: Container(
                    key: ValueKey(keeps),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: isOn
                          ? colors.onAccent.withValues(alpha: 0.18)
                          : colors.surfaceMuted,
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                    ),
                    child: Text(
                      '$keeps',
                      style: styles.label.copyWith(
                        color: isOn ? colors.onAccent : colors.textSecondary,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
