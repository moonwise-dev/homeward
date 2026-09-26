import 'package:common/common.dart';
import 'package:homeward_server/samples/swipe_deck.dart';
import 'package:test/test.dart';

import '../tools/tool_fixtures.dart';

void main() {
  final stockholm = realMarkets.samples.listingsIn('stockholm');
  Listing home(String id) => stockholm.firstWhere((home) => home.id == id);

  test('deals six homes that differ, flats and houses in turn', () {
    final deck = swipeDeck(stockholm);

    expect(deck, hasLength(6));
    expect(deck.map((home) => home.homeType).take(4), [
      HomeType.flat,
      HomeType.house,
      HomeType.flat,
      HomeType.house,
    ]);
    expect(
      {for (final home in deck) (home.homeType, home.outdoor, home.style)},
      hasLength(greaterThanOrEqualTo(5)),
    );
  });

  test('reads what every kept home shares and no passed one has', () {
    final reading = readSwipe(
      [home('sto-07'), home('sto-09')],
      [home('sto-01'), home('sto-02'), home('sto-06')],
    );

    expect(reading.homeType, HomeType.house);
    expect(reading.outdoor, OutdoorSpace.garden);
    expect(reading.style, isNull);
  });

  test('keeping nothing settles nothing', () {
    final reading = readSwipe(const [], [home('sto-01'), home('sto-07')]);

    expect(reading, (homeType: null, outdoor: null, style: null));
  });
}
