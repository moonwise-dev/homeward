import 'dart:math';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/exact_rounding.dart';
import '../support/money_helpers.dart';

void main() {
  const bpi = 'Banco BPI credit price list in force 2026-09-16';

  group('annuityPayment', () {
    const cases = <(String, int, int, int, int)>[
      (bpi, 15000000, 43130, 360, 74345),
      (bpi, 15000000, 17090, 360, 53286),
      (bpi, 15000000, 53000, 300, 90330),
      (bpi, 15000000, 50000, 120, 159098),
      (bpi, 5000000, 39630, 360, 23764),
      (bpi, 15000000, 52000, 360, 82367),
      (bpi, 15000000, 52000, 480, 74328),
    ];

    for (final (source, principal, ratePpm, months, expected) in cases) {
      test('$source: $principal at $ratePpm ppm over $months months', () {
        expect(
          annuityPayment(
            principal: eur(principal),
            annualRate: Rate.ppm(ratePpm),
            months: months,
            rounding: Rounding.halfUp,
          ),
          eur(expected),
        );
      });
    }

    test('splits the principal evenly at a zero rate', () {
      expect(
        annuityPayment(
          principal: eur(10000),
          annualRate: Rate.zero,
          months: 3,
          rounding: Rounding.halfUp,
        ),
        eur(3333),
      );
    });

    test('rejects a term that is not positive', () {
      expect(
        () => annuityPayment(
          principal: eur(10000),
          annualRate: const Rate.ppm(40000),
          months: 0,
          rounding: Rounding.halfUp,
        ),
        throwsArgumentError,
      );
    });

    test('matches exact rational arithmetic', () {
      final random = Random(2026);
      for (var i = 0; i < 300; i++) {
        final principal = random.nextInt(1 << 30) + 100000;
        final ratePpm = random.nextInt(150000) + 1;
        final months = random.nextInt(480) + 1;
        final rounding = Rounding(
          mode: RoundingMode.values[random.nextInt(RoundingMode.values.length)],
        );
        final growth = _exactGrowth(ratePpm, months);

        expect(
          annuityPayment(
            principal: eur(principal),
            annualRate: Rate.ppm(ratePpm),
            months: months,
            rounding: rounding,
          ).minorUnits,
          exactRatio(
            rounding,
            BigInt.from(principal) * BigInt.from(ratePpm) * growth.numerator,
            _monthlyDenominator * (growth.numerator - growth.denominator),
          ),
          reason: '$rounding $principal at $ratePpm ppm over $months months',
        );
      }
    });
  });

  group('firstAnnuityPayment', () {
    test('splits the payment into interest and amortization', () {
      final payment = firstAnnuityPayment(
        principal: eur(15000000),
        annualRate: const Rate.ppm(43130),
        months: 360,
        rounding: Rounding.halfUp,
      );

      expect(payment.interest, eur(53913));
      expect(payment.amortization, eur(20432));
      expect(payment.total, eur(74345));
    });
  });

  group('maxAnnuityPrincipal', () {
    test('never exceeds the payment when rounded down', () {
      final principal = maxAnnuityPrincipal(
        payment: eur(74345),
        annualRate: const Rate.ppm(43130),
        months: 360,
        rounding: Rounding.down,
      );

      expect(principal, eur(14999946));
      expect(
        annuityPayment(
          principal: principal,
          annualRate: const Rate.ppm(43130),
          months: 360,
          rounding: Rounding.halfUp,
        ),
        lessThanOrEqualTo(eur(74345)),
      );
    });

    test('multiplies the payment by the term at a zero rate', () {
      expect(
        maxAnnuityPrincipal(
          payment: eur(1000),
          annualRate: Rate.zero,
          months: 12,
          rounding: Rounding.down,
        ),
        eur(12000),
      );
    });

    test('matches exact rational arithmetic', () {
      final random = Random(4217);
      for (var i = 0; i < 300; i++) {
        final payment = random.nextInt(1 << 24) + 1000;
        final ratePpm = random.nextInt(150000) + 1;
        final months = random.nextInt(480) + 1;
        final growth = _exactGrowth(ratePpm, months);

        expect(
          maxAnnuityPrincipal(
            payment: eur(payment),
            annualRate: Rate.ppm(ratePpm),
            months: months,
            rounding: Rounding.down,
          ).minorUnits,
          exactRatio(
            Rounding.down,
            BigInt.from(payment) *
                (growth.numerator - growth.denominator) *
                _monthlyDenominator,
            BigInt.from(ratePpm) * growth.numerator,
          ),
          reason: '$payment at $ratePpm ppm over $months months',
        );
      }
    });
  });
}

final _monthlyDenominator = BigInt.from(12000000);

({BigInt numerator, BigInt denominator}) _exactGrowth(
  int ratePpm,
  int months,
) => (
  numerator: (_monthlyDenominator + BigInt.from(ratePpm)).pow(months),
  denominator: _monthlyDenominator.pow(months),
);
