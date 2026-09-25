import 'package:common/common.dart';
import 'package:homeward_server/samples/pick_sample_homes.dart';
import 'package:test/test.dart';

import '../tools/tool_fixtures.dart';

void main() {
  final stockholm = realMarkets.samples.listingsIn('stockholm');
  final sek = Currency.parse('SEK');
  const kth = Anchor(
    id: 'a1',
    label: 'KTH',
    query: 'KTH',
    point: GeoPoint(lat: 59.3498, lng: 18.0707),
    mode: TravelMode.bike,
    maxMinutes: 25,
  );

  test('a family after a garden near KTH gets three houses', () {
    final pick = pickSampleHomes(
      Story(
        anchors: const [kth],
        homeType: HomeType.house,
        outdoor: OutdoorSpace.garden,
        rooms: 5,
        priceMax: Money(minorUnits: 1500000000, currency: sek),
      ),
      stockholm,
    );

    expect(pick.homes, hasLength(3));
    expect(pick.homes.every((home) => home.homeType == HomeType.house), isTrue);
    expect(pick.considered, stockholm.length);
    expect(pick.ruledOut['type'], greaterThan(0));
    expect(pick.relaxed, isEmpty);
  });

  test('an area the buyer leaned to keeps its homes first', () {
    final pick = pickSampleHomes(
      const Story(homeType: HomeType.flat, areaIds: ['vasastan']),
      stockholm,
    );

    expect(pick.homes.first.areaId, 'vasastan');
    expect(pick.relaxed, contains('area'));
    expect(pick.homes, hasLength(3));
  });

  test('only filters the buyer set are reported as relaxed', () {
    final pick = pickSampleHomes(
      const Story(homeType: HomeType.flat, areaIds: ['vasastan']),
      stockholm,
    );

    expect(pick.relaxed, isNot(contains('price')));
  });

  test('no area gives more than two of the three homes', () {
    final pick = pickSampleHomes(const Story(), stockholm);
    final byArea = <String, int>{};
    for (final home in pick.homes) {
      byArea[home.areaId] = (byArea[home.areaId] ?? 0) + 1;
    }

    expect(byArea.values.every((count) => count <= 2), isTrue);
  });

  test('a price nothing meets relaxes until three remain', () {
    final pick = pickSampleHomes(
      Story(
        homeType: HomeType.house,
        priceMax: Money(minorUnits: 100000000, currency: sek),
      ),
      stockholm,
    );

    expect(pick.homes, hasLength(3));
    expect(pick.relaxed, isNotEmpty);
    expect(pick.toSummary(), containsPair('kept', 3));
  });

  test('the counts add up to every home considered', () {
    for (final story in [
      const Story(homeType: HomeType.house, areaIds: ['danderyd'], rooms: 5),
      const Story(homeType: HomeType.flat),
      const Story(),
    ]) {
      final pick = pickSampleHomes(story, stockholm);
      final ruledOut = pick.ruledOut.values.fold(
        0,
        (sum, count) => sum + count,
      );

      expect(
        ruledOut + pick.fitLessWell + pick.homes.length,
        pick.considered,
      );
    }
  });

  test('the trip estimate grows with distance and mode', () {
    const from = GeoPoint(lat: 59.33, lng: 18.06);
    const near = GeoPoint(lat: 59.335, lng: 18.06);
    const far = GeoPoint(lat: 59.40, lng: 18.06);

    expect(
      estimatedMinutes(from, far, TravelMode.bike),
      greaterThan(estimatedMinutes(from, near, TravelMode.bike)),
    );
    expect(
      estimatedMinutes(from, far, TravelMode.walk),
      greaterThan(estimatedMinutes(from, far, TravelMode.bike)),
    );
  });
}
