import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  const law = 'Lag (2026:226) 7 §';

  test('$law: first payment is interest plus required amortization', () {
    final payment = firstStraightPayment(
      principal: sek(240000000),
      annualRate: const Rate.ppm(35000),
      annualAmortizationRate: const Rate.ppm(20000),
      rounding: Rounding.halfUp,
    );

    expect(payment.interest, sek(700000));
    expect(payment.amortization, sek(400000));
    expect(payment.total, sek(1100000));
  });

  test('$law: largest principal for a first payment', () {
    expect(
      maxStraightPrincipal(
        payment: sek(1100000),
        annualRate: const Rate.ppm(35000),
        annualAmortizationRate: const Rate.ppm(20000),
        rounding: Rounding.down,
      ),
      sek(240000000),
    );
  });

  test('rejects a cost rate that is not positive', () {
    expect(
      () => maxStraightPrincipal(
        payment: sek(1100000),
        annualRate: Rate.zero,
        annualAmortizationRate: Rate.zero,
        rounding: Rounding.down,
      ),
      throwsArgumentError,
    );
  });
}
