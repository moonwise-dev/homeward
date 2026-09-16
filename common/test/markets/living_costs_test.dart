import 'package:common/common.dart';
import 'package:test/test.dart';

import '../support/money_helpers.dart';

void main() {
  final costs = LivingCosts.fromJson({
    'id': 'fixture',
    'currency': 'SEK',
    'year': 2026,
    'individual': [
      {'ageFrom': 0, 'ageTo': 5, 'monthly': '2000'},
      {'ageFrom': 6, 'ageTo': 17, 'monthly': '3000'},
      {'ageFrom': 18, 'monthly': '4000.50'},
    ],
    'household': [
      {'persons': 1, 'monthly': '1000'},
      {'persons': 2, 'monthly': '1500'},
      {'persons': 3, 'monthly': '2000'},
    ],
    'source': {
      'id': 'fixture',
      'publisher': 'Fixture',
      'title': 'Synthetic living costs',
      'url': 'https://example.com',
      'kind': 'officialStatistics',
      'retrievedAt': '2026-09-17',
    },
  });

  test('adds individual costs by age to the shared cost for the household', () {
    expect(
      costs.monthlyFor(adultAge: 34, adults: 1, childAges: const []),
      sek(500050),
    );
    expect(
      costs.monthlyFor(adultAge: 34, adults: 2, childAges: const [3]),
      sek(1200100),
    );
  });

  test('uses the largest listed household size for bigger households', () {
    expect(
      costs.monthlyFor(adultAge: 40, adults: 2, childAges: const [2, 8, 12]),
      sek(1800100),
    );
  });

  test('rejects a household without an adult and ages without a band', () {
    expect(
      () => costs.monthlyFor(adultAge: 34, adults: 0, childAges: const [3]),
      throwsArgumentError,
    );
    expect(
      () => costs.monthlyFor(adultAge: 34, adults: 1, childAges: const [-1]),
      throwsArgumentError,
    );
  });
}
