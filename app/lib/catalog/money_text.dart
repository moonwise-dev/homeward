import 'dart:math';

import 'package:common/common.dart';
import 'package:intl/intl.dart';

String moneyText(Money money) => NumberFormat.currency(
  locale: 'en',
  name: money.currency.code,
  symbol: _symbols[money.currency.code] ?? '${money.currency.code} ',
  decimalDigits: 0,
).format(money.minorUnits / pow(10, money.currency.minorDigits));

const _symbols = {'EUR': '€', 'USD': r'$', 'GBP': '£'};

String percentText(Rate rate) =>
    '${NumberFormat('0.##', 'en').format(rate.partsPerMillion / 10000)}%';

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
