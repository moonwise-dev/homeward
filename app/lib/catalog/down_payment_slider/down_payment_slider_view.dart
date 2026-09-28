import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_button.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class DownPaymentSliderView extends HookWidget {
  const DownPaymentSliderView({required this.slice, this.onApply, super.key});

  final AffordabilitySlice slice;
  final ValueChanged<Money>? onApply;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final steps = slice.whatIf?.steps ?? const <WhatIfStep>[];
    final current = _nearest(steps, slice.downPayment);
    final index = useState(current);
    final applied = useState<int?>(null);
    useEffect(() {
      index.value = current;
      applied.value = null;
      return null;
    }, [slice]);
    final inUse = index.value == current || index.value == applied.value;
    if (steps.isEmpty) {
      return const SizedBox.shrink();
    }
    final step = steps[index.value.clamp(0, steps.length - 1)];
    final savings = slice.savings;
    final cashNeeded = step.cashNeeded;
    final afterDeduction = step.monthly.afterDeductionWithFee;
    final amortizationRate = step.monthly.amortizationRate;
    final onApply = this.onApply;
    final share = shareOf(
      part: step.downPayment,
      whole: slice.price,
      rounding: Rounding.halfUp,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Try a down payment', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Text(
                moneyText(step.downPayment),
                style: styles.figureLarge,
              ),
            ),
            Text(
              '${wholePercentText(share)} of '
              '${moneyText(slice.price)}',
              style: styles.caption,
            ),
          ],
        ),
        if (steps.length > 1) ...[
          Slider(
            value: index.value.toDouble(),
            max: (steps.length - 1).toDouble(),
            divisions: steps.length - 1,
            semanticFormatterCallback: (_) => moneyText(step.downPayment),
            onChanged: (value) => index.value = value.round(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('The minimum the rules allow', style: styles.caption),
              Text('What your savings reach', style: styles.caption),
            ],
          ),
        ] else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: Text(
              'Your savings do not reach more than the minimum the rules '
              'allow at this price.',
              style: styles.caption,
            ),
          ),
        const SizedBox(height: AppSpacing.sm),
        AppFigureRow(label: 'Your loan', figure: moneyText(step.loan)),
        AppFigureRow(
          label: amortizationRate == null
              ? 'A month'
              : 'A month, amortizing ${percentText(amortizationRate)} a year',
          figure: moneyText(step.monthly.totalWithFee),
          isTotal: true,
        ),
        if (afterDeduction != null)
          AppFigureRow(
            label: 'After the interest deduction',
            figure: moneyText(afterDeduction),
          ),
        if (cashNeeded != null)
          AppFigureRow(
            label: 'Cash needed on the day',
            figure: moneyText(cashNeeded),
            color: savings != null && cashNeeded > savings
                ? colors.danger
                : colors.text,
          ),
        if (savings != null)
          AppFigureRow(label: 'Your savings', figure: moneyText(savings)),
        if (!step.withinRules)
          Text(
            'Over the lending limit at this down payment.',
            style: styles.caption.copyWith(color: colors.danger),
          ),
        if (onApply != null) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: inUse ? 'Your down payment' : 'Use this down payment',
            variant: AppButtonVariant.outlined,
            onPressed: inUse
                ? null
                : () {
                    applied.value = index.value;
                    onApply(step.downPayment);
                  },
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Sample rules and rates for ${slice.marketName}. An estimate, not '
          'advice.',
          style: styles.caption,
        ),
      ],
    );
  }

  static int _nearest(List<WhatIfStep> steps, Money downPayment) {
    var nearest = 0;
    for (final (index, step) in steps.indexed) {
      if ((step.downPayment.minorUnits - downPayment.minorUnits).abs() <
          (steps[nearest].downPayment.minorUnits - downPayment.minorUnits)
              .abs()) {
        nearest = index;
      }
    }
    return nearest;
  }
}
