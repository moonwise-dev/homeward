import '../../money/currency.dart';
import '../../money/money.dart';

extension type const ExactDecimal._(String text) {
  factory ExactDecimal.parse(String text) {
    if (!RegExp(r'^(0|[1-9]\d*)(\.\d+)?$').hasMatch(text)) {
      throw FormatException(
        'Expected a non-negative decimal such as 2658.66',
        text,
      );
    }
    return ExactDecimal._(text);
  }

  factory ExactDecimal.fromScaled(int value, int places) {
    if (value < 0) {
      throw ArgumentError.value(value, 'value', 'Must not be negative');
    }
    final digits = value.toString().padLeft(places + 1, '0');
    final whole = digits.substring(0, digits.length - places);
    final fraction = digits
        .substring(digits.length - places)
        .replaceFirst(RegExp(r'0+$'), '');
    return ExactDecimal._(fraction.isEmpty ? whole : '$whole.$fraction');
  }

  static const _maxDigits = 15;

  int get decimalPlaces {
    final point = text.indexOf('.');
    return point == -1 ? 0 : text.length - point - 1;
  }

  int scaledBy(int places) {
    if (decimalPlaces > places) {
      throw FormatException('Expected at most $places decimal places', text);
    }
    final digits = text.replaceFirst('.', '') + '0' * (places - decimalPlaces);
    if (digits.replaceFirst(RegExp('^0+'), '').length > _maxDigits) {
      throw FormatException('Too many digits for exact arithmetic', text);
    }
    return int.parse(digits);
  }

  Money toMoney(Currency currency) =>
      Money(minorUnits: scaledBy(currency.minorDigits), currency: currency);
}
