import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

enum AppTone { positive, warning, danger, info, neutral }

class AppStatusChip extends StatelessWidget {
  const AppStatusChip({required this.label, required this.tone, super.key});

  final String label;
  final AppTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final (fill, ink) = switch (tone) {
      AppTone.positive => (colors.brand, colors.onBrand),
      AppTone.warning || AppTone.danger => (colors.alert, colors.onAlert),
      AppTone.info || AppTone.neutral => (
        colors.surfaceMuted,
        toneColor(colors, tone),
      ),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm - 2,
          vertical: AppSpacing.xxs + 1,
        ),
        child: Text(
          label,
          style: styles.caption.copyWith(
            color: ink,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

Color toneColor(AppColors colors, AppTone tone) => switch (tone) {
  AppTone.positive => colors.positive,
  AppTone.warning => colors.warning,
  AppTone.danger => colors.danger,
  AppTone.info => colors.info,
  AppTone.neutral => colors.textSecondary,
};

class AppBlockTitle extends StatelessWidget {
  const AppBlockTitle({required this.title, this.status, super.key});

  final String title;
  final Widget? status;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.sm,
      children: [
        Expanded(child: Text(title, style: styles.title)),
        ?status,
      ],
    );
  }
}
