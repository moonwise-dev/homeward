import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';
import 'app_pressable.dart';

class AppOptionPills extends StatelessWidget {
  const AppOptionPills({
    required this.labels,
    required this.selected,
    required this.onSelect,
    this.enabled = true,
    super.key,
  });

  final List<String> labels;
  final String? selected;
  final ValueChanged<String> onSelect;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        for (final label in labels)
          AppPressable(
            label: label,
            isSelected: label == selected,
            color: label == selected ? colors.brand : colors.surfaceMuted,
            borderRadius: BorderRadius.circular(AppRadii.pill),
            onTap: enabled ? () => onSelect(label) : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm - 2,
              ),
              child: Text(
                label,
                style: styles.label.copyWith(
                  fontSize: 15,
                  color: label == selected ? colors.onBrand : colors.text,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class AppOptionTile extends StatelessWidget {
  const AppOptionTile({
    required this.title,
    required this.onTap,
    this.detail,
    this.icon,
    this.isSelected = false,
    this.trailing,
    super.key,
  });

  final String title;
  final String? detail;
  final IconData? icon;
  final bool isSelected;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final ink = isSelected ? colors.onBrand : colors.text;
    final icon = this.icon;
    final detail = this.detail;
    final trailing = this.trailing;
    return AppPressable(
      label: title,
      isSelected: isSelected,
      color: isSelected ? colors.brand : colors.surfaceMuted,
      borderRadius: BorderRadius.circular(AppRadii.xl),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md + 2),
        child: Row(
          spacing: AppSpacing.sm,
          children: [
            if (icon != null)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected
                      ? colors.onBrand.withValues(alpha: 0.12)
                      : colors.surface,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xs + 2),
                  child: Icon(icon, size: 22, color: ink),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: styles.title.copyWith(fontSize: 17, color: ink),
                  ),
                  if (detail != null)
                    Text(
                      detail,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: styles.caption.copyWith(
                        color: isSelected
                            ? colors.onBrand.withValues(alpha: 0.8)
                            : colors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
