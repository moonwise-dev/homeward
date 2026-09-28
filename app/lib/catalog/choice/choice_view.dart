import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';

typedef ChoiceOption = ({String label, String? detail});

class ChoiceView extends HookWidget {
  const ChoiceView({
    required this.question,
    required this.options,
    required this.onChoose,
    this.recommended,
    this.because,
    super.key,
  });

  final String question;
  final List<ChoiceOption> options;
  final String? recommended;
  final String? because;
  final ValueChanged<String> onChoose;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final chosen = useState<String?>(null);
    final ordered = [
      ...options.where((option) => option.label == recommended),
      ...options.where((option) => option.label != recommended),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: styles.title),
        const SizedBox(height: AppSpacing.md),
        for (final option in ordered)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: _Option(
              option: option,
              because: option.label == recommended ? because : null,
              recommended: option.label == recommended,
              chosen: chosen.value == option.label,
              faded: chosen.value != null && chosen.value != option.label,
              onTap: chosen.value == null
                  ? () {
                      chosen.value = option.label;
                      onChoose(option.label);
                    }
                  : null,
            ),
          ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Or tell Homeward in your own words below.',
          style: styles.caption,
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.option,
    required this.recommended,
    required this.chosen,
    required this.faded,
    required this.onTap,
    this.because,
  });

  final ChoiceOption option;
  final String? because;
  final bool recommended;
  final bool chosen;
  final bool faded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final detail = option.detail;
    final because = this.because;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.md),
      side: BorderSide(
        color: chosen || recommended ? colors.accent : colors.border,
        width: chosen ? 2 : 1,
      ),
    );
    return AnimatedOpacity(
      opacity: faded ? 0.5 : 1,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: chosen ? colors.accentSoft : colors.surface,
        shape: shape,
        child: InkWell(
          customBorder: shape,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.label,
                        style: styles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (detail != null)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.xxs),
                          child: Text(detail, style: styles.label),
                        ),
                      if (because != null)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.xs),
                          child: Text(
                            because,
                            style: styles.caption.copyWith(
                              color: colors.accent,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (chosen)
                  Icon(Icons.check_circle, color: colors.accent)
                else if (recommended)
                  const _RecommendedTag(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecommendedTag extends StatelessWidget {
  const _RecommendedTag();

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.accentSoft,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xxs,
        ),
        child: Text(
          'Recommended',
          style: styles.caption.copyWith(color: colors.accent),
        ),
      ),
    );
  }
}
