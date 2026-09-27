import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  group('parse', () {
    for (final text in ['0', '2658.66', '132933', '0.0001']) {
      test('accepts $text', () {
        expect(ExactDecimal.parse(text).text, text);
      });
    }

    for (final text in ['', '-1', '01', '1.', '.5', '1,5', '1e3', ' 1']) {
      test('rejects "$text"', () {
        expect(() => ExactDecimal.parse(text), throwsFormatException);
      });
    }
  });

  group('scaledBy', () {
    test('scales exactly to the requested places', () {
      expect(ExactDecimal.parse('2658.66').scaledBy(2), 265866);
      expect(ExactDecimal.parse('7.5').scaledBy(4), 75000);
      expect(ExactDecimal.parse('132933').scaledBy(2), 13293300);
    });

    test('refuses more places than requested and unsafe magnitudes', () {
      expect(
        () => ExactDecimal.parse('1.234').scaledBy(2),
        throwsFormatException,
      );
      expect(
        () => ExactDecimal.parse('1234567890123456').scaledBy(0),
        throwsFormatException,
      );
    });
  });

  group('fromScaled', () {
    const cases = <(int, int, String)>[
      (75000, 4, '7.5'),
      (1000000, 4, '100'),
      (1, 4, '0.0001'),
      (0, 2, '0'),
      (265866, 2, '2658.66'),
    ];

    for (final (value, places, expected) in cases) {
      test('$value with $places places is $expected', () {
        expect(ExactDecimal.fromScaled(value, places).text, expected);
      });
    }
  });
}
