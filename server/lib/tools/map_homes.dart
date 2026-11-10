import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import '../research/open_data/open_data_unavailable.dart';
import '../research/open_data/travel_route.dart';
import '../research/research.dart';
import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'draw.dart';
import 'household_in.dart';
import 'tool_context.dart';

final class MapHomes extends AgentTool {
  const MapHomes(this.markets, this.research);

  final MarketDirectory markets;
  final Research research;

  static const maxTrips = 3;
  static const maxPerWeek = 7;
  static const maxPathPoints = 60;
  static const listedForYou = 16;
  static const measuredAreas = 6;

  @override
  String get name => 'map_homes';

  @override
  bool get needsTheHousehold => true;

  @override
  String get description =>
      'Puts every sample home of a city on the map for this household: each '
      'priced for them against what compute_affordability worked out, or by '
      'the rent of a home like it when they rent, and whether it is within '
      'their budget; then, from the centre of the $measuredAreas areas with a '
      "home in budget that lie nearest their week, the week's trips measured "
      'by open routing, each to a place from /places with how many times a '
      'week they go there and back and how they travel. It seeds /map and '
      'draws the HomeMap, and answers with the homes in budget, nearest '
      'first, and how many of them have each must-have.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'city': {
        'type': 'string',
        'enum': [...markets.cities.keys],
      },
      'renting': {
        'type': 'boolean',
        'description':
            'The household rents: each home is priced by the rent a home '
            'like it costs a month, an estimate from its area.',
      },
      'maxRent': {
        'description':
            'Only when renting, and only a rent a month they stated, as an '
            'amount with its currency.',
      },
      'trips': {
        'type': 'array',
        'description':
            'The places of their week, each found with find_place first. '
            'Empty when they named none.',
        'items': {
          'type': 'object',
          'properties': {
            'place': {
              'type': 'string',
              'description': 'The ID find_place gave the place in /places.',
            },
            'perWeek': {
              'type': 'integer',
              'description':
                  'Days a week they go there, each day one trip there and '
                  'back, 1 to $maxPerWeek: five for a full-time job.',
            },
            'mode': {
              'type': 'string',
              'enum': [for (final mode in TravelMode.values) mode.name],
            },
            'assumed': {
              'type': 'boolean',
              'description':
                  'True when you chose the times a week or the way they '
                  'travel because their words did not say.',
            },
          },
          'required': ['place', 'perWeek', 'mode'],
        },
      },
    },
    'required': ['city', 'trips'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final city = markets.cities['${arguments['city']}'];
    if (city == null) {
      return _error('Pass a city: ${markets.cities.keys.join(' or ')}.');
    }
    final found = _placesIn(context.slices);
    final wanted = [
      for (final trip in arguments['trips'] as List<Object?>? ?? const [])
        if (trip case {
          'place': final String place,
          'perWeek': final int perWeek,
          'mode': final String mode,
        })
          (
            place: place,
            perWeek: perWeek,
            mode: mode,
            assumed: (trip as Map<String, Object?>)['assumed'] == true,
          ),
    ];
    final problems = [
      if (wanted.length > maxTrips) 'At most $maxTrips trips.',
      for (final trip in wanted) ...[
        if (!found.containsKey(trip.place))
          '${trip.place} is not in /places; find it with find_place first.',
        if (trip.perWeek < 1 || trip.perWeek > maxPerWeek)
          '${trip.place}: perWeek is 1 to $maxPerWeek.',
        if (!TravelMode.values.any((mode) => mode.name == trip.mode))
          '${trip.place}: mode is one of '
              '${TravelMode.values.map((mode) => mode.name).join(', ')}.',
      ],
    ];
    if (problems.isNotEmpty) {
      return ToolResult(
        modelResult: {'error': 'Nothing was mapped.', 'problems': problems},
      );
    }
    final renting = arguments['renting'] == true;
    final currency = markets.packFor(MarketId.parse(city.marketId))?.currency;
    final household = switch (householdIn(context.slices)) {
      final slice? when slice.marketId == city.marketId => slice,
      _ => null,
    };
    final maxRent = switch (arguments['maxRent']) {
      final Object argument when renting && currency != null =>
        moneyFromArgument(argument, currency),
      _ => null,
    };
    if (maxRent != null && maxRent.currency != currency) {
      return _error('Pass maxRent in ${currency?.code}.');
    }
    final places = [
      for (final trip in wanted)
        MapPlace(
          id: trip.place,
          name: found[trip.place]!.name,
          point: found[trip.place]!.point,
          perWeek: trip.perWeek,
          mode: TravelMode.values.byName(trip.mode),
          assumed: trip.assumed,
        ),
    ];
    final earlier = _whysIn(context.slices);
    final homes = [
      for (final listing in city.listings)
        _priced(
          listing,
          household: renting ? null : household,
          renting: renting,
          maxRent: maxRent,
          why: earlier[listing.id],
        ),
    ];
    final areas = await context.steps.track(
      places.isEmpty ? 'Pricing every home' : 'Measuring your week',
      () => _areas(city, homes, places),
      measured: (areas) => places.isEmpty || areas.isNotEmpty,
    );
    final map = CityHomes(
      cityId: city.cityId,
      cityName: city.name,
      centre: _centre([for (final listing in city.listings) listing.point]),
      renting: renting,
      highestPrice: renting ? maxRent : household?.maxPrice,
      household: MapHousehold(
        adults: household?.profile?.adults,
        childAges: household?.profile?.childAges,
        grossMonthlyIncome: household?.profile?.grossMonthlyIncome,
        savings: household?.profile?.savings ?? household?.savings,
        maxRent: maxRent,
        assumed: household?.assumed ?? const {},
      ),
      places: places,
      areas: areas,
      homes: homes,
    );
    final inBudget = map.ranked(map.affordable);
    return ToolResult(
      modelResult: {
        'city': city.name,
        'homes': homes.length,
        'inBudget': inBudget.length,
        'priced': renting || household != null,
        'nearestFirst': [
          for (final home in inBudget.take(listedForYou))
            {
              'id': home.listing.id,
              'area': home.listing.areaName,
              'homeType': home.listing.homeType.name,
              'bedrooms': home.listing.bedrooms,
              'sizeM2': home.listing.sizeM2,
              'outdoor': home.listing.outdoor.name,
              'lift': ?home.listing.lift,
              'yearBuilt': ?home.listing.yearBuilt,
              'minutesTo': {
                for (final place in places)
                  place.name: ?map.minutesTo(home, place.id),
              },
            },
        ],
        'mustHavesInBudget': {
          for (final kind in MustHaveKind.values)
            if (!kind.takesNumber)
              kind.name: inBudget
                  .where((home) => MustHaveRule(kind).keeps(home.listing))
                  .length,
          for (final bedrooms in [2, 3, 4])
            'bedrooms $bedrooms': inBudget
                .where((home) => home.listing.bedrooms >= bedrooms)
                .length,
        },
        'draw': [
          block('map', 'HomeMap', {'map': boundTo('/${mapSlice.name}')}),
        ],
        'note':
            'The homes are on the map in /map; never write a price, a count, '
            'or the minutes in your text. $drawNote '
            '${inBudget.isEmpty ? _emptyNote : _nextNote}',
      },
      seeds: {mapSlice.name: jsonDecode(jsonEncode(map.toJson()))},
      logFields: {
        'homes': homes.length,
        'inBudget': inBudget.length,
        'measuredAreas': areas.where((area) => area.minutes.isNotEmpty).length,
      },
    );
  }

  MapHome _priced(
    Listing listing, {
    required AffordabilitySlice? household,
    required bool renting,
    required Money? maxRent,
    required String? why,
  }) {
    if (renting) {
      final rent = RentFigure.like(listing);
      return MapHome(
        listing: listing.copyWith(description: ''),
        rent: rent,
        withinBudget: maxRent == null ? null : rent.monthly <= maxRent,
        why: why,
      );
    }
    final profile = household?.profile;
    final market = household == null || profile == null
        ? null
        : markets.resolveFor(MarketId.parse(household.marketId), profile);
    final slice = market == null
        ? null
        : homeAffordability(listing, market: market, household: household!);
    final cost = slice == null ? null : HomeCost.of(slice);
    return MapHome(
      listing: listing.copyWith(description: ''),
      cost: cost,
      ifRatesRise: switch (slice?.stress) {
        final stress? => _costAt(stress, stress.stressRate),
        null => null,
      },
      withinBudget: cost?.withinReach,
      why: why,
    );
  }

  Money? _costAt(StressCurve stress, Rate rate) {
    for (final point in stress.points) {
      if (point.annualRate == rate) {
        return point.cost;
      }
    }
    return stress.points.isEmpty ? null : stress.points.last.cost;
  }

  Future<List<MapArea>> _areas(
    ListingInventory city,
    List<MapHome> homes,
    List<MapPlace> places,
  ) async {
    final byArea = <String, List<MapHome>>{};
    for (final home in homes) {
      byArea.putIfAbsent(home.listing.areaId, () => []).add(home);
    }
    final centres = {
      for (final MapEntry(key: areaId, value: inArea) in byArea.entries)
        areaId: _centre([for (final home in inArea) home.listing.point]),
    };
    int nearness(String areaId) => places.fold(
      0,
      (sum, place) =>
          sum + centres[areaId]!.metersTo(place.point) * place.perWeek,
    );
    final measured =
        ([
              for (final MapEntry(key: areaId, value: inArea) in byArea.entries)
                if (inArea.any((home) => home.withinBudget != false)) areaId,
            ]..sort((a, b) => nearness(a).compareTo(nearness(b))))
            .take(measuredAreas)
            .toSet();
    return Future.wait([
      for (final MapEntry(key: areaId, value: inArea) in byArea.entries)
        _area(
          areaId,
          inArea,
          centres[areaId]!,
          measured.contains(areaId) ? places : const [],
        ),
    ]);
  }

  Future<MapArea> _area(
    String areaId,
    List<MapHome> inArea,
    GeoPoint centre,
    List<MapPlace> places,
  ) async {
    final routes = await Future.wait([
      for (final place in places) _route(centre, place.point, place.mode),
    ]);
    return MapArea(
      areaId: areaId,
      areaName: inArea.first.listing.areaName,
      centre: centre,
      minutes: {
        for (final (index, route) in routes.indexed)
          if (route != null) places[index].id: route.minutes,
      },
      routes: {
        for (final (index, route) in routes.indexed)
          if (route != null && route.path.length > 1)
            places[index].id: encodePolyline(
              simplifyPath(route.path, maxPoints: maxPathPoints),
            ),
      },
    );
  }

  Future<TravelRoute?> _route(
    GeoPoint from,
    GeoPoint to,
    TravelMode mode,
  ) async {
    try {
      return await research.routing.route(from, to, mode);
    } on OpenDataUnavailable {
      return null;
    }
  }

  static GeoPoint _centre(List<GeoPoint> points) => GeoPoint(
    lat: points.fold(0.0, (sum, point) => sum + point.lat) / points.length,
    lng: points.fold(0.0, (sum, point) => sum + point.lng) / points.length,
  );

  static Map<String, Place> _placesIn(Map<String, Object?> slices) =>
      switch (slices[placesSlice.name]) {
        final Map<String, Object?> places => {
          for (final MapEntry(:key, :value) in places.entries)
            if (value is Map<String, Object?>) key: Place.fromJson(value),
        },
        _ => const {},
      };

  static Map<String, String> _whysIn(Map<String, Object?> slices) =>
      switch (slices[mapSlice.name]) {
        final Map<String, Object?> json => {
          for (final home in CityHomes.fromJson(json).homes)
            home.listing.id: ?home.why,
        },
        _ => const {},
      };

  static const _nextNote =
      'Next, call write_whys for the homes in nearestFirst, then offer the '
      'must-haves that split them.';

  static const _emptyNote =
      'No home is within their budget: say so in one line, and offer what '
      'would change it, such as renting or a larger budget.';

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
