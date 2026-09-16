import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('accepts countries and subdivisions', () {
    expect(MarketId.parse('PT').isRegion, isFalse);
    expect(MarketId.parse('PT-30').isRegion, isTrue);
    expect(MarketId.parse('PT-30').country, MarketId.parse('PT'));
    expect(MarketId.parse('US-FL').code, 'US-FL');
  });

  for (final code in ['pt', 'PRT', 'PT-', 'PT-ABCD', 'Madeira']) {
    test('rejects $code', () {
      expect(() => MarketId.parse(code), throwsFormatException);
    });
  }
}
