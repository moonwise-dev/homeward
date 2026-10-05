import 'dart:convert';

import 'package:common/common.dart';

import '../research/open_data/geo_place.dart';
import '../research/open_data/open_data_unavailable.dart';
import '../research/research.dart';
import 'agent_tool.dart';
import 'tool_context.dart';

final class FindPlace extends AgentTool {
  const FindPlace(this.research);

  final Research research;

  static final _id = RegExp(r'^[a-z0-9-]{1,40}$');

  @override
  String get name => 'find_place';

  @override
  String get description =>
      'Finds the places the buyer names, such as work, a school, or a '
      "parent's home, on OpenStreetMap within the city they are in, so every "
      'place shown is checked. Give the city, and each place an ID, the '
      'short name the buyer uses, and a search in the words the buyer used, '
      'such as "KTH" or "Karolinska University Hospital Solna". It seeds '
      '/places and answers with the address it found for each; when an '
      'address is not the place the buyer means, search again with more '
      'detail, and ask the buyer where a place it could not find is.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'city': {
        'type': 'string',
        'description': 'The city the places are in, such as Stockholm.',
      },
      'places': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'id': {
              'type': 'string',
              'description': 'Lowercase letters, digits, and dashes.',
            },
            'name': {'type': 'string'},
            'search': {'type': 'string'},
          },
          'required': ['id', 'name', 'search'],
        },
      },
    },
    'required': ['city', 'places'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final wanted = [
      for (final place in arguments['places'] as List<Object?>? ?? const [])
        if (place case {
          'id': final String id,
          'name': final String name,
          'search': final String search,
        })
          (id: id, name: name.trim(), search: search.trim()),
    ];
    if (wanted.isEmpty) {
      return _error('Pass each place with an id, a name, and a search.');
    }
    final badIds = [
      for (final place in wanted)
        if (!_id.hasMatch(place.id)) place.id,
    ];
    if (badIds.isNotEmpty) {
      return _error(
        '${badIds.join(', ')}: IDs are lowercase letters, digits, and dashes.',
      );
    }
    final city = '${arguments['city'] ?? ''}'.trim();
    final GeoPlace? area;
    try {
      area = city.isEmpty
          ? null
          : await context.steps.track(
              'Finding $city',
              () => research.nominatim.locate(city),
              measured: (located) => located != null,
            );
    } on OpenDataUnavailable {
      return _error('OpenStreetMap search did not answer; try again shortly.');
    }
    final found = <Place>[];
    final notFound = <String>[];
    final unavailable = <String>[];
    for (final place in wanted) {
      try {
        switch (await context.steps.track(
          'Finding ${place.name}',
          () => research.nominatim.locate(place.search, within: area?.box),
          measured: (located) => located != null,
        )) {
          case final GeoPlace geo:
            found.add(
              Place(
                id: place.id,
                name: place.name,
                address: geo.address,
                point: geo.point,
              ),
            );
          case null:
            notFound.add(place.id);
        }
      } on OpenDataUnavailable {
        unavailable.add(place.id);
      }
    }
    final places = {
      ...switch (context.slices[placesSlice.name]) {
        final Map<String, Object?> places => places,
        _ => const <String, Object?>{},
      },
      for (final place in found)
        place.id: jsonDecode(jsonEncode(place.toJson())),
    };
    return ToolResult(
      modelResult: {
        'found': [
          for (final place in found)
            {'id': place.id, 'name': place.name, 'address': place.address},
        ],
        if (notFound.isNotEmpty) 'notFound': notFound,
        if (unavailable.isNotEmpty)
          'unavailable': {
            'ids': unavailable,
            'why': 'OpenStreetMap search did not answer; try again shortly.',
          },
        'note':
            'The places are in /places. WeekMap shows them on a map, '
            '"markers": { "path": "/places" }, and measure_week measures '
            'the trips to them from a home.',
      },
      seeds: {if (found.isNotEmpty) placesSlice.name: places},
      logFields: {
        'found': found.length,
        'notFound': notFound.length,
        'unavailable': unavailable.length,
      },
    );
  }

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
