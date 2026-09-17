import 'package:common/common.dart';
import 'package:intl/intl.dart';

String formatMoney(Money money, LocaleTag? locale) =>
    moneyFormatFor(money.currency, locale).format(majorUnitsOf(money));

NumberFormat moneyFormatFor(Currency currency, LocaleTag? locale) {
  final localeName = Intl.canonicalizedLocale(locale?.tag ?? 'en');
  return NumberFormat.currency(
    locale: localeName,
    name: currency.code,
    symbol: NumberFormat.simpleCurrency(
      locale: localeName,
      name: currency.code,
    ).currencySymbol,
    decimalDigits: 0,
  );
}

double majorUnitsOf(Money money) {
  var divisor = 1;
  for (var digit = 0; digit < money.currency.minorDigits; digit++) {
    divisor *= 10;
  }
  return money.minorUnits / divisor;
}

Money moneyFromMajorUnits(int majorUnits, Currency currency) {
  var multiplier = 1;
  for (var digit = 0; digit < currency.minorDigits; digit++) {
    multiplier *= 10;
  }
  return Money(minorUnits: majorUnits * multiplier, currency: currency);
}
