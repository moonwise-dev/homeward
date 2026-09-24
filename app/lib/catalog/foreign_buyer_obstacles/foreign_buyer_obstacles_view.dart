import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_section_title.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../finance_labels.dart';

class ForeignBuyerObstaclesView extends StatelessWidget {
  const ForeignBuyerObstaclesView({
    required this.obstacles,
    required this.refundable,
    this.onExplain,
    super.key,
  });

  final List<Obstacle> obstacles;
  final List<CostRule> refundable;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) {
    final sorted = [...obstacles]
      ..sort((a, b) => a.severity.index.compareTo(b.severity.index));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionTitle(title: 'What stands in the way', onExplain: onExplain),
        const SizedBox(height: AppSpacing.xs),
        if (sorted.isEmpty && refundable.isEmpty)
          const AppStatusTag(
            status: AppStatus.pass,
            text: 'Nothing in this market stands in your way',
          ),
        for (final obstacle in sorted)
          ..._entry(
            status: switch (obstacle.severity) {
              ObstacleSeverity.blocker => AppStatus.fail,
              ObstacleSeverity.effort => AppStatus.warn,
              ObstacleSeverity.info => AppStatus.info,
            },
            title: switch (obstacle.typicalDuration) {
              final duration? =>
                '${obstacle.title} — ${formatPeriod(duration)}',
              null => obstacle.title,
            },
            detail: obstacle.mitigation,
          ),
        for (final charge in refundable)
          ..._entry(
            status: AppStatus.warn,
            title: 'Claim back part of the ${charge.localTerm ?? charge.label}',
            detail: refundTerms(charge.refund!),
          ),
      ],
    );
  }

  List<Widget> _entry({
    required AppStatus status,
    required String title,
    required String detail,
  }) => [
    AppStatusTag(status: status, text: title),
    Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.md,
        bottom: AppSpacing.xs,
      ),
      child: Text(detail, style: AppTextStyles.caption),
    ),
  ];
}

String formatPeriod(Period period) {
  final parts = [
    if (period.years > 0) _count(period.years, 'year'),
    if (period.months > 0) _count(period.months, 'month'),
    if (period.weeks > 0) _count(period.weeks, 'week'),
    if (period.days > 0) _count(period.days, 'day'),
  ];
  return parts.join(' and ');
}

String _count(int amount, String unit) =>
    '$amount $unit${amount == 1 ? '' : 's'}';
