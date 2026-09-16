import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final eur = Currency.parse('EUR');
  final sek = Currency.parse('SEK');
  final jpy = Currency.parse('JPY');

  Money euros(int minorUnits) => Money(minorUnits: minorUnits, currency: eur);

  group('arithmetic', () {
    test('adds, subtracts, negates, and multiplies', () {
      expect(euros(1050) + euros(250), euros(1300));
      expect(euros(1050) - euros(2000), euros(-950));
      expect(-euros(1050), euros(-1050));
      expect(euros(1050) * 3, euros(3150));
    });

    test('compares', () {
      expect(euros(100) < euros(101), isTrue);
      expect(euros(100) >= euros(100), isTrue);
      expect(euros(200).compareTo(euros(100)), isPositive);
    });

    test('knows zero and negative amounts', () {
      expect(Money.zero(eur).isZero, isTrue);
      expect(euros(-1).isNegative, isTrue);
    });

    test('refuses to mix currencies', () {
      final krona = Money(minorUnits: 100, currency: sek);

      expect(() => euros(100) + krona, throwsArgumentError);
      expect(() => euros(100) - krona, throwsArgumentError);
      expect(() => euros(100) < krona, throwsArgumentError);
      expect(() => euros(100).compareTo(krona), throwsArgumentError);
    });
  });

  group('applyRate', () {
    test('applies a basis point rate exactly', () {
      expect(
        euros(35000000)
            .applyRate(const Rate.bps(80), rounding: Rounding.halfUp),
        euros(280000),
      );
    });

    test('applies a rate published to three decimals exactly', () {
      expect(
        euros(35000000)
            .applyRate(const Rate.ppm(21430), rounding: Rounding.halfUp),
        euros(750050),
      );
    });

    test('rounds to whole units when the rule asks for it', () {
      final price = Money(minorUnits: 324999999, currency: sek);

      expect(
        price.applyRate(
          const Rate.bps(150),
          rounding: const Rounding(mode: RoundingMode.down, step: 100),
        ),
        Money(minorUnits: 4874900, currency: sek),
      );
      expect(
        price.applyRate(const Rate.bps(150), rounding: Rounding.halfUp),
        Money(minorUnits: 4875000, currency: sek),
      );
    });

    test('rounds in currencies without minor units', () {
      final price = Money(minorUnits: 1001, currency: jpy);

      expect(
        price
            .applyRate(const Rate.bps(750), rounding: Rounding.halfUp)
            .minorUnits,
        75,
      );
      expect(
        price
            .applyRate(
              const Rate.bps(750),
              rounding: const Rounding(mode: RoundingMode.up),
            )
            .minorUnits,
        76,
      );
    });
  });

  group('json', () {
    test('round trips', () {
      expect(euros(35000000).toJson(), {
        'minorUnits': 35000000,
        'currency': 'EUR',
      });
      expect(Money.fromJson(euros(35000000).toJson()), euros(35000000));
    });

    test('rejects unknown currencies', () {
      expect(
        () => Money.fromJson({'minorUnits': 1, 'currency': 'XYZ'}),
        throwsFormatException,
      );
    });
  });
}
