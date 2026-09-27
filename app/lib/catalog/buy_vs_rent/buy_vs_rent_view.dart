import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_chart_key.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_line_chart.dart';
import '../list_text.dart';
import '../money_text.dart';
import '../rent_text.dart';

class BuyVsRentView extends HookWidget {
  const BuyVsRentView({required this.slice, super.key});

  final BuyVsRentSlice slice;

  @override
  Widget build(BuildContext context) {
    final years = useState(slice.years);
    useEffect(() {
      years.value = slice.years;
      return null;
    }, [slice]);
    final last = slice.points.last.year;
    final at = slice.at(years.value);
    final breakEven = slice.breakEvenYear;
    final buyingCheaper = at.buying <= at.renting;
    final difference = buyingCheaper
        ? at.renting - at.buying
        : at.buying - at.renting;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Buying against renting', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          '${slice.homeName ?? 'This home'}: buy at ${moneyText(slice.price)}, '
          'or rent one like it at ${moneyText(slice.rent.monthly)} a month.',
          style: AppTextStyles.body,
        ),
        Text(rentBasisText(slice.rent), style: AppTextStyles.caption),
        const SizedBox(height: AppSpacing.sm),
        AppLineChart(
          summary:
              'Over ${yearsText(last)}, buying costs '
              '${moneyText(slice.points.last.buying)} and renting '
              '${moneyText(slice.points.last.renting)}. '
              '${_breakEvenText(breakEven, last)}',
          points: [
            for (final point in slice.points)
              ChartPoint(x: point.year.toDouble(), y: majorUnits(point.buying)),
          ],
          comparison: [
            for (final point in slice.points)
              ChartPoint(
                x: point.year.toDouble(),
                y: majorUnits(point.renting),
              ),
          ],
          markers: [
            ChartMarker(
              x: years.value.toDouble(),
              label: yearsText(years.value),
              color: AppColors.accent,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        const Row(
          children: [
            AppChartKey(label: 'Buying', color: AppColors.accent),
            SizedBox(width: AppSpacing.md),
            AppChartKey(label: 'Renting', color: AppColors.warning),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'If you stay ${yearsText(years.value)}',
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
        Slider(
          value: years.value.toDouble(),
          min: 1,
          max: last.toDouble(),
          divisions: last - 1,
          semanticFormatterCallback: (value) => yearsText(value.round()),
          onChanged: (value) => years.value = value.round(),
        ),
        if (slice.yearsAssumed && years.value == slice.years)
          Text(
            '${yearsText(slice.years)} assumed; move it to how long you '
            'expect to stay.',
            style: AppTextStyles.caption,
          ),
        const SizedBox(height: AppSpacing.xs),
        AppFigureRow(label: 'Buying costs you', figure: moneyText(at.buying)),
        Text(_buyingText(slice), style: AppTextStyles.caption),
        AppFigureRow(label: 'Renting costs you', figure: moneyText(at.renting)),
        AppFigureRow(
          label: 'What you would own of the home',
          figure: moneyText(at.equity),
        ),
        Text(
          "The down payment and the loan paid off, at today's price.",
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${buyingCheaper ? 'Buying' : 'Renting'} costs '
          '${moneyText(difference)} less over ${yearsText(years.value)}.',
          style: AppTextStyles.label.copyWith(
            color: buyingCheaper ? AppColors.positive : AppColors.warning,
          ),
        ),
        Text(_breakEvenText(breakEven, last), style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.sm),
        Text(
          "Leaves out the home's price changing, what your savings would "
          "earn, selling costs, and a house's upkeep. Sample rules and rates "
          'for ${slice.marketName}, with the rate held at '
          '${percentText(slice.annualRate)}. An estimate, not advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  static String _buyingText(BuyVsRentSlice slice) {
    final parts = [
      if (!slice.purchaseCosts.isZero) 'the costs on the day',
      slice.deducts ? 'interest after the deduction' : 'interest',
      if (slice.fee != null) "the home's fee",
    ];
    final text = listText(parts);
    return '${text[0].toUpperCase()}${text.substring(1)}.';
  }

  static String _breakEvenText(int? year, int last) => switch (year) {
    null => 'Within ${yearsText(last)}, renting stays cheaper.',
    1 => 'Buying comes out cheaper from the first year.',
    final year => 'Buying comes out cheaper from year $year.',
  };
}
