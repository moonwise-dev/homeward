import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import '../research/listing_reader.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'tool_context.dart';

final class ReadListings extends AgentTool {
  const ReadListings(this.markets, this.reader);

  final MarketDirectory markets;
  final ListingReader reader;

  static const maxNeeds = 6;
  static final _id = RegExp(r'^[a-z0-9-]{1,40}$');

  @override
  String get name => 'read_listings';

  @override
  String get description =>
      'Reads sample homes for what the household needs the home itself to '
      'have, named from their story: step-free entry for a parent, a bath for '
      'the children, a quiet bedroom, room for a desk. Give the home IDs, or '
      'a city to read all its sample homes, and each need with an ID, the '
      "buyer's short words, and what counts as meeting it. Each home is "
      'answered per need: meets, rules it out, or says nothing, with the '
      'sentence quoted word for word. It seeds /reads/<id> for ListingQuote.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'homes': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Sample home IDs from search_homes.',
      },
      'city': {
        'type': 'string',
        'enum': [for (final city in markets.cities.values) city.name],
        'description': 'Instead of homes, read every sample home in the city.',
      },
      'needs': {
        'type': 'array',
        'description': 'One to $maxNeeds needs.',
        'items': {
          'type': 'object',
          'properties': {
            'id': {
              'type': 'string',
              'description': 'Lowercase letters, digits, and dashes.',
            },
            'label': {
              'type': 'string',
              'description':
                  'The need in the buyer\'s short words, such as '
                  '"No stairs for Mum".',
            },
            'meaning': {
              'type': 'string',
              'description':
                  'What counts as meeting it, such as "the home can be '
                  'reached from the street without steps: a level entrance, '
                  'a ramp, or a lift from a level hall".',
            },
          },
          'required': ['id', 'label', 'meaning'],
        },
      },
    },
    'required': ['needs'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final researcher = context.researcher;
    if (researcher == null) {
      return _error('Reading listings is not available in this turn.');
    }
    final needs = [
      for (final need in arguments['needs'] as List<Object?>? ?? const [])
        if (need case {
          'id': final String id,
          'label': final String label,
          'meaning': final String meaning,
        })
          HomeNeed(id: id, label: label.trim(), meaning: meaning.trim()),
    ];
    if (needs.isEmpty || needs.length > maxNeeds) {
      return _error(
        'Pass one to $maxNeeds needs, each with an id, a label, and a '
        'meaning.',
      );
    }
    final badIds = [
      for (final need in needs)
        if (!_id.hasMatch(need.id)) need.id,
    ];
    if (badIds.isNotEmpty) {
      return _error(
        '${badIds.join(', ')}: IDs are lowercase letters, digits, and dashes.',
      );
    }
    final city = switch (arguments['city']) {
      final String name =>
        markets.cities.values.where((city) => city.name == name).firstOrNull,
      _ => null,
    };
    final ids = [
      for (final id in arguments['homes'] as List<Object?>? ?? const []) '$id',
    ];
    final unknown = [
      for (final id in ids)
        if (markets.home(id) == null) id,
    ];
    if (unknown.isNotEmpty) {
      return _error(
        'No sample home ${unknown.join(', ')}; take the IDs from '
        'search_homes.',
      );
    }
    final listings = [
      ...?city?.listings,
      for (final id in ids)
        if (city?.listings.any((listing) => listing.id == id) != true)
          markets.home(id)!.listing,
    ];
    if (listings.isEmpty) {
      return _error('Pass the homes to read, or a city.');
    }
    final Map<String, List<NeedReading>> readings;
    try {
      readings = await context.steps.track(
        listings.length == 1
            ? 'Reading the listing of ${listings.single.addressLine}'
            : 'Reading ${listings.length} listings',
        () => reader.read(listings, needs, researcher),
      );
    } on Exception {
      return _error('The listings could not be read just now; try again.');
    }
    final earlier = switch (context.slices[readsSlice.name]) {
      final Map<String, Object?> reads => reads,
      _ => const <String, Object?>{},
    };
    final homes = {
      for (final listing in listings)
        listing.id: ListingReading(
          homeId: listing.id,
          homeName: listing.addressLine,
          description: listing.description,
          readings: [
            ...?switch (earlier[listing.id]) {
              final Map<String, Object?> json =>
                ListingReading.fromJson(
                  json,
                ).readings.where(
                  (reading) => !needs.any((need) => need.id == reading.needId),
                ),
              _ => null,
            },
            ...readings[listing.id]!,
          ],
        ),
    };
    List<String> needsWith(String id, ReadVerdict verdict) => [
      for (final reading in readings[id]!)
        if (reading.verdict == verdict) reading.needId,
    ];
    final all = readings.values.expand((list) => list);
    return ToolResult(
      modelResult: {
        'homes': [
          for (final listing in listings)
            {
              'id': listing.id,
              'meets': needsWith(listing.id, ReadVerdict.meets),
              'rulesOut': needsWith(listing.id, ReadVerdict.fails),
              'saysNothing': needsWith(listing.id, ReadVerdict.silent),
            },
        ],
        'draw': [
          for (final listing in listings.take(3))
            block('read-${listing.id}', 'ListingQuote', {
              'reading': boundTo('/reads/${listing.id}'),
            }),
        ],
        'note':
            'The readings are in /reads/<id>; a ListingQuote highlights '
            "the listing's own words, so never quote the listing in your "
            'text. $drawNote Draw the homes worth reading, another the '
            'same way with its ID. A home that rules '
            'out a need the buyer must have can be left out; says nothing is '
            'for the buyer to ask about or check at a viewing.',
      },
      seeds: {
        readsSlice.name: {
          ...earlier,
          for (final MapEntry(:key, :value) in homes.entries)
            key: jsonDecode(jsonEncode(value.toJson())),
        },
      },
      logFields: {
        'homes': listings.length,
        'needs': needs.length,
        'meets': all.where((r) => r.verdict == ReadVerdict.meets).length,
        'rulesOut': all.where((r) => r.verdict == ReadVerdict.fails).length,
      },
    );
  }

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
