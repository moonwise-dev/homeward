import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/formats.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_section_title.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../finance_labels.dart';

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
      status: _appStatusOf(item.status),
      text: _eligibilityTitle(item),
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

AppStatus _appStatusOf(EligibilityStatus status) => switch (status) {
  EligibilityStatus.pass => AppStatus.pass,
  EligibilityStatus.warn => AppStatus.warn,
  EligibilityStatus.fail => AppStatus.fail,
};

String _eligibilityTitle(EligibilityItem item) => switch (item) {
  LoanEligibility(:final status, :final kind) =>
    status == EligibilityStatus.pass
        ? 'Passes the ${constraintKindLabel(kind)}'
        : 'Above the ${constraintKindLabel(kind)}',
  TermEligibility(
    :final status,
    :final limit,
    :final allowedYears,
  ) =>
    switch ((status, limit)) {
      (EligibilityStatus.pass, TermLimit.marketMaximum) =>
        'Term within the $allowedYears year maximum',
      (EligibilityStatus.pass, TermLimit.ageAtMaturity) =>
        'Term ends before the age limit',
      (_, TermLimit.marketMaximum) =>
        'Term longer than the $allowedYears year maximum',
      (_, TermLimit.ageAtMaturity) =>
        'Term runs past the age limit, $allowedYears years at most',
    },
};
