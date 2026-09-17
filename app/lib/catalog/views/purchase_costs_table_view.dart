import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/money_format.dart';
import '../../display/refund_terms.dart';
import '../../ui/app_figure_row.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_text_styles.dart';

class PurchaseCostsTableView extends StatelessWidget {
  const PurchaseCostsTableView({
    required this.costs,
    required this.locale,
    this.onExplain,
    super.key,
  });

  final EstimatedPurchaseCosts costs;
  final LocaleTag locale;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      AppSectionTitle(title: 'Costs on the day', onExplain: onExplain),
      const SizedBox(height: AppSpacing.xs),
      for (final charge in costs.charges) ..._charge(charge),
      const Divider(height: AppSpacing.md),
      AppFigureRow(
        label: 'Costs on the day',
        figure: formatMoney(costs.total, locale),
        isTotal: true,
      ),
      AppFigureRow(
        label: 'Cash needed with the down payment',
        figure: formatMoney(costs.cashNeeded, locale),
        isTotal: true,
      ),
    ],
  );

  List<Widget> _charge(PurchaseCharge charge) {
    final refundable = charge.refundable;
    final refund = charge.refund;
    return [
      AppFigureRow(
        label: charge.localTerm == null
            ? charge.label
            : '${charge.label} (${charge.localTerm})',
        figure: formatMoney(charge.amount, locale),
      ),
      if (refundable != null && !refundable.isZero && refund != null)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
          child: Text(
            '${formatMoney(refundable, locale)} refundable. '
            '${refundTerms(refund)}',
            style: AppTextStyles.caption,
          ),
        ),
    ];
  }
}
