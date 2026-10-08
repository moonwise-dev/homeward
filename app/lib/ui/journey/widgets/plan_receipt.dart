import 'package:flutter/material.dart';

import '../../../catalog/plan_section_labels.dart';
import '../../../domain/models/plan_conversation.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

class PlanReceipt extends StatelessWidget {
  const PlanReceipt({required this.changes, required this.onShow, super.key});

  final List<PlanChange> changes;
  final ValueChanged<String> onShow;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final chips = <String, PlanChange>{};
    for (final change in [
      ...changes.where((change) => change.isNew),
      ...changes.where((change) => !change.isNew),
    ]) {
      chips.putIfAbsent(planSectionLabel(change.type), () => change);
    }
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          'On your plan',
          style: styles.caption.copyWith(color: colors.textTertiary),
        ),
        for (final MapEntry(key: label, value: change) in chips.entries)
          _ChangeChip(
            label: label,
            isNew: change.isNew,
            onPressed: () => onShow(change.sectionId),
          ),
      ],
    );
  }
}

class _ChangeChip extends StatelessWidget {
  const _ChangeChip({
    required this.label,
    required this.isNew,
    required this.onPressed,
  });

  final String label;
  final bool isNew;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final kind = isNew ? 'New' : 'Updated';
    return Semantics(
      button: true,
      label: '$kind on your plan: $label',
      excludeSemantics: true,
      child: Tooltip(
        message: 'Show on the plan',
        child: Material(
          color: isNew ? colors.accentSoft : colors.surface,
          shape: StadiumBorder(
            side: BorderSide(color: isNew ? colors.accent : colors.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs + 2,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSpacing.xxs,
                children: [
                  Icon(
                    isNew ? Icons.add : Icons.sync,
                    size: 14,
                    color: isNew ? colors.accent : colors.textSecondary,
                  ),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: styles.caption.copyWith(
                        color: isNew ? colors.accent : colors.text,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
