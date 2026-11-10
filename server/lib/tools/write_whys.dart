import 'dart:convert';

import 'package:common/common.dart';

import 'agent_tool.dart';
import 'tool_context.dart';

final class WriteWhys extends AgentTool {
  const WriteWhys();

  static const maxWords = 6;
  static const maxHomes = 16;

  @override
  String get name => 'write_whys';

  @override
  String get description =>
      'Writes why each home on the map suits this household, shown under '
      'its price: at most $maxWords words, from what map_homes answered '
      'about the home and what the household told you, such as "Shortest '
      'ride to KTH, balcony" or "Garden, quiet road, room for two". Never a '
      'figure: the map shows those. Up to $maxHomes homes, from nearestFirst.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'whys': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'home': {
              'type': 'string',
              'description': 'The home ID from map_homes.',
            },
            'why': {'type': 'string'},
          },
          'required': ['home', 'why'],
        },
      },
    },
    'required': ['whys'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final json = context.slices[mapSlice.name];
    if (json is! Map<String, Object?>) {
      return const ToolResult(
        modelResult: {'error': 'Call map_homes first; there is no map yet.'},
      );
    }
    final map = CityHomes.fromJson(json);
    final whys = <String, String>{};
    final refused = <String>[];
    for (final entry in arguments['whys'] as List<Object?>? ?? const []) {
      if (entry case {'home': final String id, 'why': final String why}) {
        final text = why.trim().replaceAll(RegExp(r'[.\s]+$'), '');
        final words = text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
        if (map.home(id) == null) {
          refused.add('$id is not a home on the map.');
        } else if (words.length > maxWords) {
          refused.add('$id: at most $maxWords words.');
        } else if (RegExp(r'\d').hasMatch(text)) {
          refused.add('$id: no figures; the map shows them.');
        } else if (whys.length < maxHomes) {
          whys[id] = text;
        }
      }
    }
    if (whys.isEmpty) {
      return ToolResult(
        modelResult: {'error': 'No why was written.', 'problems': refused},
      );
    }
    final updated = map.copyWith(
      homes: [
        for (final home in map.homes)
          whys.containsKey(home.listing.id)
              ? home.copyWith(why: whys[home.listing.id])
              : home,
      ],
    );
    return ToolResult(
      modelResult: {
        'written': whys.length,
        if (refused.isNotEmpty) 'refused': refused,
        'note': 'The whys are on the map; never repeat them in your text.',
      },
      seeds: {mapSlice.name: jsonDecode(jsonEncode(updated.toJson()))},
      logFields: {'whys': whys.length, 'refused': refused.length},
    );
  }
}
