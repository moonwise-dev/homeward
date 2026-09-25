import 'dart:convert';

import '../../geo/geo_point.dart';
import '../../money/currency.dart';
import '../../money/money.dart';
import '../../samples/area_option.dart';
import '../../samples/home_style.dart';
import '../../samples/home_type.dart';
import '../../samples/listing.dart';
import '../../samples/outdoor_space.dart';
import '../../story/assessment/assess_story.dart';
import '../../story/candidate.dart';
import '../../story/travel_mode.dart';
import 'stockholm_story_example.dart';

final _sek = Currency.parse('SEK');

Money _kronor(int amount) => Money(minorUnits: amount * 100, currency: _sek);

const _priceSource = 'Svensk Mäklarstatistik, June to August 2026';

final caseLineupDataModel = {
  'lineup': {
    'homes': [
      {
        'id': 'sto-01-2',
        'caption': 'High ceilings in a 1900s block',
        'credit': 'Taitopia Render / Unsplash',
      },
      {
        'id': 'sto-06-1',
        'caption': 'A new-build with a big balcony',
        'credit': 'Samuel Bryngelsson / Unsplash',
      },
      {
        'id': 'sto-11-1',
        'caption': 'A wooden house with a garden',
        'credit': 'Rebecca Johansson / Unsplash',
      },
      {
        'id': 'sto-10-1',
        'caption': 'A villa by the water',
        'credit': 'Nick Russill / Unsplash',
      },
    ],
  },
};

final caseTradeOffDataModel = jsonDecode(
  jsonEncode({
    'tradeoff': {
      'options': [
        AreaOption(
          id: 'o1',
          areaId: 'danderyd',
          areaName: 'Danderyd',
          character: 'Leafy villas, strong schools, the metro to the city',
          homeType: HomeType.house,
          rooms: 5,
          sizeM2: 150,
          price: _kronor(13830000),
          pricePerM2: _kronor(92204),
          priceSource: _priceSource,
          minutes: 22,
          mode: TravelMode.bike,
          anchorLabel: 'KTH',
        ).toJson(),
        AreaOption(
          id: 'o2',
          areaId: 'vasastan',
          areaName: 'Vasastan',
          character: 'Grand 1900s blocks, cafés and parks, the city on foot',
          homeType: HomeType.flat,
          rooms: 3,
          sizeM2: 75,
          price: _kronor(10110000),
          pricePerM2: _kronor(134860),
          priceSource: _priceSource,
          minutes: 8,
          mode: TravelMode.bike,
          anchorLabel: 'KTH',
        ).toJson(),
      ],
    },
  }),
) as Map<String, Object?>;

final _odengatan = Listing(
  id: 'sto-01',
  areaId: 'vasastan',
  areaName: 'Vasastan',
  name: 'Odengatan',
  title: 'A bright corner flat above Vasaparken',
  blurb:
      'Three rooms with tall windows, a tiled stove, and a balcony over '
      'the park.',
  address: 'Odengatan 64',
  point: const GeoPoint(lat: 59.3443, lng: 18.0560),
  homeType: HomeType.flat,
  rooms: 3,
  bedrooms: 2,
  sizeM2: 78,
  floor: 4,
  yearBuilt: 1911,
  outdoor: OutdoorSpace.balcony,
  style: HomeStyle.classic,
  price: _kronor(10250000),
  monthlyFee: _kronor(4290),
  pricePerM2: _kronor(131410),
  areaPricePerM2: _kronor(134860),
  priceSource: _priceSource,
  photos: const ['sto-01-1', 'sto-01-2', 'sto-01-3', 'sto-01-4'],
);

final _solna = Listing(
  id: 'sto-07',
  areaId: 'solna',
  areaName: 'Solna',
  name: 'Ulriksdal',
  title: 'A terraced house with a garden by the woods',
  blurb:
      'Five rooms over two floors and a south-facing garden that runs into '
      'the woods.',
  address: 'Ulriksdalsvägen 12',
  point: const GeoPoint(lat: 59.3589, lng: 17.9995),
  homeType: HomeType.house,
  rooms: 5,
  bedrooms: 4,
  sizeM2: 132,
  yearBuilt: 2014,
  outdoor: OutdoorSpace.garden,
  style: HomeStyle.modern,
  price: _kronor(10640000),
  pricePerM2: _kronor(80600),
  areaPricePerM2: _kronor(83906),
  priceSource: _priceSource,
  photos: const ['sto-07-1', 'sto-07-2', 'sto-07-3', 'sto-07-4'],
);

final sampleHomesStory = stockholmStory.copyWith(
  candidates: [
    Candidate(
      id: 'c1',
      label: _odengatan.name,
      query: _odengatan.address,
      point: _odengatan.point,
      price: _odengatan.price,
      listing: _odengatan,
    ),
    Candidate(
      id: 'c2',
      label: _solna.name,
      query: _solna.address,
      point: _solna.point,
      price: _solna.price,
      listing: _solna,
    ),
  ],
);

final sampleHomesDataModel = jsonDecode(
  jsonEncode({
    'assessment': assessStory(
      sampleHomesStory,
      stockholmStoryMeasurements,
    ).toJson(),
  }),
) as Map<String, Object?>;
