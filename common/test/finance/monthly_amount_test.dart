import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  const bpi = 'Banco BPI credit price list in force 2026-09-16, note (3)';

  const cases = <(String, int, int, int)>[
    (bpi, 3750000, 67130, 20978),
    (bpi, 7500000, 67130, 41956),
  ];

  for (final (source, amount, ratePpm, expected) in cases) {
    test('$source: interest on $amount at $ratePpm ppm', () {
      expect(
        monthlyAmountAtAnnualRate(
          amount: eur(amount),
          annualRate: Rate.ppm(ratePpm),
          rounding: Rounding.halfUp,
        ),
        eur(expected),
      );
    });
  }
}
