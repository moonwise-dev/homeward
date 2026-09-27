import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';

class FactView extends StatelessWidget {
  const FactView({required this.fact, this.onAnswer, super.key});

  final BriefItem fact;
  final void Function(bool right)? onAnswer;

  @override
  Widget build(BuildContext context) {
    final onAnswer = this.onAnswer;
    final assumed = fact.source == FactSource.deduced;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              _icon(fact.source),
              size: 18,
              color: assumed ? AppColors.accent : AppColors.textTertiary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fact.text, style: AppTextStyles.body),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  _sourceLine(fact),
                  style: AppTextStyles.caption.copyWith(
                    color: assumed ? AppColors.accent : null,
                  ),
                ),
                if (assumed && onAnswer != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Wrap(
                      spacing: AppSpacing.xs,
                      runSpacing: AppSpacing.xs,
                      children: [
                        _Answer(
                          label: 'Right',
                          icon: Icons.check,
                          onPressed: () => onAnswer(true),
                        ),
                        _Answer(
                          label: 'Not quite',
                          icon: Icons.edit_outlined,
                          onPressed: () => onAnswer(false),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static IconData _icon(FactSource source) => switch (source) {
    FactSource.said => Icons.chat_bubble_outline,
    FactSource.deduced => Icons.lightbulb_outline,
    FactSource.confirmed => Icons.check_circle_outline,
    FactSource.measured => Icons.straighten,
    FactSource.quoted => Icons.format_quote,
    FactSource.estimate => Icons.calculate_outlined,
  };

  static String _sourceLine(BriefItem fact) {
    final words = fact.words;
    final quoted = words == null ? '' : ' “$words”';
    return switch (fact.source) {
      FactSource.said => 'You said$quoted',
      FactSource.deduced => words == null ? 'Deduced' : 'Deduced from$quoted',
      FactSource.confirmed => 'You confirmed',
      FactSource.measured => 'Measured',
      FactSource.quoted => 'Quoted$quoted',
      FactSource.estimate => 'Estimate',
    };
  }
}

class _Answer extends StatelessWidget {
  const _Answer({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: onPressed,
    icon: Icon(icon, size: 16),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      textStyle: AppTextStyles.label,
    ),
  );
}
