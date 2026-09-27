import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../home_text.dart';
import '../money_text.dart';
import 'photo_carousel.dart';

class HomeCardView extends HookWidget {
  const HomeCardView({
    required this.home,
    this.onChoose,
    this.onKeep,
    super.key,
  });

  final PricedHome home;
  final VoidCallback? onChoose;
  final ValueChanged<bool>? onKeep;

  @override
  Widget build(BuildContext context) {
    final sent = useState(false);
    useEffect(() {
      sent.value = false;
      return null;
    }, [home]);
    final listing = home.listing;
    final cost = home.cost;
    final fee = listing.monthlyFee;
    final onChoose = this.onChoose;
    final onKeep = this.onKeep;
    void send(VoidCallback action) {
      sent.value = true;
      action();
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PhotoCarousel(
              photos: listing.photos,
              label: listing.title,
              credit: listing.photoCredit,
              tag: 'Sample listing',
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${listing.areaName} · ${listing.address}',
              style: AppTextStyles.label,
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(listing.title, style: AppTextStyles.title),
            const SizedBox(height: AppSpacing.xs),
            Text(moneyText(listing.price), style: AppTextStyles.figure),
            Text(homeFacts(listing), style: AppTextStyles.label),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              '${moneyText(listing.pricePerM2)} per m², ${againstArea(listing)}. '
              'Area figure: ${listing.priceSource}.',
              style: AppTextStyles.caption,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(listing.blurb, style: AppTextStyles.body),
            const Divider(height: AppSpacing.lg),
            if (cost == null) ...[
              if (fee != null)
                AppFigureRow(
                  label: 'Fee for the home a month',
                  figure: moneyText(fee),
                ),
              Text(
                'What it costs you a month shows once Homeward has worked out '
                'what you can borrow here.',
                style: AppTextStyles.caption,
              ),
            ] else
              _Cost(cost: cost),
            if (home.kept)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  'On your shortlist',
                  style: AppTextStyles.label.copyWith(color: AppColors.accent),
                ),
              ),
            Wrap(
              children: [
                if (onChoose != null)
                  TextButton(
                    onPressed: sent.value ? null : () => send(onChoose),
                    child: const Text('Work out this home'),
                  ),
                if (onKeep != null)
                  TextButton(
                    onPressed: sent.value
                        ? null
                        : () => send(() => onKeep(!home.kept)),
                    child: Text(home.kept ? 'Drop from shortlist' : 'Keep'),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              'A sample listing, not for sale. An estimate, not advice.',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _Cost extends StatelessWidget {
  const _Cost({required this.cost});

  final HomeCost cost;

  @override
  Widget build(BuildContext context) {
    final afterDeduction = cost.monthly.afterDeductionWithFee;
    final over = cost.overLimit;
    final short = cost.shortOfSavings;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('What it costs you a month', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          moneyText(cost.monthly.totalWithFee),
          style: AppTextStyles.figureLarge,
        ),
        Text(
          'With ${moneyText(cost.downPayment)} down over ${cost.termYears} '
          'years${cost.monthly.fee == null ? '' : ', the fee included'}. '
          'Rate: ${cost.loanType}, ${percentText(cost.annualRate)}.',
          style: AppTextStyles.caption,
        ),
        if (afterDeduction != null)
          AppFigureRow(
            label: 'After the interest deduction',
            figure: moneyText(afterDeduction),
          ),
        const SizedBox(height: AppSpacing.xxs),
        if (over != null)
          _Verdict(
            text: 'The loan is over the lending limit by ${moneyText(over)}.',
            color: AppColors.danger,
          ),
        if (short != null)
          _Verdict(
            text:
                'The cash on the day is ${moneyText(short)} more than your '
                'savings.',
            color: AppColors.danger,
          ),
        if (cost.withinReach)
          _Verdict(
            text: cost.savings == null
                ? 'Within the lending rules.'
                : 'Within the lending rules and your savings.',
            color: AppColors.positive,
          ),
      ],
    );
  }
}

class _Verdict extends StatelessWidget {
  const _Verdict({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTextStyles.label.copyWith(color: color));
}
