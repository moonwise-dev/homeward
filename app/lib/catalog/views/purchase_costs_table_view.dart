import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/money_format.dart';
import '../../display/refund_terms.dart';
import '../../ui/app_figure_row.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_source_dot.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_text_styles.dart';

class PurchaseCostsTableView extends StatelessWidget {
  const PurchaseCostsTableView({
    required this.costs,
    required this.locale,
    this.sources = const [],
    this.onExplain,
    super.key,
  });

  final EstimatedPurchaseCosts costs;
  final LocaleTag locale;
  final List<Source> sources;
  final VoidCallback? onExplain;

  List<Source> get _chargeSources {
    final ids = {for (final charge in costs.charges) charge.sourceId};
    return [
      for (final source in sources)
        if (ids.contains(source.id)) source,
    ];
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Expanded(
            child: AppSectionTitle(
              title: 'Costs on the day',
              onExplain: onExplain,
            ),
          ),
          AppSourceDot(
            title: 'Where these costs come from',
            sources: _chargeSources,
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xs),
      for (final charge in costs.charges) ..._charge(charge),
      const Divider(height: AppSpacing.md),
      AppFigureRow.amount(
        label: 'Costs on the day',
        amount: costs.total,
        locale: locale,
        isTotal: true,
      ),
      AppFigureRow.amount(
        label: 'Cash needed with the down payment',
        amount: costs.cashNeeded,
        locale: locale,
        isTotal: true,
      ),
    ],
  );

  List<Widget> _charge(PurchaseCharge charge) {
    final refundable = charge.refundable;
    final refund = charge.refund;
    return [
      AppFigureRow.amount(
        label: charge.localTerm == null
            ? charge.label
            : '${charge.label} (${charge.localTerm})',
        amount: charge.amount,
        locale: locale,
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
