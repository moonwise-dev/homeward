import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'household_in.dart';
import 'kept_homes.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class SearchHomes extends AgentTool {
  const SearchHomes(this.markets);

  final MarketDirectory markets;

  @override
  String get name => 'search_homes';

  @override
  String get description =>
      'Searches the labelled sample homes, the only homes Homeward has, in '
      '${[for (final city in markets.cities.values) city.name].join(' and ')}, '
      'by what the buyer asked for. Call it whenever the buyer wants to see '
      'homes, before or after compute_affordability: once that has run in '
      'the market, each home is priced for the household; before, the homes '
      'show their price and fee. Pass only filters the buyer asked for; a '
      'price not in their words is refused. '
      'Areas by city: $_areasText. It seeds /homes for HomeCard, lowest '
      'price first, or says how many homes each filter ruled out. With deal, '
      'it also deals up to six of the matches that differ in kind, outdoor '
      'space, style, and size, for HomeSwipe, when the buyer has not said '
      'what they like.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'city': {
        'type': 'string',
        'enum': [...markets.cities.keys],
      },
      'homeType': {
        'type': 'string',
        'enum': [for (final type in HomeType.values) type.name],
      },
      'minRooms': {
        'type': 'integer',
        'description': 'The fewest rooms, counting the living room.',
      },
      'minBedrooms': {'type': 'integer'},
      'areas': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Areas of the city the buyer named.',
      },
      'outdoor': {
        'type': 'string',
        'enum': [
          for (final space in OutdoorSpace.values)
            if (space != OutdoorSpace.none) space.name,
        ],
        'description': 'A garden also counts as a balcony.',
      },
      'maxPrice': {
        ...amountParameter,
        'description': 'Optional. The highest price the buyer stated.',
      },
      'affordable': {
        'type': 'boolean',
        'description':
            'Only homes whose loan is within the rules and whose cash '
            'needed is within the savings, for the household '
            'compute_affordability last worked out.',
      },
      'deal': {
        'type': 'boolean',
        'description':
            'Also deal a deck of up to six matches that differ, seeded as '
            '/swipe/homes for HomeSwipe.',
      },
    },
    'required': ['city'],
  };

  String get _areasText => [
    for (final city in markets.cities.values)
      '${city.cityId}: ${city.areaNames.join(', ')}',
  ].join('; ');

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final city = markets.cities[arguments['city']];
    if (city == null) {
      return _error(
        'No sample homes there; cities: ${markets.cities.keys.join(', ')}',
      );
    }
    final areas = [
      for (final area in arguments['areas'] as List<Object?>? ?? const [])
        '$area'.toLowerCase(),
    ];
    final unknown = [
      for (final area in areas)
        if (!city.areaNames.any((name) => name.toLowerCase() == area)) area,
    ];
    if (unknown.isNotEmpty) {
      return _error(
        '${unknown.join(', ')} not among the sample areas of ${city.name}: '
        '${city.areaNames.join(', ')}',
      );
    }
    if (isUnsaid(
      arguments['maxPrice'],
      numbersIn(context.buyerWords.join('\n')),
    )) {
      return _error(
        "maxPrice not in the buyer's words; pass only a price they stated, "
        'or leave it out.',
      );
    }
    final household = householdIn(context.slices);
    final forHousehold =
        household?.profile != null && household!.marketId == city.marketId;
    if (arguments['affordable'] == true && !forHousehold) {
      return _error(
        'Nothing to compare with yet; call compute_affordability for this '
        'market first.',
      );
    }
    final currency = markets.packFor(MarketId.parse(city.marketId))!.currency;
    final maxPrice = switch (arguments['maxPrice']) {
      final Object argument => moneyFromArgument(argument, currency),
      null => null,
    };
    if (maxPrice != null && maxPrice.currency != currency) {
      return _error('Pass maxPrice in ${currency?.code}.');
    }
    final earlier = switch (context.slices[homesSlice.name]) {
      final Map<String, Object?> homes => homes.keys,
      _ => const <String>[],
    };
    final priced = markets.pricedHomes(
      {...earlier, for (final listing in city.listings) listing.id},
      household,
      kept: keptHomesIn(context.slices[homesSlice.name]),
    );
    final filters = <String, bool Function(Listing listing)>{
      if (arguments['homeType'] case final String type)
        'homeType': (listing) => listing.homeType.name == type,
      if (arguments['minRooms'] case final int rooms)
        'minRooms': (listing) => listing.rooms >= rooms,
      if (arguments['minBedrooms'] case final int bedrooms)
        'minBedrooms': (listing) => listing.bedrooms >= bedrooms,
      if (areas.isNotEmpty)
        'areas': (listing) => areas.contains(listing.areaName.toLowerCase()),
      if (arguments['outdoor'] case final String outdoor)
        'outdoor': (listing) =>
            listing.outdoor.satisfies(OutdoorSpace.values.byName(outdoor)),
      if (maxPrice != null) 'maxPrice': (listing) => listing.price <= maxPrice,
      if (arguments['affordable'] == true)
        'affordable': (listing) => switch (priced[listing.id]?.cost) {
          final cost? => cost.withinReach,
          null => false,
        },
    };
    final matches = [
      for (final listing in city.listings)
        if (filters.values.every((keeps) => keeps(listing))) listing,
    ]..sort((a, b) => a.price.compareTo(b.price));
    if (matches.isEmpty) {
      return ToolResult(
        modelResult: {
          'homes': const <Object?>[],
          'inCity': city.listings.length,
          'ruledOut': {
            for (final MapEntry(key: name, value: keeps) in filters.entries)
              name: city.listings.where((listing) => !keeps(listing)).length,
          },
          'note':
              'No sample home matches every filter. Tell the buyer, and ask '
              'which one to loosen.',
        },
        logFields: {'matching': 0},
      );
    }
    final deck = arguments['deal'] == true ? swipeDeck(matches) : null;
    return ToolResult(
      modelResult: {
        'deck': ?deck?.map((listing) => listing.id).toList(),
        'homes': [
          for (final listing in matches)
            {
              'id': listing.id,
              'area': listing.areaName,
              'homeType': listing.homeType.name,
              'rooms': listing.rooms,
              'bedrooms': listing.bedrooms,
              'outdoor': listing.outdoor.name,
              if (priced[listing.id]?.cost case final cost?) ...{
                'withinRules': cost.withinRules,
                'withinSavings': ?cost.withinSavings,
              },
            },
        ],
        'inCity': city.listings.length,
        'priced': forHousehold,
        'note':
            'The homes are in /homes, by ID, lowest price first. Show the '
            'ones worth seeing with HomeCard, { "path": "/homes/<id>" }; '
            'never write their figures in your text. '
            '${forHousehold ? 'Each is priced for this household. ' : 'They are not priced for this household: compute_affordability has not run in this market. '}'
            'When the buyer picks one, call compute_affordability with it as '
            'home; when they keep or drop one, call keep_homes.'
            '${deck == null ? '' : _dealNote}',
      },
      seeds: {
        homesSlice.name: {
          for (final id in {...earlier, for (final home in matches) home.id})
            if (priced[id] case final home?)
              id: jsonDecode(jsonEncode(home.toJson())),
        },
        if (deck != null)
          swipeSlice.name: {
            'homes': [
              for (final listing in deck)
                jsonDecode(jsonEncode(priced[listing.id]!.toJson())),
            ],
          },
      },
      logFields: {
        'matching': matches.length,
        'priced': forHousehold,
        'dealt': ?deck?.length,
      },
    );
  }

  static const _dealNote =
      ' The deck is in /swipe/homes: show it with HomeSwipe, '
      '{ "homes": { "path": "/swipe/homes" } } and a done action; when the '
      'buyer finishes, call keep_homes with the kept IDs as keep and the '
      'others as passed.';

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
