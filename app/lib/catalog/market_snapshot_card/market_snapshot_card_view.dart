import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_bullet_list.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../household_text.dart';
import '../list_text.dart';
import '../money_text.dart';

class MarketSnapshotCardView extends HookWidget {
  const MarketSnapshotCardView({required this.snapshot, super.key});

  final MarketSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final showRentSources = useState(false);
    final rateSources = {
      for (final rate in snapshot.rates)
        if (rate.source case final source?)
          [
            source.publisher,
            if (rate.asOf case final asOf?) dateText(asOf),
          ].join(', '),
    };
    final ruleSources = {
      for (final rule in snapshot.rules) ?rule.source?.publisher,
    };
    final priceSources = {for (final area in snapshot.areas) area.priceSource};
    final rentSources = {for (final area in snapshot.areas) area.rentSource};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('${snapshot.cityName} at a glance', style: AppTextStyles.label),
        Text(
          'Prices and loans in ${snapshot.currency.code}. Sample figures from '
          "${snapshot.marketName}'s rules and one lender's rates.",
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text('Mortgage rates today', style: AppTextStyles.label),
        for (final rate in snapshot.rates)
          AppFigureRow(label: rate.label, figure: percentText(rate.annualRate)),
        Text(listText([...rateSources]), style: AppTextStyles.caption),
        const SizedBox(height: AppSpacing.sm),
        Text('What sets the loan', style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.xxs),
        AppBulletList(
          items: [for (final rule in snapshot.rules) _ruleText(rule)],
        ),
        if (ruleSources.isNotEmpty)
          Text(
            'From ${listText([...ruleSources])}.',
            style: AppTextStyles.caption,
          ),
        if (snapshot.waitingOn.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(
              'Other rules depend on '
              '${listText([for (final field in snapshot.waitingOn) profileFieldText(field)])}; '
              'they apply once Homeward knows.',
              style: AppTextStyles.caption.copyWith(color: AppColors.info),
            ),
          ),
        if (snapshot.areas.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text('Areas', style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.xxs),
          Table(
            columnWidths: const {0: FlexColumnWidth(1.4)},
            defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TableRow(
                children: [
                  const SizedBox.shrink(),
                  _cell('Price a m²', AppTextStyles.caption),
                  _cell('Rent a m² a month', AppTextStyles.caption),
                ],
              ),
              for (final area in snapshot.areas)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.xxs,
                      ),
                      child: Text(area.areaName, style: AppTextStyles.body),
                    ),
                    _cell(moneyText(area.pricePerM2), AppTextStyles.figure),
                    _cell(moneyText(area.rentPerM2), AppTextStyles.figure),
                  ],
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            'Prices: ${listText([...priceSources])}.',
            style: AppTextStyles.caption,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              ),
              onPressed: () => showRentSources.value = !showRentSources.value,
              child: Text(
                showRentSources.value
                    ? 'Hide where the rents come from'
                    : 'Where the rents come from',
              ),
            ),
          ),
          if (showRentSources.value)
            for (final source in rentSources)
              Text('$source.', style: AppTextStyles.caption),
        ],
        const SizedBox(height: AppSpacing.sm),
        Text('Sample figures, not advice.', style: AppTextStyles.caption),
      ],
    );
  }

  static Widget _cell(String text, TextStyle style) =>
      Text(text, style: style, textAlign: TextAlign.end);

  static String _ruleText(MarketRule rule) {
    final income = switch (rule.incomeBasis) {
      IncomeBasis.gross => 'income before tax',
      IncomeBasis.net => 'income after tax',
      null => 'income',
    };
    final rate = switch (rule.rate) {
      final rate? => percentText(rate),
      null => '',
    };
    return switch (rule.kind) {
      MarketRuleKind.loanToValue => 'A loan can be up to $rate of the price',
      MarketRuleKind.loanToIncome =>
        'All loans together up to ${rule.multiple} times the yearly $income',
      MarketRuleKind.debtServiceToIncome =>
        'Loan payments up to $rate of $income',
      MarketRuleKind.testedRate =>
        'Lenders check you could still pay at a rate of $rate',
      MarketRuleKind.amortization => switch (rule.whenLtvAbove) {
        final share? =>
          'Pay off $rate of the loan a year while it is over '
              '${wholePercentText(share)} of the price',
        null => 'Pay off $rate of the loan a year',
      },
      MarketRuleKind.interestDeduction => [
        '$rate of the interest back in tax',
        if (rule.upTo case final upTo?)
          'on up to ${moneyText(upTo)} a year${rule.perBorrower ? ' each' : ''}',
        if (rule.rateAbove case final above?) 'then ${percentText(above)}',
      ].join(', '),
    };
  }
}
