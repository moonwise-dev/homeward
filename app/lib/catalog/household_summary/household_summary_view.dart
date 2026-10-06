import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../money_text.dart';

class HouseholdSummaryView extends StatelessWidget {
  const HouseholdSummaryView({required this.slice, super.key});

  final AffordabilitySlice slice;

  @override
  Widget build(BuildContext context) {
    final styles = AppTextStyles.of(context);
    final profile = slice.profile;
    if (profile == null) {
      return const SizedBox.shrink();
    }
    final people = _people(profile);
    final about = _about(profile, ageAssumed: slice.ageAssumed);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Your household', style: styles.label),
        if (people.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(people, style: styles.title),
        ],
        if (about.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(about, style: styles.body),
        ],
        const SizedBox(height: AppSpacing.sm),
        if (profile.grossMonthlyIncome case final income?)
          AppFigureRow(
            label: 'Income a month before tax',
            figure: moneyText(income),
          ),
        if (profile.netMonthlyIncome case final income?)
          AppFigureRow(
            label: 'Take-home pay a month',
            figure: moneyText(income),
          ),
        if (profile.monthlyDebtPayments case final debts?)
          AppFigureRow(
            label: 'Debt payments a month',
            figure: moneyText(debts),
          ),
        if (profile.savings case final savings?)
          AppFigureRow(label: 'Savings', figure: moneyText(savings)),
        for (final rate in slice.exchangeRates)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(exchangeRateText(rate), style: styles.caption),
          ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'As you told Homeward. Change anything by saying so.',
          style: styles.caption,
        ),
      ],
    );
  }

  static String _people(BuyerProfile profile) {
    final children = profile.childAges ?? const <int>[];
    return [
      if (profile.adults case final adults?) _count(adults, 'adult'),
      if (children.isNotEmpty)
        '${_count(children.length, 'child', plural: 'children')}, '
            'aged ${children.join(' and ')}',
      if (profile.borrowers case final borrowers?)
        '${_count(borrowers, 'borrower')} on the loan',
    ].join(' · ');
  }

  static String _about(BuyerProfile profile, {required bool ageAssumed}) => [
    if (profile.age case final age? when !ageAssumed)
      'The oldest borrower is $age',
    if (profile.taxResidence case final country?)
      'tax resident in ${countryNames[country.code] ?? country.code}',
    if (profile.employment case final employment?)
      switch (employment) {
        Employment.employed => 'employed',
        Employment.selfEmployed => 'self-employed',
        Employment.retired => 'retired',
      },
    if (profile.use case final use?)
      switch (use) {
        PropertyUse.primary => 'buying a home to live in',
        PropertyUse.secondary => 'buying a second home',
        PropertyUse.investment => 'buying to let',
      },
  ].join(', ');

  static String _count(int count, String noun, {String? plural}) =>
      '$count ${count == 1 ? noun : plural ?? '${noun}s'}';
}
