import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/money_format.dart';
import '../../display/obstacle_status.dart';
import '../../display/period_format.dart';
import '../../display/profile_field_label.dart';
import '../../display/refund_terms.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_status.dart';
import '../../ui/app_status_tag.dart';
import '../../ui/app_text_styles.dart';

class ForeignBuyerObstaclesView extends StatelessWidget {
  const ForeignBuyerObstaclesView({
    required this.obstacles,
    required this.locale,
    this.refunds = const [],
    this.missing = const {},
    this.onExplain,
    super.key,
  });

  final List<Obstacle> obstacles;
  final LocaleTag locale;
  final List<PurchaseCharge> refunds;
  final Set<ProfileField> missing;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) {
    final sorted = [...obstacles]
      ..sort((a, b) => a.severity.index.compareTo(b.severity.index));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionTitle(title: 'Before you get the keys', onExplain: onExplain),
        const SizedBox(height: AppSpacing.xs),
        if (sorted.isEmpty && refunds.isEmpty)
          const AppStatusTag(
            status: AppStatus.pass,
            text: 'Nothing extra stands in your way here',
          ),
        for (final obstacle in sorted)
          ..._entry(
            status: obstacleStatus(obstacle.severity),
            title: obstacle.title,
            detail: obstacleDetail(obstacle, formatPeriod),
          ),
        for (final charge in refunds)
          ..._entry(
            status: AppStatus.info,
            title:
                '${formatMoney(charge.refundable!, locale)} back from the '
                '${charge.label.toLowerCase()}',
            detail: refundTerms(charge.refund!),
          ),
        if (missing.isNotEmpty)
          AppStatusTag(
            status: AppStatus.info,
            text:
                'More may apply once you say '
                '${missing.map(profileFieldLabel).join(', ')}',
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
