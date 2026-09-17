import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('reads a snapshot from a curated market and from a seeded one', () {
    expect(
      MarketSnapshot.ofMarket(stockholmMarket.toJson()),
      MarketSnapshot(id: MarketId.parse('SE'), name: 'Sweden'),
    );
    expect(
      MarketSnapshot.ofMarket(
        uncoveredDataModel['market']! as Map<String, Object?>,
      ),
      MarketSnapshot(
        id: MarketId.parse('AE'),
        name: 'United Arab Emirates',
        coverage: Coverage.uncovered,
      ),
    );
    expect(MarketSnapshot.ofMarket(const {'name': 'Nowhere'}), isNull);
  });
}
