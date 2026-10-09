import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
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
      'kept IDs. After a HomeSwipe, pass the kept IDs as keep and the others '
      'as passed: it also answers with what every kept home shares that a '
      'passed one lacks.';

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
      'passed': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'The homes the buyer passed on in HomeSwipe.',
      },
    },
  };

  @override
  Map<String, Object?>? argumentsForTap(
    String action,
    Map<String, Object?> context,
  ) => switch ((action, context)) {
    ('keep_home', {'home': final String home, 'keep': final bool keep}) => {
      keep ? 'keep' : 'drop': [home],
    },
    ('drop_home', {'home': final String home}) => {
      'drop': [home],
    },
    _ => null,
  };

  static String _chooses(Object? homes) =>
      rentingIn(homes) ? 'split_this_rent' : 'work_out_home';

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final keep = _ids(arguments['keep']);
    final drop = _ids(arguments['drop']);
    final passed = _ids(arguments['passed']);
    if (keep.isEmpty && drop.isEmpty && passed.isEmpty) {
      return _error('Pass the IDs to keep or drop.');
    }
    final unknown = [
      for (final id in {...keep, ...drop, ...passed})
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
                renting: rentingIn(homes),
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
        if (passed.isNotEmpty) 'swipe': _swipePattern(keep, passed),
        'draw': [
          block('shortlist', 'Shortlist', {
            'homes': boundTo('/homes'),
            'choose': sends(_chooses(homes)),
            'drop': sends('drop_home'),
          }),
          if (kept.length >= 2)
            block('comparison', 'HomeComparison', {
              'homes': [
                for (final id in shortlist.keys.where(kept.contains).take(3))
                  boundTo('/homes/$id'),
              ],
              'choose': sends(_chooses(homes)),
            }),
        ],
        'note': drawNote,
      },
      seeds: {homesSlice.name: shortlist},
      logFields: {'kept': kept.length},
    );
  }

  Map<String, Object?> _swipePattern(List<String> keep, List<String> passed) {
    final kept = [for (final id in keep) markets.home(id)!.listing];
    final reading = readSwipe(kept, [
      for (final id in passed) markets.home(id)!.listing,
    ]);
    return {
      'kept': kept.length,
      'passed': passed.length,
      'everyKeptHome': {
        'homeType': ?reading.homeType?.name,
        'outdoor': ?reading.outdoor?.name,
        'style': ?reading.style?.name,
      },
      'keptAreas': {for (final home in kept) home.areaName}.toList(),
      'note':
          'A clue, not a fact: offer what the kept homes share as a '
          'deduction for the buyer to confirm.',
    };
  }

  static List<String> _ids(Object? value) => [
    for (final id in value as List<Object?>? ?? const []) '$id',
  ];

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
