import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/themes/text_styles.dart';

typedef StarterPrompt = ({String title, String message});

const starterPrompts = <StarterPrompt>[
  (
    title: 'Can we afford it here?',
    message:
        "We're moving to Stockholm for my job. I'll earn 55,000 kronor a "
        'month before tax, and my partner keeps her remote job paying 3,500 '
        'euros a month. We have 600,000 kronor saved.',
  ),
  (
    title: 'Is this one worth it?',
    message:
        "We're looking at flats in Stockholm. We take home 62,000 kronor a "
        'month together, 85,000 before tax, no debts, and have 900,000 '
        "kronor saved. We're both 34, two adults, no kids. We like the look "
        'of the loft-style flat by the lake in Nacka. What would it cost us '
        'each month, what do we pay on the day, and is buying it better '
        'than renting something like it?',
  ),
  (
    title: 'Sharing in Lisbon',
    message:
        'Me and a friend are moving to Lisbon to share a rented flat. '
        "I'll be at a startup in Beato most days, she works shifts at Santa "
        'Maria hospital. I take home 2,400 euros a month and she takes home '
        '1,800. Show us some two-bedroom flats.',
  ),
];

class StarterPrompts extends StatelessWidget {
  const StarterPrompts({required this.onSend, super.key});

  final ValueChanged<String> onSend;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: AppSpacing.xs,
    children: [
      for (final prompt in starterPrompts)
        _StarterCard(prompt: prompt, onPressed: () => onSend(prompt.message)),
    ],
  );
}

class _StarterCard extends StatelessWidget {
  const _StarterCard({required this.prompt, required this.onPressed});

  final StarterPrompt prompt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Semantics(
      button: true,
      label: 'Start with: ${prompt.title}',
      excludeSemantics: true,
      child: Material(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          side: BorderSide(color: colors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              spacing: AppSpacing.sm,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacing.xxs,
                    children: [
                      Text(prompt.title, style: styles.label),
                      Text(
                        prompt.message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: styles.caption.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_upward, size: 18, color: colors.accent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
