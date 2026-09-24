import 'package:common/common.dart';

import '../research/open_data/geo_place.dart';
import '../research/open_data/nominatim.dart';
import '../research/open_data/open_data_unavailable.dart';
import 'agent_tool.dart';
import 'amount_arguments.dart';

final class ProposeStoryTool extends ModelTool {
  const ProposeStoryTool(this._nominatim);

  final Nominatim _nominatim;

  static const maxCandidates = 3;

  @override
  String get name => 'propose_story';

  @override
  String get description =>
      "Record the buyer's story as they told it: why they are moving, where "
      'to, the places they travel to often, the homes or areas they are '
      'weighing, and what matters to them. Call it with everything the buyer '
      'said whenever the story changes. The server finds each place on the '
      'map and returns what it placed and what it could not. Only the buyer '
      'confirms the story, with commit_story.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'reason': {
        'type': 'string',
        'enum': [for (final reason in StoryReason.values) reason.name],
        'description': 'Why the buyer is moving.',
      },
      'city': {
        'type': 'string',
        'description':
            'The city or region they are moving to, as a map search finds '
            'it, such as Stockholm or Funchal.',
      },
      'anchors': {
        'type': 'array',
        'description': 'Places the buyer travels to often: work, school.',
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
        'description': 'Homes or areas the buyer is weighing, at most three.',
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
    final cityPlace = city == null ? null : await _locate(city, null);
    final box = cityPlace?.box;
    final placed = <String, GeoPlace>{};

    Future<GeoPoint?> point(String query, GeoPoint? known) async {
      if (known != null) {
        return known;
      }
      final place = await _locate(query, box);
      if (place != null) {
        placed[query] = place;
      }
      return place?.point;
    }

    final anchors = arguments['anchors'] is List<Object?>
        ? [
            for (final (index, item) in _items(arguments['anchors']).indexed)
              await _anchor(index, item, previous, point),
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
    final mustHaves = _kinds(arguments['mustHaves']);
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
    final story = previous.copyWith(
      reason: _reason(arguments['reason']) ?? previous.reason,
      city: city,
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
        if (market != null && plan.marketId == null)
          'market': {
            'marketId': market.code,
            'coverage': context.markets.coverageOf(market).name,
          },
      },
      plan: plan.copyWith(story: story, marketId: market),
    );
  }

  Future<GeoPlace?> _locate(String query, GeoBox? box) async {
    try {
      return await _nominatim.locate(query, within: box);
    } on OpenDataUnavailable {
      return null;
    }
  }

  Future<Anchor> _anchor(
    int index,
    Map<String, Object?> item,
    Story previous,
    Future<GeoPoint?> Function(String, GeoPoint?) point,
  ) async {
    final query = item['query'] as String? ?? item['label'] as String? ?? '';
    final known = previous.anchors
        .where((anchor) => anchor.query == query)
        .firstOrNull;
    return Anchor(
      id: known?.id ?? 'a${index + 1}',
      label: item['label'] as String? ?? query,
      query: query,
      point: await point(query, known?.point),
      mode:
          _enum(TravelMode.values, item['mode']) ??
          known?.mode ??
          TravelMode.transit,
      maxMinutes:
          (item['maxMinutes'] as num?)?.toInt() ?? known?.maxMinutes ?? 30,
    );
  }

  Future<Candidate> _candidate(
    int index,
    Map<String, Object?> item,
    Story previous,
    Future<GeoPoint?> Function(String, GeoPoint?) point,
    ToolContext context,
  ) async {
    final query = item['query'] as String? ?? item['label'] as String? ?? '';
    final known = previous.candidates
        .where((candidate) => candidate.query == query)
        .firstOrNull;
    final located = await point(query, known?.point);
    return Candidate(
      id: known?.id ?? 'c${index + 1}',
      label: item['label'] as String? ?? query,
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
