import 'dart:convert';

import '../../areas/city_homes.dart';
import '../../geo/geo_point.dart';
import '../../geo/travel_mode.dart';
import '../../samples/home_cost_for.dart';
import 'homes_example.dart';
import 'stockholm_example.dart';

const _kth = GeoPoint(lat: 59.34978, lng: 18.07092);

final stockholmHomeMap = CityHomes(
  cityId: 'stockholm',
  cityName: 'Stockholm',
  centre: const GeoPoint(lat: 59.3293, lng: 18.0686),
  highestPrice: stockholmHousehold.maxPrice,
  household: MapHousehold(
    adults: stockholmProfile.adults,
    grossMonthlyIncome: stockholmProfile.grossMonthlyIncome,
    savings: stockholmProfile.savings,
  ),
  places: const [
    MapPlace(
      id: 'kth',
      name: 'KTH',
      point: _kth,
      perWeek: 5,
      mode: TravelMode.transit,
    ),
  ],
  areas: [
    for (final (index, listing) in stockholmSampleHomes.indexed)
      MapArea(
        areaId: listing.areaId,
        areaName: listing.areaName,
        centre: listing.point,
        minutes: {'kth': 18 + index * 13},
      ),
  ],
  homes: [
    for (final listing in stockholmSampleHomes)
      MapHome(
        listing: listing,
        cost: homeCostFor(
          listing,
          market: stockholmMarket,
          household: stockholmHousehold,
        ),
        withinBudget: homeCostFor(
          listing,
          market: stockholmMarket,
          household: stockholmHousehold,
        )?.withinReach,
        why: switch (listing.areaId) {
          'nacka' => 'Balcony, lift, by the water',
          _ => 'Close to KTH, classic rooms',
        },
      ),
  ],
);

final stockholmHomeMapDataModel = {
  'map': jsonDecode(jsonEncode(stockholmHomeMap.toJson())),
};
