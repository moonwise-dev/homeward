import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../../display/constraint_kind_label.dart';
import '../../display/exchange_rate_format.dart';
import '../../display/money_format.dart';
import '../../display/profile_field_label.dart';
import '../../ui/app_colors.dart';
import '../../ui/app_figure_row.dart';
import '../../ui/app_section_title.dart';
import '../../ui/app_spacing.dart';
import '../../ui/app_status.dart';
import '../../ui/app_status_tag.dart';
import '../../ui/app_text_styles.dart';

class AffordabilitySummaryView extends StatelessWidget {
  const AffordabilitySummaryView({
    required this.affordability,
    required this.locale,
    this.exchangeRates = const [],
    this.onExplain,
    super.key,
  });

  final Affordability affordability;
  final LocaleTag locale;
  final List<ExchangeRate> exchangeRates;
  final VoidCallback? onExplain;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      AppSectionTitle(title: 'What you can borrow', onExplain: onExplain),
      const SizedBox(height: AppSpacing.xs),
      ...switch (affordability) {
        IncompleteAffordability(:final missing, :final unconvertedCurrencies) => [
          if (missing.isNotEmpty)
            AppStatusTag(
              status: AppStatus.info,
              text:
                  'Still needed: '
                  '${missing.map(profileFieldLabel).join(', ')}',
            ),
          if (unconvertedCurrencies.isNotEmpty)
            AppStatusTag(
              status: AppStatus.info,
              text:
                  'Amounts in '
                  '${unconvertedCurrencies.map((currency) => currency.code).join(', ')} '
                  'cannot be compared yet',
            ),
        ],
        AssessedAffordability(:final loan, :final maxLoan, :final binding) =>
          _assessed(loan, maxLoan, binding),
      },
      for (final rate in exchangeRates)
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xxs),
          child: Text(
            'Your ${rate.from.code} counted at '
            '${formatExchangeRate(rate, locale)}.',
            style: AppTextStyles.caption,
          ),
        ),
    ],
  );

  List<Widget> _assessed(Money loan, Money maxLoan, ConstraintCheck? binding) {
    final headroom = maxLoan - loan;
    final limit = binding == null ? null : constraintKindLabel(binding.kind);
    return [
      Text(formatMoney(maxLoan, locale), style: AppTextStyles.figureLarge),
      Text('Largest loan at this price', style: AppTextStyles.caption),
      const SizedBox(height: AppSpacing.sm),
      AppFigureRow(label: 'Your loan', figure: formatMoney(loan, locale)),
      AppFigureRow(
        label: headroom.isNegative ? 'Over the limit by' : 'Room to spare',
        figure: formatMoney(headroom.isNegative ? -headroom : headroom, locale),
        color: headroom.isNegative ? AppColors.danger : AppColors.text,
      ),
      if (limit != null) ...[
        const SizedBox(height: AppSpacing.xs),
        AppStatusTag(
          status: headroom.isNegative ? AppStatus.fail : AppStatus.pass,
          text: headroom.isNegative
              ? 'Over the $limit'
              : 'Within the $limit, which sets your limit',
        ),
      ],
    ];
  }
}
