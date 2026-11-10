import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/text_styles.dart';

typedef AppStat = ({String label, String figure, String? note, Color? color});

AppStat appStat(String label, String figure, {String? note, Color? color}) =>
    (label: label, figure: figure, note: note, color: color);

class AppStatTiles extends StatelessWidget {
  const AppStatTiles({required this.stats, this.filled = true, super.key});

  final List<AppStat> stats;
  final bool filled;

  static const _minTileWidth = 140.0;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = (constraints.maxWidth / _minTileWidth).floor().clamp(
        1,
        stats.length.clamp(1, 4),
      );
      final width =
          (constraints.maxWidth - AppSpacing.xs * (columns - 1)) / columns;
      return Wrap(
        spacing: AppSpacing.xs,
        runSpacing: AppSpacing.xs,
        children: [
          for (final stat in stats)
            SizedBox(
              width: width,
              child: _StatTile(stat: stat, filled: filled),
            ),
        ],
      );
    },
  );
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat, required this.filled});

  final AppStat stat;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: filled ? colors.surfaceMuted : colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: filled ? null : Border.all(color: colors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.xxs,
          children: [
            Text(
              stat.label,
              style: styles.caption.copyWith(color: colors.textSecondary),
              maxLines: 2,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                stat.figure,
                style: styles.figure.copyWith(
                  color: stat.color ?? colors.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (stat.note case final note?)
              Text(
                note,
                style: styles.caption.copyWith(color: colors.textTertiary),
              ),
          ],
        ),
      ),
    );
  }
}
