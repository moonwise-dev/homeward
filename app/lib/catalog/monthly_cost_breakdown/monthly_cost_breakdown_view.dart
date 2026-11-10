import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_source_note.dart';
import '../../ui/core/ui/app_stacked_bar.dart';
import '../../ui/core/ui/app_status_chip.dart';
import '../../ui/core/themes/colors.dart';
import '../money_text.dart';

class MonthlyCostBreakdownView extends StatelessWidget {
  const MonthlyCostBreakdownView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final monthly = slice.monthly;
    final fee = monthly.fee;
    final afterDeduction = monthly.afterDeductionWithFee;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBlockTitle(
          title: 'What a month costs',
          status: afterDeduction == null
              ? null
              : AppStatusChip(
                  label: '${moneyText(afterDeduction)} after deduction',
                  tone: AppTone.info,
                ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(moneyText(monthly.totalWithFee), style: styles.figureLarge),
        Text(
          'For ${slice.homeName ?? 'a home'} at ${moneyText(slice.price)} with '
          '${moneyText(slice.downPayment)} down',
          style: styles.caption.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.md),
        AppStackedBar(
          parts: [
            (
              label: 'Interest at ${percentText(slice.annualRate)}',
              figure: moneyText(monthly.interest),
              value: monthly.interest.minorUnits.toDouble(),
              color: colors.brand,
            ),
            (
              label: switch (monthly.amortizationRate) {
                null => 'Amortization over ${slice.termYears} years',
                final rate when rate.partsPerMillion == 0 =>
                  'Amortization, none required',
                final rate =>
                  'Amortization, ${percentText(rate)} a year as the rules '
                      'require',
              },
              figure: moneyText(monthly.amortization),
              value: monthly.amortization.minorUnits.toDouble(),
              color: colors.info,
            ),
            if (fee != null)
              (
                label: 'Fee for the home',
                figure: moneyText(fee),
                value: fee.minorUnits.toDouble(),
                color: colors.warning,
              ),
          ],
        ),
        const Divider(height: AppSpacing.lg),
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
        AppSourceNote(
          lines: [
            'Rate: ${slice.loanType}. Sample rules and rates for '
                '${slice.marketName}. An estimate, not advice.',
          ],
        ),
      ],
    );
  }
}
