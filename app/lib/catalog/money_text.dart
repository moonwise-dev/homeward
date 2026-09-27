import 'dart:math';

import 'package:common/common.dart';
import 'package:intl/intl.dart';

String moneyText(Money money, {bool exact = false}) => NumberFormat.currency(
  locale: 'en',
  name: money.currency.code,
  symbol: _symbols[money.currency.code] ?? '${money.currency.code} ',
  decimalDigits: exact && money.minorUnits % money.currency.majorUnit != 0
      ? money.currency.minorDigits
      : 0,
).format(majorUnits(money));

double majorUnits(Money money) =>
    money.minorUnits / pow(10, money.currency.minorDigits);

const _symbols = {'EUR': '€', 'USD': r'$', 'GBP': '£'};

String percentText(Rate rate) =>
    '${NumberFormat('0.##', 'en').format(rate.partsPerMillion / 10000)}%';

String wholePercentText(Rate rate) =>
    NumberFormat.percentPattern('en').format(rate.fraction);

String ruleLabel(ConstraintKind kind) => switch (kind) {
  ConstraintKind.loanToValue => 'Loan-to-value cap',
  ConstraintKind.loanToIncome => 'Income multiple cap',
  ConstraintKind.debtServiceToIncome => 'Debt-service limit',
  ConstraintKind.leftToLiveOn => 'Left-to-live-on calculation',
};

String repaymentText(AffordabilitySlice slice) =>
    switch (slice.monthly.amortizationRate) {
      null => 'over ${slice.termYears} years',
      final rate when rate.partsPerMillion == 0 => 'no amortization required',
      final rate => 'amortizing ${percentText(rate)} a year',
    };

String refundText(RefundRule refund) {
  final conditions = [
    if (refund.recomputeAs.residency == Residency.resident)
      'become a tax resident',
    if (refund.recomputeAs.use == PropertyUse.primary)
      'make it your permanent home',
  ];
  final claim = 'claimed within ${periodText(refund.claimWindow)}';
  return conditions.isEmpty
      ? 'Refundable, $claim.'
      : 'Comes back if you ${conditions.join(' and ')} within '
            '${periodText(refund.deadline)}, $claim.';
}

String periodText(Period period) => [
  if (period.years > 0) _count(period.years, 'year'),
  if (period.months > 0) _count(period.months, 'month'),
  if (period.weeks > 0) _count(period.weeks, 'week'),
  if (period.days > 0) _count(period.days, 'day'),
].join(' and ');

String _count(int count, String unit) => '$count $unit${count == 1 ? '' : 's'}';

String exchangeRateText(ExchangeRate rate) =>
    'Your ${rate.from.code} counted at 1 ${rate.from.code} = ${rate.rate} '
    '${rate.to.code}, ${rate.source.publisher}, ${rate.asOf}.';
