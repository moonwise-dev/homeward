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
        Text('Costs on the day', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xs),
        if (slice.purchaseCosts.isEmpty)
          Text(
            'The sample rules for ${slice.marketName} list no purchase taxes '
            'or fees.',
            style: AppTextStyles.body,
          ),
        for (final line in slice.purchaseCosts) ..._line(line),
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
                ? AppColors.danger
                : AppColors.text,
          ),
        if (savings != null)
          AppFigureRow(label: 'Your savings', figure: moneyText(savings)),
        const SizedBox(height: AppSpacing.sm),
        for (final source in sources)
          InkWell(
            onTap: () => launchUrl(Uri.parse(source.url)),
            child: Text(
              '${source.publisher}: ${source.title}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.accent,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.accent,
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'Sample rules for ${slice.marketName}. An estimate, not advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  List<Widget> _line(CostLine line) {
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

            style: AppTextStyles.caption,
          ),
        ),
    ];
  }
}
