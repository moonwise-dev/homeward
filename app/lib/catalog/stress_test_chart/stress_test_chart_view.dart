import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_source_note.dart';
import '../../ui/core/ui/app_stat_tiles.dart';
import '../../ui/core/ui/app_status_chip.dart';
import '../../ui/core/ui/app_line_chart.dart';
import '../money_text.dart';

class StressTestChartView extends StatelessWidget {
  const StressTestChartView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final curve = slice.stress;
    if (curve == null) {
      return const SizedBox.shrink();
    }
    final limit = curve.limit;
    final limitKind = curve.limitKind;
    final today = curve.points.first.cost;
    final stressed = _costAt(curve, curve.stressRate);
    final withinLimit = limit == null || stressed <= limit;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBlockTitle(
          title: 'If rates rise',
          status: AppStatusChip(
            label: withinLimit
                ? 'Holds at ${percentText(curve.stressRate)}'
                : 'Too much at ${percentText(curve.stressRate)}',
            tone: withinLimit ? AppTone.positive : AppTone.danger,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppLineChart(
          summary: [
            'The monthly cost goes from ${moneyText(today)} at '
                '${percentText(curve.todayRate)} to ${moneyText(stressed)} at '
                '${percentText(curve.stressRate)}',
            if (limit != null)
              'against the most you can carry, ${moneyText(limit)}',
          ].join(', '),
          points: [
            for (final point in curve.points)
              ChartPoint(
                x: point.annualRate.fraction,
                y: majorUnits(point.cost),
              ),
          ],
          markers: [
            ChartMarker(
              x: curve.todayRate.fraction,
              label: 'Today ${percentText(curve.todayRate)}',
              color: colors.accent,
            ),
            if (curve.stressRate > curve.todayRate)
              ChartMarker(
                x: curve.stressRate.fraction,
                label: 'Tested at ${percentText(curve.stressRate)}',
                color: colors.warning,
              ),
          ],
          limit: limit == null ? null : majorUnits(limit),
          limitLabel: limit == null ? null : 'Most you can carry',
        ),
        const SizedBox(height: AppSpacing.md),
        AppStatTiles(
          stats: [
            appStat('A month today', moneyText(today)),
            appStat(
              'A month at ${percentText(curve.stressRate)}',
              moneyText(stressed),
              color: withinLimit ? null : colors.danger,
            ),
            if (limit != null) appStat('Most you can carry', moneyText(limit)),
          ],
        ),
        if (limit != null && limitKind != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(
              'Set by the ${ruleLabel(limitKind).toLowerCase()}. '
              '${withinLimit ? 'The tested rate stays inside it.' : 'The tested rate goes past it.'}',
              style: styles.caption,
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        AppSourceNote(
          lines: [
            [
              if (curve.afterDeduction) 'After the interest deduction.',
              'Loan payments only. Sample rules and rates for '
                  '${slice.marketName}. An estimate, not advice.',
            ].join(' '),
          ],
        ),
      ],
    );
  }

  Money _costAt(StressCurve curve, Rate rate) => curve.points
      .reduce(
        (closest, point) =>
            (point.annualRate.partsPerMillion - rate.partsPerMillion).abs() <
                (closest.annualRate.partsPerMillion - rate.partsPerMillion)
                    .abs()
            ? point
            : closest,
      )
      .cost;
}
