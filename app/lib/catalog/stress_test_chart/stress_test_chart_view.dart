import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/formats.dart';
import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_line_chart.dart';
import '../../ui/core/ui/app_section_title.dart';
import '../finance_labels.dart';

class StressTestChartView extends StatelessWidget {
  const StressTestChartView({
    required this.curve,
    required this.locale,
    this.onExplain,
    super.key,
  });

  final StressCurve curve;
  final LocaleTag locale;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) {
    final limit = curve.limit;
    final stressed = _costAt(curve.stressRate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionTitle(title: 'If rates rise', onExplain: onExplain),
        const SizedBox(height: AppSpacing.xs),
        AppLineChart(
          summary: _summary(stressed, limit),
          points: [
            for (final point in curve.points)
              ChartPoint(
                x: point.annualRate.fraction,
                y: majorUnitsOf(point.cost),
              ),
          ],
          markers: [
            ChartMarker(
              x: curve.todayRate.fraction,
              label: 'Today ${formatRate(curve.todayRate)}',
              color: AppColors.accent,
            ),
            if (curve.stressRate > curve.todayRate)
              ChartMarker(
                x: curve.stressRate.fraction,
                label: 'Tested at ${formatRate(curve.stressRate)}',
                color: AppColors.warning,
              ),
          ],
          limit: limit == null ? null : majorUnitsOf(limit),
          limitLabel: limit == null ? null : 'Most you can pay',
        ),
        const SizedBox(height: AppSpacing.sm),
        AppFigureRow.amount(
          label: 'A month today',
          amount: curve.points.first.cost,
          locale: locale,
        ),
        AppFigureRow.amount(
          label: 'A month at ${formatRate(curve.stressRate)}',
          amount: stressed,
          locale: locale,
        ),
        if (limit != null) ...[
          AppFigureRow.amount(
            label: 'Most you can pay a month',
            amount: limit,
            locale: locale,
            color: stressed <= limit ? AppColors.text : AppColors.danger,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Set by the ${constraintKindLabel(curve.limitKind!)}. '
            '${stressed <= limit ? 'The tested rate stays inside it.' : 'The tested rate goes past it.'}',
            style: AppTextStyles.caption,
          ),
        ],
        if (curve.afterDeduction)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(
              'Costs are after the interest deduction.',
              style: AppTextStyles.caption,
            ),
          ),
      ],
    );
  }

  String _summary(Money stressed, Money? limit) => [
    'Monthly cost from ${formatMoney(curve.points.first.cost, locale)} at '
        '${formatRate(curve.todayRate)} to ${formatMoney(stressed, locale)} at '
        '${formatRate(curve.stressRate)}',
    if (limit != null) 'with a limit of ${formatMoney(limit, locale)} a month',
  ].join(', ');

  Money _costAt(Rate rate) => curve.points
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
