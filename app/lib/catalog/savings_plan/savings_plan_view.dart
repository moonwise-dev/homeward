import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class SavingsPlanView extends StatelessWidget {
  const SavingsPlanView({required this.plan, super.key});

  final SavingsPlanSlice plan;

  @override
  Widget build(BuildContext context) {
    final share = plan.cashNeeded.isZero
        ? 1.0
        : (plan.saved.minorUnits / plan.cashNeeded.minorUnits).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Saving for it', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(_needsText(plan), style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.sm),
        if (plan.covered)
          Text(
            'Your savings already cover it.',
            style: AppTextStyles.figure.copyWith(
              color: AppColors.positive,
              fontWeight: FontWeight.w600,
            ),
          )
        else ...[
          Text(
            monthsText(plan.months),
            style: AppTextStyles.figure.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            'Around ${monthText(plan.reachedIn)}, '
            'putting aside ${moneyText(plan.monthlySaving)} a month.',
            style: AppTextStyles.body,
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Semantics(
          label: 'Saved ${(share * 100).round()}% of the cash needed',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.sm),
            child: LinearProgressIndicator(
              value: share,
              minHeight: 8,
              color: plan.covered ? AppColors.positive : AppColors.accent,
              backgroundColor: AppColors.surfaceMuted,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        AppFigureRow(
          label: 'Cash needed on the day',
          figure: moneyText(plan.cashNeeded),
        ),
        AppFigureRow(label: 'Saved now', figure: moneyText(plan.saved)),
        if (!plan.covered) ...[
          AppFigureRow(label: 'Still to save', figure: moneyText(plan.toSave)),
          AppFigureRow(
            label: 'Put aside each month',
            figure: moneyText(plan.monthlySaving),
          ),
        ],
        if (!plan.costsIncluded)
          Text(
            'The down payment only; the costs on the day need more about you '
            'to work out.',
            style: AppTextStyles.caption,
          ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Leaves out what your savings earn, and prices and incomes '
          'changing. Sample rules for ${plan.marketName}. An estimate, not '
          'advice.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  static String _needsText(SavingsPlanSlice plan) {
    final home = plan.homeName ?? 'A home at ${moneyText(plan.price)}';
    final downPayment = plan.downPaymentChosen
        ? 'the down payment you chose'
        : 'the smallest down payment the rules allow';
    final needs =
        '$home needs ${moneyText(plan.cashNeeded)} in cash on the day';
    return plan.costsIncluded && plan.cashNeeded > plan.downPayment
        ? '$needs: $downPayment, ${moneyText(plan.downPayment)}, and the '
              'costs on the day.'
        : '$needs, $downPayment.';
  }
}
