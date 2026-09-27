import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final table = ExchangeRateTable.fromJson(
    jsonDecode(r'''
    {
      "base": "EUR",
      "asOf": "2026-09-17",
      "rates": { "SEK": "11.2715", "USD": "1.1481", "JPY": "169.43" },
      "source": {
        "id": "fixture",
        "publisher": "Fixture",
        "title": "Reference rates",
        "url": "https://example.com",
        "kind": "officialStatistics",
        "retrievedAt": "2026-09-17"
      }
    }
    ''') as Map<String, Object?>,
  );
  final euro = Currency.parse('EUR');
  final krona = Currency.parse('SEK');
  final yen = Currency.parse('JPY');

  Money money(int minorUnits, Currency currency) =>
      Money(minorUnits: minorUnits, currency: currency);

  test('reads the rate out of the table in both directions', () {
    expect(table.between(euro, krona)?.rate.text, '11.2715');
    expect(table.between(krona, euro)?.rate.text, '0.08871934');
    expect(table.between(euro, euro)?.rate.text, '1');
    expect(table.between(krona, Currency.parse('CHF')), isNull);
  });

  test('converts a monthly income into the market currency', () {
    expect(
      table.between(krona, euro)!.convert(money(6200000, krona)),
      money(550060, euro),
    );
    expect(
      table.between(euro, krona)!.convert(money(550060, euro)),
      money(6200001, krona),
    );
  });

  test('respects currencies with other minor digits', () {
    final rate = table.between(yen, euro)!;

    expect(rate.convert(money(1000000, yen)), money(590214, euro));
    expect(
      table.between(euro, yen)!.convert(money(590214, euro)),
      money(1000000, yen),
    );
  });

  test('refuses an amount in another currency', () {
    expect(
      () => table.between(krona, euro)!.convert(money(100, euro)),
      throwsArgumentError,
    );
  });

  test('a currency the table does not hold has no rate', () {
    expect(table.holds(krona), isTrue);
    expect(table.holds(euro), isTrue);
    expect(table.holds(Currency.parse('CHF')), isFalse);
  });
}
