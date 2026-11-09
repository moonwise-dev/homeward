import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_details.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_meter.dart';
import '../../ui/core/ui/app_source_note.dart';
import '../../ui/core/ui/app_stat_tiles.dart';
import '../../ui/core/ui/app_status_chip.dart';
import '../money_text.dart';

class AffordabilitySummaryView extends StatelessWidget {
  const AffordabilitySummaryView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final maxPrice = slice.maxPrice;
    final cashNeeded = slice.cashNeeded;
    final savings = slice.savings;
    final binding = slice.binding;
    final over = slice.loan > slice.maxLoan;
    final short = cashNeeded != null && savings != null && cashNeeded > savings;
    final atHighest = maxPrice != null && maxPrice == slice.price;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBlockTitle(
          title: 'What you can borrow',
          status: AppStatusChip(
            label: over
                ? 'Over the limit'
                : short
                ? 'Short on cash'
                : 'Within reach',
            tone: over || short ? AppTone.danger : AppTone.positive,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(moneyText(slice.maxLoan), style: styles.figureLarge),
        Text(
          atHighest
              ? 'The largest loan, for a home at the highest price you reach'
              : 'The largest loan for ${slice.homeName ?? 'a home'} at '
                    '${moneyText(slice.price)}',
          style: styles.caption.copyWith(color: colors.textSecondary),
        ),
        if (cashNeeded != null && savings != null) ...[
          const SizedBox(height: AppSpacing.md),
          AppMeter(
            value: cashNeeded.minorUnits.toDouble(),
            limit: savings.minorUnits.toDouble(),
            valueLabel: 'Cash needed ${moneyText(cashNeeded)}',
            limitLabel: 'Savings ${moneyText(savings)}',
          ),
        ],
        const SizedBox(height: AppSpacing.md),
        AppStatTiles(
          stats: [
            if (maxPrice != null) appStat('Highest price', moneyText(maxPrice)),
            appStat('Down payment', moneyText(slice.downPayment)),
            appStat(
              'A month',
              moneyText(slice.monthly.total),
              note: 'at ${percentText(slice.annualRate)}',
            ),
          ],
        ),
        if (binding != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Limited by the ${ruleLabel(binding.kind).toLowerCase()}',
            style: styles.label.copyWith(color: colors.accent),
          ),
        ],
        AppDetails(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (maxPrice != null)
                AppFigureRow(
                  label: 'Highest price your savings reach',
                  figure: moneyText(maxPrice),
                ),
              if (!atHighest)
                AppFigureRow(
                  label: over ? 'Over the limit by' : 'Your loan',
                  figure: moneyText(
                    over ? slice.loan - slice.maxLoan : slice.loan,
                  ),
                  color: over ? colors.danger : colors.text,
                ),
              AppFigureRow(
                label: 'Down payment',
                figure: moneyText(slice.downPayment),
              ),
              if (cashNeeded != null)
                AppFigureRow(
                  label: 'Cash needed, with purchase costs',
                  figure: moneyText(cashNeeded),
                  color: short ? colors.danger : colors.text,
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
              Text('Rate: ${slice.loanType}', style: styles.caption),
            ],
          ),
        ),
        AppSourceNote(
          lines: [
            for (final rate in slice.exchangeRates) exchangeRateText(rate),
            'Sample rules and rates for ${slice.marketName}. An estimate, not '
                'advice.',
          ],
        ),
      ],
    );
  }
}
