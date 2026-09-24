import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/formats.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_bullet_list.dart';
import '../../ui/core/ui/app_coverage_badge.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_section_title.dart';
import '../../ui/core/ui/app_source_dot.dart';
import '../../ui/core/ui/app_status_tag.dart';

class MarketSnapshotCardView extends StatelessWidget {
  const MarketSnapshotCardView({
    required this.snapshot,
    required this.market,
    required this.curatedMarkets,
    this.onExplain,
    super.key,
  });

  static const rulesShown = 3;

  final MarketSnapshot snapshot;
  final ResolvedMarket? market;
  final List<String> curatedMarkets;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) {
    final market = this.market;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionTitle(title: snapshot.name, onExplain: onExplain),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            AppCoverageBadge(
              isCurated: snapshot.coverage == Coverage.curated,
            ),
            AppSourceDot(
              title: 'Where ${snapshot.name} comes from',
              sources: market?.sources ?? const [],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        if (market == null) ..._uncovered() else ..._curated(market),
      ],
    );
  }

  List<Widget> _uncovered() => [
    AppStatusTag(
      status: AppStatus.warn,
      text: 'Homeward has no curated rules for ${snapshot.name} yet',
    ),
    const SizedBox(height: AppSpacing.xs),
    Text(
      curatedMarkets.isEmpty
          ? 'Nothing here is checked against local rules.'
          : 'These markets are checked against their sources:',
      style: AppTextStyles.body,
    ),
    if (curatedMarkets.isNotEmpty) AppBulletList(items: curatedMarkets),
  ];

  List<Widget> _curated(ResolvedMarket market) {
    final kinds = lendingRuleKinds(market.lending).take(rulesShown).toList();
    final rate = _headlineRate(market);
    return [
      AppFigureRow(label: 'Prices and loans in', figure: market.currency.code),
      if (rate != null)
        AppFigureRow(
          label: 'Reference rate on ${rate.asOf.isoDate}',
          figure: formatRate(rate.rate),
        ),
      if (kinds.isNotEmpty) ...[
        const SizedBox(height: AppSpacing.xs),
        Text('Rules that apply to you', style: AppTextStyles.label),
        AppBulletList(
          items: [for (final kind in kinds) _lendingRuleLabel(kind)],
        ),
      ],
      if (market.pendingRules.isNotEmpty)
        const AppStatusTag(
          status: AppStatus.info,
          text: 'More rules apply once you fill in your details',
        ),
    ];
  }

  ReferenceRate? _headlineRate(ResolvedMarket market) =>
      switch (market.loanTypes) {
        [final loanType, ...] =>
          market.referenceRates[loanType.referenceRateId],
        _ => null,
      };
}

String _lendingRuleLabel(LendingRuleKind kind) => switch (kind) {
  LendingRuleKind.loanToValue => 'Loan-to-value cap',
  LendingRuleKind.loanToIncome => 'Income multiple cap',
  LendingRuleKind.debtServiceToIncome => 'Debt-service limit',
  LendingRuleKind.stressTest => 'Stress test',
  LendingRuleKind.amortizationRequirement => 'Amortization requirement',
  LendingRuleKind.leftToLiveOn => 'Left-to-live-on calculation',
  LendingRuleKind.interestDeduction => 'Interest deduction',
  LendingRuleKind.termLimit => 'Maximum term',
  LendingRuleKind.ageAtMaturity => 'Age at maturity limit',
};
