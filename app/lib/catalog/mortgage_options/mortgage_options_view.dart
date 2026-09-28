import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class MortgageOptionsView extends HookWidget {
  const MortgageOptionsView({required this.slice, this.onChoose, super.key});

  final AffordabilitySlice slice;
  final ValueChanged<MortgageOption>? onChoose;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final chosen = useState<String?>(null);
    useEffect(() {
      chosen.value = null;
      return null;
    }, [slice]);
    final options = slice.mortgageOptions;
    if (options.isEmpty) {
      return const SizedBox.shrink();
    }
    final source = options.first.source;
    final onChoose = this.onChoose;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your rate options', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          'For a loan of ${moneyText(slice.loan)} over ${slice.termYears} '
          'years',
          style: styles.caption,
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final option in options)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: _Option(
              option: option,
              inUse:
                  option.loanTypeId == slice.loanTypeId ||
                  option.loanTypeId == chosen.value,
              onChoose: onChoose == null || chosen.value != null
                  ? null
                  : () {
                      chosen.value = option.loanTypeId;
                      onChoose(option);
                    },
            ),
          ),
        if (source != null)
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
          'Sample rates from one lender for ${slice.marketName}, read '
          '${source?.retrievedAt ?? ''}. An estimate, not advice.',
          style: styles.caption,
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.option,
    required this.inUse,
    required this.onChoose,
  });

  final MortgageOption option;
  final bool inUse;
  final VoidCallback? onChoose;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final afterDeduction = option.monthly.afterDeductionWithFee;
    final onChoose = this.onChoose;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: inUse ? colors.accentSoft : colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: inUse ? colors.accent : colors.border,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text(
                    option.label,
                    style: styles.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  percentText(option.annualRate),
                  style: styles.figure,
                ),
              ],
            ),
            Text(_holds(option), style: styles.caption),
            const SizedBox(height: AppSpacing.xs),
            AppFigureRow(
              label: 'A month',
              figure: moneyText(option.monthly.totalWithFee),
              isTotal: true,
            ),
            if (afterDeduction != null)
              AppFigureRow(
                label: 'After the interest deduction',
                figure: moneyText(afterDeduction),
              ),
            if (!option.withinRules)
              Text(
                'Over the lending limit at this rate.',
                style: styles.caption.copyWith(color: colors.danger),
              ),
            if (inUse)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xxs),
                child: Text(
                  'Your rate',
                  style: styles.label.copyWith(color: colors.accent),
                ),
              )
            else if (onChoose != null)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: onChoose,
                  child: const Text('Take this rate'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static String _holds(MortgageOption option) => switch (option.rateType) {
    RateType.variable => 'Moves with the market',
    RateType.mixed => 'Then moves with the market',
    RateType.fixed when option.fixedYears > 0 => 'Then a new rate is set',
    RateType.fixed => 'Stays the same for the whole loan',
  };
}
