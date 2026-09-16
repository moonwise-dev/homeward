import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  const converter = PercentJsonConverter();

  const cases = <(String, int)>[
    ('7.5%', 75000),
    ('0.0001%', 1),
    ('100%', 1000000),
    ('0%', 0),
  ];

  for (final (text, ppm) in cases) {
    test('$text is $ppm ppm and back', () {
      expect(converter.fromJson(text), Rate.ppm(ppm));
      expect(converter.toJson(Rate.ppm(ppm)), text);
    });
  }

  for (final text in ['7.5', '7.55555%', '-1%', '%']) {
    test('rejects $text', () {
      expect(() => converter.fromJson(text), throwsFormatException);
    });
  }
}
