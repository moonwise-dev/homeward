import 'generated/iso_4217.dart';

extension type const Currency._(String code) {
  factory Currency.parse(String code) {
    if (!iso4217MinorDigits.containsKey(code)) {
      throw FormatException('Unknown ISO 4217 currency code', code);
    }
    return Currency._(code);
  }

  int get minorDigits => iso4217MinorDigits[code]!;
}
