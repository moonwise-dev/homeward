import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class AffordabilitySummaryView extends StatelessWidget {
  const AffordabilitySummaryView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final maxPrice = slice.maxPrice;
    final cashNeeded = slice.cashNeeded;
    final savings = slice.savings;
    final binding = slice.binding;
    final over = slice.loan > slice.maxLoan;
    final atHighest = maxPrice != null && maxPrice == slice.price;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What you can borrow', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(moneyText(slice.maxLoan), style: AppTextStyles.figureLarge),
        Text(
          atHighest
              ? 'The largest loan, for a home at the highest price you reach'
              : 'The largest loan for ${slice.homeName ?? 'a home'} at '
                    '${moneyText(slice.price)}',
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (maxPrice != null)
          AppFigureRow(
            label: 'Highest price your savings reach',
            figure: moneyText(maxPrice),
          ),
        if (!atHighest)
          AppFigureRow(
            label: over ? 'Over the limit by' : 'Your loan',
            figure: moneyText(over ? slice.loan - slice.maxLoan : slice.loan),
            color: over ? AppColors.danger : AppColors.text,
          ),
        AppFigureRow(
          label: 'Down payment',
          figure: moneyText(slice.downPayment),
        ),
        if (cashNeeded != null)
          AppFigureRow(
            label: 'Cash needed, with purchase costs',
            figure: moneyText(cashNeeded),
            color: savings != null && cashNeeded > savings
                ? AppColors.danger
                : AppColors.text,
          ),
        if (savings != null)
          AppFigureRow(label: 'Your savings', figure: moneyText(savings)),
        AppFigureRow(
          label:
              'Loan payment a month at ${percentText(slice.annualRate)}, '
              '${repaymentText(slice)}',
          figure: moneyText(slice.monthly.total),
          isTotal: true,
        ),
        Text('Rate: ${slice.loanType}', style: AppTextStyles.caption),
        if (binding != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Limited by the ${ruleLabel(binding.kind).toLowerCase()}',
            style: AppTextStyles.label.copyWith(color: AppColors.accent),
          ),
        ],
        for (final rate in slice.exchangeRates)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(
              'Your ${rate.from.code} counted at 1 ${rate.from.code} = '
              '${rate.rate} ${rate.to.code}, ${rate.source.publisher}, '
              '${rate.asOf}.',
              style: AppTextStyles.caption,
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Sample rules and rates for ${slice.marketName}. An estimate, not '
          'advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}
