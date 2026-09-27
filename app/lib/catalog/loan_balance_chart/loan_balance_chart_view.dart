import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_chart_key.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_line_chart.dart';
import '../money_text.dart';

class LoanBalanceChartView extends HookWidget {
  const LoanBalanceChartView({
    required this.slice,
    required this.schedule,
    super.key,
  });

  final AffordabilitySlice slice;
  final LoanSchedule schedule;

  @override
  Widget build(BuildContext context) {
    final last = schedule.years.last.year;
    final start = min(assumedStayYears, last);
    final year = useState(start);
    useEffect(() {
      year.value = start;
      return null;
    }, [schedule]);
    final at = schedule.at(year.value);
    final first = schedule.years.first;
    final end = schedule.years.last;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your loan year by year', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          '${slice.homeName ?? 'A home at ${moneyText(slice.price)}'}: a loan '
          'of ${moneyText(slice.loan)} at ${percentText(slice.annualRate)}, '
          '${repaymentText(slice)}.',
          style: AppTextStyles.body,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppLineChart(
          summary:
              'Over ${yearsText(last)}, what you owe falls from '
              '${moneyText(first.balance)} to ${moneyText(end.balance)}, and '
              'what you own of the home rises from ${moneyText(first.equity)} '
              'to ${moneyText(end.equity)}.',
          points: [
            for (final point in schedule.years)
              ChartPoint(x: point.year.toDouble(), y: majorUnits(point.equity)),
          ],
          comparison: [
            for (final point in schedule.years)
              ChartPoint(
                x: point.year.toDouble(),
                y: majorUnits(point.balance),
              ),
          ],
          markers: [
            ChartMarker(
              x: year.value.toDouble(),
              label: yearsText(year.value),
              color: AppColors.accent,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        const Row(
          children: [
            AppChartKey(label: 'What you own', color: AppColors.accent),
            SizedBox(width: AppSpacing.md),
            AppChartKey(label: 'What you owe', color: AppColors.warning),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'After ${yearsText(year.value)}',
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
        Slider(
          value: year.value.toDouble(),
          min: 1,
          max: last.toDouble(),
          divisions: last - 1,
          semanticFormatterCallback: (value) => yearsText(value.round()),
          onChanged: (value) => year.value = value.round(),
        ),
        AppFigureRow(
          label: 'What you still owe',
          figure: moneyText(at.balance),
        ),
        AppFigureRow(
          label: 'What you own of the home',
          figure: moneyText(at.equity),
        ),
        Text(
          "The down payment and the loan paid off, at today's price.",
          style: AppTextStyles.caption,
        ),
        AppFigureRow(
          label: 'Interest paid by then',
          figure: moneyText(at.interestPaid),
        ),
        if (slice.monthly.afterDeduction != null)
          Text('After the interest deduction.', style: AppTextStyles.caption),
        if (schedule.steps.isNotEmpty || schedule.paidOffYear != null) ...[
          const SizedBox(height: AppSpacing.sm),
          for (final step in schedule.steps)
            Text(_stepText(step), style: AppTextStyles.body),
          if (schedule.paidOffYear case final year?)
            Text('Paid off in year $year.', style: AppTextStyles.body),
        ],
        const SizedBox(height: AppSpacing.sm),
        Text(
          'At ${percentText(slice.annualRate)} for the whole term, though '
          'rates will move'
          '${slice.monthly.amortizationRate == null ? '' : ', paying off only what the rules ask'}. '
          'Sample rules and rates for ${slice.marketName}. An estimate, not '
          'advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  static String _stepText(AmortizationStep step) {
    final below = switch (step.belowShare) {
      final share? =>
        'the loan is under ${wholePercentText(share)} of the '
            'price, so ',
      null => '',
    };
    return step.annualRate.partsPerMillion == 0
        ? 'From year ${step.year}, ${below}the rules ask for no amortization.'
        : 'From year ${step.year}, ${below}the rules ask '
              '${percentText(step.annualRate)} a year.';
  }
}
