import 'dart:convert';

import 'package:common/common.dart';

import 'story_seed.dart';

Map<String, Object?> turnSeeds(
  Plan plan,
  Iterable<Map<String, Object?>> toolSeeds,
) {
  final scenario = plan.scenarioDraft ?? plan.scenario;
  final seeds = <String, Object?>{
    selectionSlice.name: const <String, Object?>{},
    storySlice.name: storySeed(plan.story),
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
