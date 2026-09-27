import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('reads each part', () {
    final period = Period.parse('P1Y6M2W3D');

    expect(period.years, 1);
    expect(period.months, 6);
    expect(period.weeks, 2);
    expect(period.days, 3);
    expect(Period.parse('P6M').years, 0);
  });

  for (final text in ['P', '2Y', 'P1.5Y', 'PT2H', 'P2M1Y']) {
    test('rejects $text', () {
      expect(() => Period.parse(text), throwsFormatException);
    });
  }
}
