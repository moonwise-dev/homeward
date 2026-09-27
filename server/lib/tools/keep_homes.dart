import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'household_in.dart';
import 'kept_homes.dart';
import 'tool_context.dart';

final class KeepHomes extends AgentTool {
  const KeepHomes(this.markets);

  final MarketDirectory markets;

  @override
  String get name => 'keep_homes';

  @override
  String get description =>
      "Keeps sample homes on the household's shortlist or drops them, when "
      'the buyer taps Keep or Drop or says so, by the IDs search_homes gave. '
      'It marks them in /homes, which Shortlist binds, and answers with the '
      'kept IDs.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'keep': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'drop': {
        'type': 'array',
        'items': {'type': 'string'},
      },
    },
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final keep = _ids(arguments['keep']);
    final drop = _ids(arguments['drop']);
    if (keep.isEmpty && drop.isEmpty) {
      return _error('Pass the IDs to keep or drop.');
    }
    final unknown = [
      for (final id in {...keep, ...drop})
        if (markets.home(id) == null) id,
    ];
    if (unknown.isNotEmpty) {
      return _error(
        'No sample home ${unknown.join(', ')}; take the IDs from '
        'search_homes.',
      );
    }
    final homes = switch (context.slices[homesSlice.name]) {
      final Map<String, Object?> homes => homes,
      _ => const <String, Object?>{},
    };
    final kept = {...keptHomesIn(homes), ...keep}..removeAll(drop);
    final shortlist = {
      for (final MapEntry(:key, :value) in homes.entries)
        if (value case final Map<String, Object?> home)
          key: {...home, 'kept': kept.contains(key)},
      for (final MapEntry(:key, :value)
          in markets
              .pricedHomes(
                keep.where((id) => !homes.containsKey(id)),
                householdIn(context.slices),
                kept: kept,
              )
              .entries)
        key: jsonDecode(jsonEncode(value.toJson())),
    };
    return ToolResult(
      modelResult: {
        'kept': [
          for (final id in shortlist.keys)
            if (kept.contains(id)) id,
        ],
        'note':
            'Show the kept homes with Shortlist, { "path": "/homes" }, and '
            'two or three side by side with HomeComparison.',
      },
      seeds: {homesSlice.name: shortlist},
      logFields: {'kept': kept.length},
    );
  }

  static List<String> _ids(Object? value) => [
    for (final id in value as List<Object?>? ?? const []) '$id',
  ];

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
