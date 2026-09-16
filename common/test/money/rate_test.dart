import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('basis points convert to parts per million', () {
    expect(const Rate.bps(25).partsPerMillion, 2500);
    expect(const Rate.bps(10000), Rate.hundredPercent);
  });

  test('keeps rates published to three decimals exact', () {
    expect(const Rate.ppm(21430).fraction, closeTo(0.02143, 1e-12));
  });

  test('adds, subtracts, and negates', () {
    expect(const Rate.bps(250) + const Rate.bps(200), const Rate.bps(450));
    expect(const Rate.bps(250) - const Rate.bps(300), const Rate.bps(-50));
    expect(-const Rate.bps(250), const Rate.bps(-250));
  });

  test('compares', () {
    expect(const Rate.bps(700) > const Rate.ppm(69999), isTrue);
    expect(const Rate.bps(700) <= const Rate.ppm(70000), isTrue);
    expect(const Rate.bps(100).compareTo(const Rate.bps(200)), isNegative);
  });
}
