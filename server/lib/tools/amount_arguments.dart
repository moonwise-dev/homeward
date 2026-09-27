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
