import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class MonthlyCostBreakdownView extends StatelessWidget {
  const MonthlyCostBreakdownView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final monthly = slice.monthly;
    final fee = monthly.fee;
    final afterDeduction = monthly.afterDeductionWithFee;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What a month costs', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          moneyText(monthly.totalWithFee),
          style: AppTextStyles.figureLarge,
        ),
        Text(
          'For a home at ${moneyText(slice.price)} with '
          '${moneyText(slice.downPayment)} down',
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppFigureRow(
          label: 'Interest at ${percentText(slice.annualRate)}',
          figure: moneyText(monthly.interest),
        ),
        AppFigureRow(
          label: switch (monthly.amortizationRate) {
            null => 'Amortization over ${slice.termYears} years',
            final rate when rate.partsPerMillion == 0 =>
              'Amortization, none required',
            final rate =>
              'Amortization, ${percentText(rate)} a year as the rules require',
          },
          figure: moneyText(monthly.amortization),
        ),
        if (fee != null)
          AppFigureRow(label: 'Fee for the home', figure: moneyText(fee)),
        const Divider(height: AppSpacing.md),
        AppFigureRow(
          label: 'Total a month',
          figure: moneyText(monthly.totalWithFee),
          isTotal: true,
        ),
        if (afterDeduction != null)
          AppFigureRow(
            label: 'After the interest deduction',
            figure: moneyText(afterDeduction),
          ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Rate: ${slice.loanType}. Sample rules and rates for '
          '${slice.marketName}. An estimate, not advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}
