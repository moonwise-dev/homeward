import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class HouseholdSummaryView extends StatelessWidget {
  const HouseholdSummaryView({required this.slice, super.key});

  final AffordabilitySlice slice;

  static const _assumed = 'Assumed';

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final profile = slice.profile;
    if (profile == null) {
      return const SizedBox.shrink();
    }
    final children = profile.childAges;
    final source = slice.takeHomeSource;
    String? noteFor(ProfileAssumption assumption, [String note = _assumed]) =>
        slice.assumed.contains(assumption) ? note : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your household', style: styles.label),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          slice.assumed.isEmpty
              ? 'What the figures rest on, as you told Homeward.'
              : 'What the figures rest on. Homeward assumed what you have '
                    'not said yet, and marked it.',
          style: styles.body,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (profile.adults case final adults?)
          AppFigureRow(
            label: 'Adults in the home',
            figure: '$adults',
            note: noteFor(
              ProfileAssumption.adults,
              'Assumed, one for each income',
            ),
          ),
        if (children != null)
          AppFigureRow(
            label: 'Children',
            figure: children.isEmpty ? 'None' : 'Aged ${children.join(', ')}',
            note: noteFor(ProfileAssumption.children),
          ),
        if (profile.borrowers case final borrowers?)
          AppFigureRow(label: 'Borrowers on the loan', figure: '$borrowers'),
        if (profile.age case final age?)
          AppFigureRow(
            label: 'Age of the oldest borrower',
            figure: '$age',
            note: noteFor(ProfileAssumption.age),
          ),
        if (profile.taxResidence case final country?)
          AppFigureRow(
            label: 'Pays tax in',
            figure: countryNames[country.code] ?? country.code,
            note: noteFor(ProfileAssumption.residency),
          ),
        if (profile.employment case final employment?)
          AppFigureRow(
            label: 'Work',
            figure: switch (employment) {
              Employment.employed => 'Employed',
              Employment.selfEmployed => 'Self-employed',
              Employment.retired => 'Retired',
            },
            note: noteFor(ProfileAssumption.employment),
          ),
        if (profile.use case final use?)
          AppFigureRow(
            label: 'The home',
            figure: switch (use) {
              PropertyUse.primary => 'To live in',
              PropertyUse.secondary => 'A second home',
              PropertyUse.investment => 'To let',
            },
            note: noteFor(ProfileAssumption.use),
          ),
        if (profile.grossMonthlyIncome case final income?)
          AppFigureRow(
            label: 'Income a month before tax',
            figure: moneyText(income),
          ),
        if (profile.netMonthlyIncome case final income?)
          AppFigureRow(
            label: 'Take-home pay a month',
            figure: moneyText(income),
            note: noteFor(
              ProfileAssumption.takeHomePay,
              'Estimated from your pay before tax',
            ),
          ),
        if (profile.monthlyDebtPayments case final debts?)
          AppFigureRow(
            label: 'Other loan payments a month',
            figure: moneyText(debts),
            note: noteFor(ProfileAssumption.debts),
          ),
        if (profile.savings case final savings?)
          AppFigureRow(label: 'Savings', figure: moneyText(savings)),
        for (final rate in slice.exchangeRates)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(exchangeRateText(rate), style: styles.caption),
          ),
        if (source != null) ...[
          const SizedBox(height: AppSpacing.xs),
          InkWell(
            onTap: () => launchUrl(Uri.parse(source.url)),
            child: Text(
              'Take-home pay: ${source.publisher}, ${source.title}',
              style: styles.label.copyWith(
                color: colors.accent,
                decoration: TextDecoration.underline,
                decorationColor: colors.accent,
              ),
            ),
          ),
          Text(
            'Read ${source.retrievedAt}. Each income is taxed as one '
            "person's pay. An estimate.",
            style: styles.caption,
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Text(
          slice.assumed.isEmpty
              ? 'Change anything by saying so.'
              : 'Say what is different, and Homeward works it out again.',
          style: styles.caption,
        ),
      ],
    );
  }
}
