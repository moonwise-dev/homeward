import 'dart:convert';

import '../../affordability/affordability_answer.dart';
import '../../samples/home_cost_for.dart';
import '../../samples/listing.dart';
import '../../rent/rent_figure.dart';
import '../../samples/priced_home.dart';
import 'stockholm_example.dart';

final stockholmHomesDataModel = _homesDataModel();

final stockholmRentingDataModel = {
  'homes': {
    for (final listing in stockholmSampleHomes)
      listing.id: jsonDecode(
        jsonEncode(
          PricedHome(
            listing: listing,
            rent: RentFigure.like(listing),
          ).toJson(),
        ),
      ),
  },
};

final stockholmShortlistDataModel = _homesDataModel(
  kept: {for (final listing in stockholmSampleHomes) listing.id},
);

final stockholmSwipeDataModel = {
  'swipe': {
    'homes': [
      for (final listing in stockholmSampleHomes)
        jsonDecode(jsonEncode(_priced(listing, kept: false).toJson())),
    ],
  },
};

Map<String, Object?> _homesDataModel({Set<String> kept = const {}}) => {
  'homes': {
    for (final listing in stockholmSampleHomes)
      listing.id: jsonDecode(
        jsonEncode(
          _priced(listing, kept: kept.contains(listing.id)).toJson(),
        ),
      ),
  },
};

PricedHome _priced(Listing listing, {required bool kept}) => PricedHome(
  listing: listing,
  cost: homeCostFor(
    listing,
    market: stockholmMarket,
    household: stockholmHousehold,
  ),
  kept: kept,
);

final stockholmHousehold = (answerAffordability(
  market: stockholmMarket,
  profile: stockholmProfile,
) as AffordabilityAnswered).slice;

final stockholmSampleHomes = [
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
    "description": "A loft-style flat on the fifth floor of a 2019 building by Järlasjön. The living room rises two storeys, and a spiral stair leads to a sleeping loft; the second bedroom is on the entry level. The building is step-free from the street, with a lift to every floor. The bathroom has a walk-in shower and underfloor heating. The balcony looks over the lake and the trails of the Nacka nature reserve. The association allows pets.",
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
    "areaRentPerM2": {
      "minorUnits": 15158,
      "currency": "SEK"
    },
    "rentSource": "Statistics Sweden, median rent of first-hand leases in Nacka in 2025, which take years in the housing queue",
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
    "areaRentPerM2": {
      "minorUnits": 15700,
      "currency": "SEK"
    },
    "rentSource": "Statistics Sweden, median rent of first-hand leases in Norra innerstaden in 2025, which take years in the housing queue",
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
