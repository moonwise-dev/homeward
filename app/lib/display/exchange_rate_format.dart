import 'package:common/common.dart';
import 'package:intl/intl.dart';

String formatExchangeRate(ExchangeRate rate, LocaleTag? locale) {
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
