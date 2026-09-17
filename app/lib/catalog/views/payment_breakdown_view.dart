import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/money_format.dart';
import '../../display/rate_format.dart';
import '../../ui/app_figure_row.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_spacing.dart';

class PaymentBreakdownView extends StatelessWidget {
  const PaymentBreakdownView({
    required this.payment,
    required this.annualRate,
    required this.locale,
    this.associationFee,
    this.afterDeduction,
    this.onExplain,
    super.key,
  });

  final MonthlyPayment payment;
  final Rate annualRate;
  final LocaleTag locale;
  final Money? associationFee;
  final Money? afterDeduction;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) {
    final fee = associationFee;
    final deducted = afterDeduction;
    Money withFee(Money amount) => fee == null ? amount : amount + fee;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionTitle(title: 'Monthly payment', onExplain: onExplain),
        const SizedBox(height: AppSpacing.xs),
        AppFigureRow(
          label: 'Interest at ${formatRate(annualRate)}',
          figure: formatMoney(payment.interest, locale),
        ),
        AppFigureRow(
          label: 'Amortization',
          figure: formatMoney(payment.amortization, locale),
        ),
        if (fee != null)
          AppFigureRow(
            label: 'Association fee',
            figure: formatMoney(fee, locale),
          ),
        const Divider(height: AppSpacing.md),
        AppFigureRow(
          label: 'Total a month',
          figure: formatMoney(withFee(payment.total), locale),
          isTotal: true,
        ),
        if (deducted != null)
          AppFigureRow(
            label: 'After the interest deduction',
            figure: formatMoney(withFee(deducted), locale),
          ),
      ],
    );
  }
}
