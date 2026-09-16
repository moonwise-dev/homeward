import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  final rows = [
    ('4 500 000 SEK', sek(450000000), sek(2000000)),
    ('350 000 EUR', eur(35000000), eur(200000)),
    ('1 000 000 SEK', sek(100000000), sek(500000)),
    ('500 SEK', sek(50000), sek(200)),
    ('10 SEK', sek(1000), sek(100)),
  ];

  for (final (name, price, step) in rows) {
    test('steps a price of $name by a round number near 0.5%', () {
      expect(downPaymentStep(price), step);
    });
  }
}
