import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/eligibility_label.dart';
import '../../display/money_format.dart';
import '../../display/profile_field_label.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_status.dart';
import '../../ui/app_status_tag.dart';
import '../../ui/app_text_styles.dart';

class EligibilityChecklistView extends StatelessWidget {
  const EligibilityChecklistView({
    required this.eligibility,
    required this.locale,
    this.onExplain,
    super.key,
  });

  final Eligibility eligibility;
  final LocaleTag locale;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      AppSectionTitle(title: 'Where you stand', onExplain: onExplain),
      const SizedBox(height: AppSpacing.xs),
      for (final item in eligibility.items) ..._item(item),
      if (eligibility.missing.isNotEmpty)
        AppStatusTag(
          status: AppStatus.info,
          text:
              'Still waiting on '
              '${eligibility.missing.map(profileFieldLabel).join(', ')}',
        ),
    ],
  );

  List<Widget> _item(EligibilityItem item) => [
    AppStatusTag(
      status: appStatusOf(item.status),
      text: eligibilityTitle(item),
    ),
    if (_detail(item) case final detail?)
      Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.md,
          bottom: AppSpacing.xxs,
        ),
        child: Text(detail, style: AppTextStyles.caption),
      ),
  ];

  String? _detail(EligibilityItem item) {
    if (item.status == EligibilityStatus.pass) {
      return null;
    }
    final lenders = item.status == EligibilityStatus.warn
        ? 'This is a lender norm, not the law: another lender may allow it. '
        : '';
    return switch (item) {
      LoanEligibility(:final leastDownPayment) =>
        '$lenders'
            'A down payment of ${formatMoney(leastDownPayment, locale)} '
            'would settle it.',
      TermEligibility(:final allowedYears) =>
        '${lenders}Shorten the term to $allowedYears years.',
    };
  }
}
