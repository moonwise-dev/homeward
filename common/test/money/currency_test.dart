import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  const minorDigits = {'EUR': 2, 'SEK': 2, 'JPY': 0, 'BHD': 3};

  for (final MapEntry(key: code, value: digits) in minorDigits.entries) {
    test('$code has $digits minor digits', () {
      expect(Currency.parse(code).minorDigits, digits);
    });
  }

  for (final code in ['', 'eur', 'XYZ', 'CLF', 'XAU']) {
    test('rejects "$code"', () {
      expect(() => Currency.parse(code), throwsFormatException);
    });
  }

  test('equal codes are equal currencies', () {
    expect(Currency.parse('EUR'), Currency.parse('EUR'));
  });
}
