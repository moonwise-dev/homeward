import 'dart:convert';

import 'package:common/common.dart';

import 'story_seed.dart';

Map<String, Object?> turnSeeds(
  Plan plan,
  Iterable<Map<String, Object?>> toolSeeds, {
  Map<String, List<Photo>> lineups = const {},
}) {
  final scenario = plan.scenarioDraft ?? plan.scenario;
  final options = plan.story.areaOptions;
  final seeds = <String, Object?>{
    selectionSlice.name: const <String, Object?>{},
    storySlice.name: storySeed(plan.story),
    if (lineups.isNotEmpty)
      lineupSlice.name: {
        for (final MapEntry(key: name, value: photos) in lineups.entries)
          name: [
            for (final photo in photos)
              {
                'id': photo.id,
                'caption': photo.caption,
                'credit': '${photo.credit.name} / Unsplash',
              },
          ],
      },
    if (options.isNotEmpty)
      tradeOffSlice.name: {
        'options': [for (final option in options) option.toJson()],
      },
    for (final slices in toolSeeds) ...slices,
    profileSlice.name: (plan.profileDraft ?? plan.profile).toJson(),
  };
  if (scenario == null) {
    seeds.remove(scenarioSlice.name);
  } else {
    seeds[scenarioSlice.name] = scenario.toJson();
  }
  return jsonDecode(jsonEncode(seeds)) as Map<String, Object?>;
}
