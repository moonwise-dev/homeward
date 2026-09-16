import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  const law = 'Lag (2026:226) 7 §';
  const tiers = [
    AmortizationTier(
      whenLtvAbove: Rate.ppm(500000),
      annualRate: Rate.ppm(10000),
    ),
    AmortizationTier(
      whenLtvAbove: Rate.ppm(700000),
      annualRate: Rate.ppm(20000),
    ),
  ];

  const cases = <(int, int)>[
    (270000000, 20000),
    (240000000, 20000),
    (210000001, 20000),
    (210000000, 10000),
    (180000000, 10000),
    (150000001, 10000),
    (150000000, 0),
    (100000000, 0),
  ];

  for (final (loan, expectedPpm) in cases) {
    test('$law: $loan against 3 000 000 SEK requires $expectedPpm ppm', () {
      expect(
        requiredAmortizationRate(
          loan: sek(loan),
          value: sek(300000000),
          tiers: tiers,
        ),
        Rate.ppm(expectedPpm),
      );
    });
  }
}
