import 'dart:math';

import 'package:common/common.dart';

const amountParameter = {
  'type': 'object',
  'properties': {
    'amount': {
      'type': 'number',
      'description':
          'The amount in major units as the buyer said it, such as 62000.',
    },
    'currency': {
      'type': 'string',
      'description': 'ISO 4217 code; omit for the market currency.',
    },
  },
  'required': ['amount'],
};

const perPeriodParameter = {
  'type': 'object',
  'properties': {
    'amount': {
      'type': 'number',
      'description': 'The amount in major units as the buyer said it.',
    },
    'currency': {
      'type': 'string',
      'description': 'ISO 4217 code; omit for the market currency.',
    },
    'per': {
      'type': 'string',
      'enum': ['month', 'year'],
    },
  },
  'required': ['amount'],
};

Money monthlyOf(Money money, Object? argument) =>
    argument is Map<String, Object?> && argument['per'] == 'year'
    ? money.copyWith(
        minorUnits: Rounding.halfUp.divide(money.minorUnits, monthsPerYear),
      )
    : money;

Money moneyFromArgument(Object? argument, Currency? marketCurrency) {
  if (argument case {'amount': final num amount}) {
    final currency = switch (argument['currency']) {
      final String code => Currency.parse(code.trim().toUpperCase()),
      _ =>
        marketCurrency ??
            (throw const FormatException(
              'Say which currency the amount is in',
            )),
    };
    if (amount.isNegative || !amount.isFinite) {
      throw FormatException('Amounts must be positive', amount);
    }
    final text = amount is int
        ? '$amount'
        : amount.toStringAsFixed(currency.minorDigits);
    return ExactDecimal.parse(text).toMoney(currency);
  }
  throw const FormatException(
    'Expected { "amount": number, "currency"?: code }',
  );
}

bool isUnsaid(Object? argument, Set<String> said) => switch (argument) {
  {'amount': final num amount} => amount != 0 && !said.contains(_plain(amount)),
  _ => false,
};

String _plain(num amount) =>
    amount == amount.roundToDouble() ? '${amount.round()}' : '$amount';

Map<String, Object?> argumentOf(Money money) => {
  'amount': money.minorUnits / pow(10, money.currency.minorDigits),
  'currency': money.currency.code,
};
