import 'dart:math';

import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../support/exact_rounding.dart';

void main() {
  group('divide', () {
    const cases = <(RoundingMode, int, int, int)>[
      (RoundingMode.halfUp, 25, 10, 3),
      (RoundingMode.halfUp, 24, 10, 2),
      (RoundingMode.halfUp, -25, 10, -3),
      (RoundingMode.halfUp, 25, -10, -3),
      (RoundingMode.halfEven, 25, 10, 2),
      (RoundingMode.halfEven, 35, 10, 4),
      (RoundingMode.halfEven, -25, 10, -2),
      (RoundingMode.halfEven, -35, 10, -4),
      (RoundingMode.halfEven, 251, 100, 3),
      (RoundingMode.down, 29, 10, 2),
      (RoundingMode.down, -29, 10, -2),
      (RoundingMode.up, 21, 10, 3),
      (RoundingMode.up, -21, 10, -3),
      (RoundingMode.up, 20, 10, 2),
    ];

    for (final (mode, dividend, divisor, expected) in cases) {
      test('${mode.name} $dividend / $divisor is $expected', () {
        expect(Rounding(mode: mode).divide(dividend, divisor), expected);
      });
    }
  });

  group('divide to step', () {
    const cases = <(RoundingMode, int, int)>[
      (RoundingMode.halfUp, 12350, 12400),
      (RoundingMode.halfUp, 12349, 12300),
      (RoundingMode.halfUp, -12350, -12400),
      (RoundingMode.halfEven, 12250, 12200),
      (RoundingMode.halfEven, 12350, 12400),
      (RoundingMode.down, 12399, 12300),
      (RoundingMode.up, 12301, 12400),
    ];

    for (final (mode, minorUnits, expected) in cases) {
      test('${mode.name} $minorUnits to whole units is $expected', () {
        expect(Rounding(mode: mode, step: 100).divide(minorUnits, 1), expected);
      });
    }
  });

  group('scale', () {
    test('half even breaks ties on the parity of the whole result', () {
      const rounding = Rounding(mode: RoundingMode.halfEven);

      expect(rounding.scale(3500000, 1, 1000000), 4);
      expect(rounding.scale(2500000, 1, 1000000), 2);
    });

    test('stays exact for prices in high-denomination currencies', () {
      expect(Rounding.halfUp.scale(1000000000000, 75000, 1000000), 75000000000);
    });

    test('matches exact big integer arithmetic', () {
      final random = Random(4217);
      const steps = [1, 100, 1000];

      for (var i = 0; i < 10000; i++) {
        final rounding = Rounding(
          mode: RoundingMode.values[random.nextInt(RoundingMode.values.length)],
          step: steps[random.nextInt(steps.length)],
        );
        final magnitude =
            random.nextInt(1 << 20) * (1 << 20) + random.nextInt(1 << 20);
        final value = random.nextBool() ? magnitude : -magnitude;
        final multiplier = random.nextInt(2000001);
        final divisor = random.nextBool()
            ? 1000000
            : random.nextInt(900001) + 100000;

        expect(
          rounding.scale(value, multiplier, divisor),
          exactScale(rounding, value, multiplier, divisor),
          reason: '$rounding $value * $multiplier / $divisor',
        );
      }
    });
  });

  group('scale range', () {
    test('refuses products beyond exact integer range', () {
      expect(
        () => Rounding.halfUp.scale(1, 1000000, 10000000000),
        throwsArgumentError,
      );
      expect(
        () => Rounding.halfUp.scale(10000000000000, 1000000, 1),
        throwsArgumentError,
      );
    });
  });

  group('roundFraction', () {
    test('rounds a whole part plus a fraction once', () {
      expect(Rounding.halfUp.roundFraction(2, 5, 10), 3);
      expect(Rounding.down.roundFraction(2, 19, 10), 3);
      expect(Rounding.halfUp.roundFraction(-2, -5, 10), -3);
    });

    test('refuses mixed signs and a divisor that is not positive', () {
      expect(
        () => Rounding.halfUp.roundFraction(-2, 5, 10),
        throwsArgumentError,
      );
      expect(() => Rounding.halfUp.roundFraction(2, 5, 0), throwsArgumentError);
    });
  });

  group('roundDouble', () {
    const cases = <(RoundingMode, int, double, int)>[
      (RoundingMode.halfUp, 1, 2.5, 3),
      (RoundingMode.halfUp, 1, 2.4999999, 2),
      (RoundingMode.halfUp, 1, -2.5, -3),
      (RoundingMode.halfEven, 1, 2.5, 2),
      (RoundingMode.halfEven, 1, 3.5, 4),
      (RoundingMode.halfEven, 1, -2.5, -2),
      (RoundingMode.halfEven, 1, 2.5000001, 3),
      (RoundingMode.down, 1, 2.9, 2),
      (RoundingMode.down, 1, -2.9, -2),
      (RoundingMode.up, 1, 2.1, 3),
      (RoundingMode.up, 1, -2.1, -3),
      (RoundingMode.up, 1, 42.0, 42),
      (RoundingMode.halfUp, 100, 12350.0, 12400),
      (RoundingMode.halfUp, 100, 12349.9, 12300),
      (RoundingMode.down, 100, 12399.9, 12300),
    ];

    for (final (mode, step, value, expected) in cases) {
      test('${mode.name} $value to step $step is $expected', () {
        expect(Rounding(mode: mode, step: step).roundDouble(value), expected);
      });
    }

    test('refuses values that are not finite or not exact integers', () {
      expect(
        () => Rounding.halfUp.roundDouble(double.nan),
        throwsArgumentError,
      );
      expect(
        () => Rounding.halfUp.roundDouble(double.infinity),
        throwsArgumentError,
      );
      expect(() => Rounding.halfUp.roundDouble(1e16), throwsArgumentError);
    });
  });

  group('json', () {
    test('round trips', () {
      const rounding = Rounding(mode: RoundingMode.halfEven, step: 100);

      expect(rounding.toJson(), {'mode': 'halfEven', 'step': 100});
      expect(Rounding.fromJson(rounding.toJson()), rounding);
    });

    test('defaults step to one minor unit', () {
      expect(
        Rounding.fromJson({'mode': 'down'}),
        const Rounding(mode: RoundingMode.down),
      );
    });
  });

  test('rejects a step that is not positive', () {
    expect(
      () => Rounding.fromJson({'mode': 'halfUp', 'step': 0}),
      throwsA(
        isA<CheckedFromJsonException>().having(
          (error) => error.innerError,
          'innerError',
          isA<AssertionError>(),
        ),
      ),
    );
  });
}
