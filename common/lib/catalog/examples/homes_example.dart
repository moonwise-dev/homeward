import 'dart:convert';

import '../../affordability/affordability_answer.dart';
import '../../samples/home_cost_for.dart';
import '../../samples/listing.dart';
import '../../samples/priced_home.dart';
import 'stockholm_example.dart';

final stockholmHomesDataModel = _homesDataModel();

final stockholmShortlistDataModel = _homesDataModel(
  kept: {for (final listing in _stockholmHomes) listing.id},
);

Map<String, Object?> _homesDataModel({Set<String> kept = const {}}) => {
  'homes': {
    for (final listing in _stockholmHomes)
      listing.id: jsonDecode(
        jsonEncode(
          PricedHome(
            listing: listing,
            cost: homeCostFor(
              listing,
              market: stockholmMarket,
              household: _household,
            ),
            kept: kept.contains(listing.id),
          ).toJson(),
        ),
      ),
  },
};

final _household = (answerAffordability(
  market: stockholmMarket,
  profile: stockholmProfile,
) as AffordabilityAnswered).slice;

final _stockholmHomes = [
  for (final json in jsonDecode(_stockholmHomesJson) as List<Object?>)
    Listing.fromJson(json! as Map<String, Object?>),
];

const _stockholmHomesJson = '''
[
  {
    "id": "sto-12",
    "areaId": "nacka",
    "areaName": "Nacka",
    "name": "Järla sjö",
    "title": "A loft-style flat by the lake",
    "blurb": "A spiral stair to a sleeping loft, with the trails around Järlasjön outside.",
    "address": "Järla Gårdsväg 12",
    "point": {
      "lat": 59.3060154,
      "lng": 18.1542551
    },
    "homeType": "flat",
    "rooms": 3,
    "bedrooms": 2,
    "sizeM2": 77,
    "floor": 5,
    "yearBuilt": 2019,
    "outdoor": "balcony",
    "style": "modern",
    "price": {
      "minorUnits": 441000000,
      "currency": "SEK"
    },
    "monthlyFee": {
      "minorUnits": 462000,
      "currency": "SEK"
    },
    "pricePerM2": {
      "minorUnits": 5727300,
      "currency": "SEK"
    },
    "areaPricePerM2": {
      "minorUnits": 6033400,
      "currency": "SEK"
    },
    "priceSource": "Svensk Mäklarstatistik, June to August 2026",
    "photos": [
      "sto-12-1",
      "sto-12-2",
      "sto-12-3"
    ],
    "photoCredit": "Photos: Tobias Wilden, Alex Tyson / Unsplash"
  },
  {
    "id": "sto-01",
    "areaId": "vasastan",
    "areaName": "Vasastan",
    "name": "Odengatan",
    "title": "A bright corner flat above Vasaparken",
    "blurb": "Three rooms with tall windows, a tiled stove, and a balcony over the park.",
    "address": "Odengatan 64",
    "point": {
      "lat": 59.3468782,
      "lng": 18.0666359
    },
    "homeType": "flat",
    "rooms": 3,
    "bedrooms": 2,
    "sizeM2": 78,
    "floor": 4,
    "yearBuilt": 1911,
    "outdoor": "balcony",
    "style": "classic",
    "price": {
      "minorUnits": 1031000000,
      "currency": "SEK"
    },
    "monthlyFee": {
      "minorUnits": 468000,
      "currency": "SEK"
    },
    "pricePerM2": {
      "minorUnits": 13217900,
      "currency": "SEK"
    },
    "areaPricePerM2": {
      "minorUnits": 13486000,
      "currency": "SEK"
    },
    "priceSource": "Svensk Mäklarstatistik, June to August 2026",
    "photos": [
      "sto-01-1",
      "sto-01-2",
      "sto-01-3",
      "sto-01-4"
    ],
    "photoCredit": "Photos: Oscar Nord, Taitopia Render, Andrew V / Unsplash"
  }
]
''';
