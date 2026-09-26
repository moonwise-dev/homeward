import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';

class ReasonList extends StatelessWidget {
  const ReasonList({
    required this.title,
    required this.reasons,
    required this.description,
    super.key,
  });

  final String title;
  final List<Reason> reasons;
  final String description;

  @override
  Widget build(BuildContext context) {
    if (reasons.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.label.copyWith(fontWeight: FontWeight.w600),
          ),
          for (final reason in reasons)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: _ReasonRow(reason: reason, description: description),
            ),
        ],
      ),
    );
  }
}

class _ReasonRow extends StatelessWidget {
  const _ReasonRow({required this.reason, required this.description});

  final Reason reason;
  final String description;

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (reason.status) {
      FitStatus.fits => (AppColors.positive, Icons.check_circle_outline),
      FitStatus.close || FitStatus.unknown => (
        AppColors.warning,
        Icons.help_outline,
      ),
      FitStatus.misses => (AppColors.danger, Icons.cancel_outlined),
    };
    final quote = reason.quote;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 16, color: color),
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: reason.text, style: AppTextStyles.label),
                    TextSpan(
                      text: '  ${_sourceLabel(reason.source)}',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              if (quote != null)
                _QuoteExcerpt(description: description, quote: quote),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuoteExcerpt extends StatelessWidget {
  const _QuoteExcerpt({required this.description, required this.quote});

  final String description;
  final String quote;

  @override
  Widget build(BuildContext context) {
    final at = description.indexOf(quote);
    final start = at == -1 ? 0 : description.lastIndexOf('. ', at) + 1;
    final stop = at == -1 ? -1 : description.indexOf('. ', at + quote.length);
    final end = stop == -1 ? description.length : stop + 1;
    final style = AppTextStyles.caption.copyWith(
      color: AppColors.textSecondary,
      fontStyle: FontStyle.italic,
    );
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.xxs),
      padding: const EdgeInsets.only(left: AppSpacing.xs),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: AppColors.accent, width: 2)),
      ),
      child: Text.rich(
        at == -1
            ? TextSpan(text: '“$quote”', style: style)
            : TextSpan(
                style: style,
                children: [
                  TextSpan(
                    text: '“${description.substring(start, at).trim()} ',
                  ),
                  TextSpan(
                    text: quote,
                    style: style.copyWith(
                      color: AppColors.text,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      backgroundColor: AppColors.accentSoft,
                    ),
                  ),
                  TextSpan(
                    text: '${description.substring(at + quote.length, end)}”',
                  ),
                ],
              ),
      ),
    );
  }
}

String _sourceLabel(ReasonSource source) => switch (source) {
  ReasonSource.listing => 'From the listing',
  ReasonSource.measured => 'Measured',
  ReasonSource.buyer => 'You said',
};
