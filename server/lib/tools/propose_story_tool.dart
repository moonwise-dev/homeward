import 'package:common/common.dart';

import '../research/open_data/geo_place.dart';
import '../research/open_data/nominatim.dart';
import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'locate_place.dart';

final class ProposeStoryTool extends ModelTool {
  const ProposeStoryTool(this._nominatim);

  final Nominatim _nominatim;

  static const maxCandidates = 3;

  @override
  String get name => 'propose_story';

  @override
  String get description =>
      "Record the buyer's story as they told it: why they are moving, where "
      'to, the places they travel to often, the homes they are weighing, and '
      'what matters to them, with your assumptions marked by leaving out what '
      'you would only be guessing at. Call it with everything the buyer said '
      'whenever the story changes. The server finds each place on the map and '
      'returns what it placed and what it could not. Only the buyer confirms '
      'the story, with commit_story.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'reason': {
        'type': 'string',
        'enum': [for (final reason in StoryReason.values) reason.name],
        'description':
            'Why the buyer is moving, only when they said it; leave it out '
            'rather than guess from a place.',
      },
      'city': {
        'type': 'string',
        'description':
            'The city or region they are moving to, as a map search finds '
            'it, such as Stockholm or Funchal.',
      },
      'mode': {
        'type': 'string',
        'enum': [for (final mode in TravelMode.values) mode.name],
        'description':
            'How the buyer will most likely get around, as an assumption '
            'unless they said it; anchors without their own mode use it.',
      },
      'maxMinutes': {
        'type': 'integer',
        'description':
            'The longest trip the buyer would accept, as an assumption '
            'unless they said it.',
      },
      'anchors': {
        'type': 'array',
        'description':
            'Places the buyer named that they travel to often: work, school. '
            'Leave it out when they named none; they can drop a pin.',
        'items': {
          'type': 'object',
          'properties': {
            'label': {
              'type': 'string',
              'description': 'What the buyer calls it, such as KTH.',
            },
            'query': {
              'type': 'string',
              'description':
                  'What to search on a map, without the city, such as KTH '
                  'or Sveavägen 20.',
            },
            'mode': {
              'type': 'string',
              'enum': [for (final mode in TravelMode.values) mode.name],
            },
            'maxMinutes': {'type': 'integer'},
          },
          'required': ['label', 'query'],
        },
      },
      'candidates': {
        'type': 'array',
        'maxItems': maxCandidates,
        'description':
            'Homes or areas the buyer named as ones they are weighing, at '
            'most three. Never invent them; leave the list out when they '
            'named none.',
        'items': {
          'type': 'object',
          'properties': {
            'label': {
              'type': 'string',
              'description': 'Short name, such as Odengatan or Solna.',
            },
            'query': {
              'type': 'string',
              'description':
                  'What to search on a map, without the city, such as '
                  'Odengatan 50 or Solna centrum.',
            },
            'price': {
              ...amountParameter,
              'description': 'The asking price, if the buyer said it.',
            },
            'listingUrl': {'type': 'string'},
          },
          'required': ['label', 'query'],
        },
      },
      'criteria': {
        'type': 'array',
        'description':
            'What the story makes relevant, beyond the commute to each anchor.',
        'items': {
          'type': 'string',
          'enum': [
            for (final kind in CriterionKind.values)
              if (kind != CriterionKind.commute) kind.name,
          ],
        },
      },
      'mustHaves': {
        'type': 'array',
        'description': 'Criteria the buyer said they will not give up.',
        'items': {
          'type': 'string',
          'enum': [for (final kind in CriterionKind.values) kind.name],
        },
      },
      'adults': {
        'type': 'integer',
        'description': 'Adults moving, only when the buyer said who moves.',
      },
      'childAges': {
        'type': 'array',
        'description': 'The age of each child moving, when the buyer said.',
        'items': {'type': 'integer'},
      },
      'homeType': {
        'type': 'string',
        'enum': [for (final type in HomeType.values) type.name],
        'description': 'Flat or house, only when the buyer said which.',
      },
      'outdoor': {
        'type': 'string',
        'enum': [for (final outdoor in OutdoorSpace.values) outdoor.name],
        'description': 'The outdoor space the buyer said they want.',
      },
      'rooms': {
        'type': 'integer',
        'description':
            'The rooms the buyer said they need, living room included.',
      },
      'needs': {
        'type': 'array',
        'description':
            'What the home itself must have, only when the buyer said so, '
            'such as step-free entry for a parent or pets for their dog.',
        'items': {
          'type': 'string',
          'enum': [for (final need in HomeNeed.values) need.name],
        },
      },
    },
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final plan = context.plan;
    final previous = plan.story;
    final city = arguments['city'] as String? ?? previous.city;
    final steps = context.steps;
    final cityPlace = city == null
        ? null
        : await locatePlace(_nominatim, city, city, null, steps);
    final box = cityPlace?.box;
    final placed = <String, GeoPlace>{};

    Future<GeoPoint?> point(String query, String label, GeoPoint? known) async {
      if (known != null) {
        return known;
      }
      final place = await locatePlace(_nominatim, query, label, box, steps);
      if (place != null) {
        placed[query] = place;
      }
      return place?.point;
    }

    final mode = _enum(TravelMode.values, arguments['mode']) ?? previous.mode;
    final maxMinutes =
        (arguments['maxMinutes'] as num?)?.toInt() ?? previous.maxMinutes;
    final anchors = arguments['anchors'] is List<Object?>
        ? [
            for (final (index, item) in _items(arguments['anchors']).indexed)
              await _anchor(index, item, previous, point, mode, maxMinutes),
          ]
        : previous.anchors;
    final candidates = arguments['candidates'] is List<Object?>
        ? [
            for (final (index, item) in _items(
              arguments['candidates'],
            ).take(maxCandidates).indexed)
              await _candidate(index, item, previous, point, context),
          ]
        : previous.candidates;
    final mustHaves = arguments.containsKey('mustHaves')
        ? _kinds(arguments['mustHaves'])
        : {
            for (final criterion in previous.criteria)
              if (criterion.mustHave) criterion.kind,
          };
    final kinds = {..._kinds(arguments['criteria']), ...mustHaves}
      ..remove(CriterionKind.commute);
    final criteria =
        arguments.containsKey('criteria') || arguments.containsKey('mustHaves')
        ? [
            for (final anchor in anchors)
              Criterion(
                kind: CriterionKind.commute,
                anchorId: anchor.id,
                mustHave: mustHaves.contains(CriterionKind.commute),
              ),
            for (final kind in CriterionKind.values)
              if (kinds.contains(kind))
                Criterion(kind: kind, mustHave: mustHaves.contains(kind)),
          ]
        : previous.criteria;
    final adults = (arguments['adults'] as num?)?.toInt();
    final homeType = _enum(HomeType.values, arguments['homeType']);
    final outdoor = _enum(OutdoorSpace.values, arguments['outdoor']);
    final rooms = (arguments['rooms'] as num?)?.toInt();
    final needs = arguments['needs'] is List<Object?>
        ? [
            for (final name in arguments['needs'] as List<Object?>)
              ?_enum(HomeNeed.values, name),
          ]
        : null;
    final sampleCity = city == null
        ? null
        : context.markets.samples.cityNamed(city)?.id;
    final story = previous
        .answering({
          if (adults != null) CaseFacet.household,
          if (homeType != null) CaseFacet.homeType,
          if (outdoor != null) CaseFacet.outdoor,
          if (rooms != null) CaseFacet.rooms,
          if (needs != null && needs.isNotEmpty) CaseFacet.needs,
        })
        .copyWith(
          reason: _reason(arguments['reason']) ?? previous.reason,
          city: city,
          sampleCity: sampleCity,
          adults: adults ?? previous.adults,
          childAges: arguments['childAges'] is List<Object?>
              ? [
                  for (final age in arguments['childAges'] as List<Object?>)
                    if (age is num) age.toInt(),
                ]
              : previous.childAges,
          homeType: homeType ?? previous.homeType,
          outdoor: outdoor ?? previous.outdoor,
          rooms: rooms ?? previous.rooms,
          needs: needs == null || needs.isEmpty ? previous.needs : needs,
          cityPoint:
              cityPlace?.point ??
              (city == previous.city ? previous.cityPoint : null),
          mode: mode,
          maxMinutes: maxMinutes,
          anchors: anchors,
          candidates: candidates,
          criteria: criteria,
          committed: false,
          chosenCandidateId: null,
        );
    final market = plan.marketId ?? _marketOf(cityPlace, placed, context);
    return ToolResult(
      modelResult: {
        if (city != null) 'cityFound': cityPlace != null,
        'anchors': [
          for (final anchor in anchors)
            {
              'id': anchor.id,
              'label': anchor.label,
              'placed': anchor.point != null,
              'address': ?placed[anchor.query]?.address,
            },
        ],
        'candidates': [
          for (final candidate in candidates)
            {
              'id': candidate.id,
              'label': candidate.label,
              'placed': candidate.point != null,
              'address': ?candidate.address,
            },
        ],
        'criteria': [for (final criterion in criteria) criterion.id],
        'sampleHomes': sampleCity != null,
        if (market != null && plan.marketId == null)
          'market': {
            'marketId': market.code,
            'coverage': context.markets.coverageOf(market).name,
          },
      },
      plan: plan.copyWith(story: story, marketId: market),
    );
  }

  Future<Anchor> _anchor(
    int index,
    Map<String, Object?> item,
    Story previous,
    Future<GeoPoint?> Function(String, String, GeoPoint?) point,
    TravelMode? mode,
    int? maxMinutes,
  ) async {
    final query = item['query'] as String? ?? item['label'] as String? ?? '';
    final known = previous.anchors
        .where((anchor) => anchor.query == query)
        .firstOrNull;
    final label = item['label'] as String? ?? query;
    return Anchor(
      id: known?.id ?? 'a${index + 1}',
      label: label,
      query: query,
      point: await point(query, label, known?.point),
      mode:
          _enum(TravelMode.values, item['mode']) ??
          known?.mode ??
          mode ??
          TravelMode.transit,
      maxMinutes:
          (item['maxMinutes'] as num?)?.toInt() ??
          known?.maxMinutes ??
          maxMinutes ??
          30,
    );
  }

  Future<Candidate> _candidate(
    int index,
    Map<String, Object?> item,
    Story previous,
    Future<GeoPoint?> Function(String, String, GeoPoint?) point,
    ToolContext context,
  ) async {
    final query = item['query'] as String? ?? item['label'] as String? ?? '';
    final known = previous.candidates
        .where((candidate) => candidate.query == query)
        .firstOrNull;
    final label = item['label'] as String? ?? query;
    final located = await point(query, label, known?.point);
    return Candidate(
      id: known?.id ?? 'c${index + 1}',
      label: label,
      query: query,
      point: located,
      address: known?.address,
      price: _price(item['price'], context) ?? known?.price,
      listingUrl: item['listingUrl'] as String? ?? known?.listingUrl,
    );
  }

  Money? _price(Object? argument, ToolContext context) {
    if (argument == null) {
      return null;
    }
    final market = switch (context.plan.marketId) {
      final id? => context.markets.resolveFor(id, context.plan.profile),
      null => null,
    };
    try {
      return moneyFromArgument(argument, market?.currency);
    } on FormatException {
      return null;
    }
  }

  MarketId? _marketOf(
    GeoPlace? city,
    Map<String, GeoPlace> placed,
    ToolContext context,
  ) {
    final markets = context.markets;
    for (final place in [?city, ...placed.values]) {
      final region = _marketId(place.regionCode);
      if (region != null &&
          markets.isKnown(region) &&
          markets.hasDistinctRules(region)) {
        return region;
      }
      final country = _marketId(place.countryCode);
      if (country != null && markets.isKnown(country)) {
        return country;
      }
    }
    return null;
  }

  MarketId? _marketId(String? code) {
    if (code == null) {
      return null;
    }
    try {
      return MarketId.parse(code);
    } on FormatException {
      return null;
    }
  }

  List<Map<String, Object?>> _items(Object? list) => [
    if (list is List<Object?>)
      for (final item in list)
        if (item is Map<String, Object?>) item,
  ];

  Set<CriterionKind> _kinds(Object? list) => {
    if (list is List<Object?>)
      for (final item in list) ?_enum(CriterionKind.values, item),
  };

  StoryReason? _reason(Object? value) => _enum(StoryReason.values, value);

  T? _enum<T extends Enum>(List<T> values, Object? name) =>
      values.where((value) => value.name == name).firstOrNull;
}
