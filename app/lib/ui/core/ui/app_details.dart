import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/motion.dart';
import '../themes/text_styles.dart';

class AppDetails extends HookWidget {
  const AppDetails({
    required this.child,
    this.label = 'Show the breakdown',
    this.openLabel = 'Hide the breakdown',
    super.key,
  });

  final Widget child;
  final String label;
  final String openLabel;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final open = useState(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppRadii.sm),
          onTap: () => open.value = !open.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: Row(
              spacing: AppSpacing.xxs,
              children: [
                AnimatedRotation(
                  turns: open.value ? 0.25 : 0,
                  duration: AppMotion.of(context, AppMotion.surface),
                  child: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: colors.accent,
                  ),
                ),
                Text(
                  open.value ? openLabel : label,
                  style: styles.label.copyWith(color: colors.accent),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: AppMotion.of(context, AppMotion.surface),
          curve: AppMotion.curve,
          alignment: Alignment.topCenter,
          child: open.value ? child : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
