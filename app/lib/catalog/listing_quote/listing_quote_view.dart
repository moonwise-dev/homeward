import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';

class ListingQuoteView extends StatelessWidget {
  const ListingQuoteView({required this.reading, super.key});

  final ListingReading reading;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What the listing says', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(reading.homeName, style: styles.title),
        const SizedBox(height: AppSpacing.sm),
        for (final need in reading.readings) _Need(reading: need),
        const SizedBox(height: AppSpacing.sm),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surfaceMuted,
            borderRadius: BorderRadius.circular(AppRadii.md),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text.rich(
              TextSpan(
                style: styles.body,
                children: _spans(reading, colors),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          "The sample listing's own words; each highlighted part is quoted word "
          "for word. Says nothing means the listing doesn't mention it: ask, or "
          'check at a viewing.',
          style: styles.caption,
        ),
      ],
    );
  }

  static List<TextSpan> _spans(ListingReading reading, AppColors colors) {
    final text = reading.description;
    final marks = <({int start, int end, ReadVerdict verdict})>[
      for (final need in reading.readings)
        if (need.quote case final quote?)
          if (text.indexOf(quote) case final start when start >= 0)
            (start: start, end: start + quote.length, verdict: need.verdict),
    ]..sort((a, b) => a.start.compareTo(b.start));
    final spans = <TextSpan>[];
    var at = 0;
    for (final mark in marks) {
      if (mark.start < at) {
        continue;
      }
      spans
        ..add(TextSpan(text: text.substring(at, mark.start)))
        ..add(
          TextSpan(
            text: text.substring(mark.start, mark.end),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: _colorOf(mark.verdict, colors),
              backgroundColor: _colorOf(
                mark.verdict,
                colors,
              ).withValues(alpha: 0.12),
            ),
          ),
        );
      at = mark.end;
    }
    spans.add(TextSpan(text: text.substring(at)));
    return spans;
  }
}

class _Need extends StatelessWidget {
  const _Need({required this.reading});

  final NeedReading reading;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final color = _colorOf(reading.verdict, AppColors.of(context));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
      child: Row(
        children: [
          Icon(
            switch (reading.verdict) {
              ReadVerdict.meets => Icons.check_circle_outline,
              ReadVerdict.fails => Icons.cancel_outlined,
              ReadVerdict.silent => Icons.help_outline,
            },
            size: 20,
            color: color,
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(child: Text(reading.label, style: styles.body)),
          Text(switch (reading.verdict) {
            ReadVerdict.meets => 'Has it',
            ReadVerdict.fails => 'Rules it out',
            ReadVerdict.silent => 'Says nothing',
          }, style: styles.label.copyWith(color: color)),
        ],
      ),
    );
  }
}

Color _colorOf(ReadVerdict verdict, AppColors colors) => switch (verdict) {
  ReadVerdict.meets => colors.positive,
  ReadVerdict.fails => colors.danger,
  ReadVerdict.silent => colors.textTertiary,
};
