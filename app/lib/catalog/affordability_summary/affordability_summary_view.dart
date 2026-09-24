import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_animated_figure.dart';
import '../../ui/core/ui/app_figure_row.dart';
import '../../ui/core/ui/app_section_title.dart';
import '../../ui/core/ui/app_source_dot.dart';
import '../../ui/core/ui/app_status_tag.dart';
import '../finance_labels.dart';

class AffordabilitySummaryView extends StatelessWidget {
  const AffordabilitySummaryView({
    required this.affordability,
    required this.locale,
    this.maxPrice,
    this.sources = const [],
    this.exchangeRates = const [],
    this.onExplain,
    super.key,
  });

  final Affordability affordability;
  final LocaleTag locale;
  final Money? maxPrice;
  final List<Source> sources;
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
            '${_formatExchangeRate(rate, locale)}.',
            style: AppTextStyles.caption,
          ),
        ),
    ],
  );

  List<Source> _sourcesFor(ConstraintCheck? binding) => [
    for (final source in sources)
      if (source.id == binding?.sourceId) source,
  ];

  List<Widget> _assessed(Money loan, Money maxLoan, ConstraintCheck? binding) {
    final headroom = maxLoan - loan;
    final limit = binding == null ? null : constraintKindLabel(binding.kind);
    final reach = maxPrice;
    return [
      AppAnimatedFigure(
        amount: maxLoan,
        locale: locale,
        style: AppTextStyles.figureLarge,
      ),
      Text('Largest loan at this price', style: AppTextStyles.caption),
      const SizedBox(height: AppSpacing.sm),
      if (reach != null)
        AppFigureRow.amount(
          label: 'Highest price your savings reach',
          amount: reach,
          locale: locale,
        ),
      AppFigureRow.amount(
        label: 'Your loan',
        amount: loan,
        locale: locale,
      ),
      AppFigureRow.amount(
        label: headroom.isNegative ? 'Over the limit by' : 'Room to spare',
        amount: headroom.isNegative ? -headroom : headroom,
        locale: locale,
        color: headroom.isNegative ? AppColors.danger : AppColors.text,
      ),
      if (limit != null) ...[
        const SizedBox(height: AppSpacing.xs),
        AppStatusTag(
          status: headroom.isNegative ? AppStatus.fail : AppStatus.pass,
          text: headroom.isNegative
              ? 'Over the $limit'
              : 'Within the $limit, which sets your limit',
          trailing: AppSourceDot(
            title: 'Where the $limit comes from',
            sources: _sourcesFor(binding),
          ),
        ),
      ],
    ];
  }
}

String _formatExchangeRate(ExchangeRate rate, LocaleTag? locale) {
  final localeName = Intl.canonicalizedLocale(locale?.tag ?? 'en');
  final perUnit = 1 / double.parse(rate.rate.text);
  final amount = NumberFormat.decimalPatternDigits(
    locale: localeName,
    decimalDigits: 4,
  ).format(perUnit);
  final asOf = DateFormat.yMMMd(
    localeName,
  ).format(rate.asOf.utcMidnight.toLocal());
  return '$amount ${rate.from.code} to 1 ${rate.to.code} on $asOf';
}
