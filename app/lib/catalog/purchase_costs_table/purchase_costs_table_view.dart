import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Costs on the day', style: styles.label),
        const SizedBox(height: AppSpacing.xs),
        if (slice.purchaseCosts.isEmpty)
          Text(
            'The sample rules for ${slice.marketName} list no purchase taxes '
            'or fees.',
            style: styles.body,
          ),
        for (final line in slice.purchaseCosts) ..._line(line, styles),
        if (total != null && slice.purchaseCosts.isNotEmpty) ...[
          const Divider(height: AppSpacing.md),
          AppFigureRow(
            label: 'Costs on the day',
            figure: moneyText(total),
            isTotal: true,
          ),
        ],
        AppFigureRow(
          label: 'Down payment',
          figure: moneyText(slice.downPayment),
        ),
        if (cashNeeded != null)
          AppFigureRow(
            label: 'Cash needed',
            figure: moneyText(cashNeeded),
            isTotal: true,
            color: savings != null && cashNeeded > savings
                ? colors.danger
                : colors.text,
          ),
        if (savings != null)
          AppFigureRow(label: 'Your savings', figure: moneyText(savings)),
        const SizedBox(height: AppSpacing.sm),
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
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Sample rules for ${slice.marketName}. An estimate, not advice.',
          style: styles.caption,
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
