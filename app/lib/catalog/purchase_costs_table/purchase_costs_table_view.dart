import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_details.dart';
import '../../ui/core/ui/app_meter.dart';
import '../../ui/core/ui/app_source_note.dart';
import '../../ui/core/ui/app_stat_tiles.dart';
import '../../ui/core/ui/app_status_chip.dart';
import '../money_text.dart';

class PurchaseCostsTableView extends StatelessWidget {
  const PurchaseCostsTableView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final total = slice.purchaseCostsTotal;
    final cashNeeded = slice.cashNeeded;
    final savings = slice.savings;
    final sources = {
      for (final source
          in slice.purchaseCosts.map((line) => line.source).nonNulls)
        source.id: source,
    }.values;
    final short = cashNeeded != null && savings != null && cashNeeded > savings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppBlockTitle(
          title: 'Costs on the day',
          status: cashNeeded == null || savings == null
              ? null
              : AppStatusChip(
                  label: short
                      ? 'Short by ${moneyText(cashNeeded - savings)}'
                      : 'Your savings cover it',
                  tone: short ? AppTone.danger : AppTone.positive,
                ),
        ),
        const SizedBox(height: AppSpacing.sm),
        if (cashNeeded != null) ...[
          Text(moneyText(cashNeeded), style: styles.figureLarge),
          Text(
            'Cash needed on the day: the down payment and the purchase costs',
            style: styles.caption.copyWith(color: colors.textSecondary),
          ),
        ],
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
            appStat('Down payment', moneyText(slice.downPayment)),
            if (total != null) appStat('Taxes and fees', moneyText(total)),
            if (savings != null) appStat('Your savings', moneyText(savings)),
          ],
        ),
        if (slice.purchaseCosts.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Text(
              'The sample rules for ${slice.marketName} list no purchase '
              'taxes or fees.',
              style: styles.body,
            ),
          )
        else
          AppDetails(
            label: 'Show each cost',
            openLabel: 'Hide each cost',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final line in slice.purchaseCosts) ..._line(line, styles),
                if (total != null) ...[
                  const Divider(height: AppSpacing.md),
                  AppFigureRow(
                    label: 'Costs on the day',
                    figure: moneyText(total),
                    isTotal: true,
                  ),
                ],
              ],
            ),
          ),
        for (final source in sources)
          InkWell(
            onTap: () => launchUrl(Uri.parse(source.url)),
            child: Text(
              '${source.publisher}: ${source.title}',
              style: styles.caption.copyWith(
                color: colors.accent,
                decoration: TextDecoration.underline,
                decorationColor: colors.accent,
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.xs),
        AppSourceNote(
          lines: [
            'Sample rules for ${slice.marketName}. An estimate, not advice.',
          ],
        ),
      ],
    );
  }

  List<Widget> _line(CostLine line, AppTextStyles styles) {
    final refundable = line.refundable;
    final refund = line.refund;
    return [
      AppFigureRow(
        label: line.localTerm == null
            ? line.label
            : '${line.label} (${line.localTerm})',
        figure: moneyText(line.amount),
      ),
      if (refundable != null && !refundable.isZero && refund != null)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
          child: Text(
            '${moneyText(refundable)} refundable. ${refundText(refund)}',
            style: styles.caption,
          ),
        ),
    ];
  }
}
