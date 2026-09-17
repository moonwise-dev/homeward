import 'package:common/common.dart';

import '../../markets/market_directory.dart';
import '../../tools/profile_field_paths.dart';

Map<String, Object?> turnContext({
  required int turn,
  required Plan plan,
  required MarketDirectory markets,
  Set<String> surfacesUsed = const {},
  Map<String, Map<String, Object?>> preRun = const {},
}) {
  final marketId = plan.marketId;
  final market = marketId == null
      ? null
      : markets.resolveFor(marketId, plan.profile);
  final profile = plan.profile.toJson();
  final amounts = {
    for (final field in profileSlice.fields)
      if (field.kind == FieldKind.money) field.name,
  };
  return {
    'turn': turn,
    'openDecisions': [
      for (final decision in openDecisions(plan, market)) decision.name,
    ],
    if (marketId != null)
      'market': {
        'marketId': marketId.code,
        'name': markets.nameOf(marketId),
        'coverage': markets.coverageOf(marketId).name,
      },
    'profile': {
      'facts': {
        for (final MapEntry(:key, :value) in profile.entries)
          if (!amounts.contains(key)) key: value,
      },
      'amountsGiven': [
        for (final key in profile.keys)
          if (amounts.contains(key)) key,
      ],
      if (market != null)
        'missing': [
          for (final field in missingProfileFields(plan.profile, market))
            {'field': field.name, 'paths': profileFieldPaths(field)},
        ],
      'draftPending': plan.profileDraft != null,
    },
    'scenario': {
      'committed': plan.scenario != null,
      'draftPending': plan.scenarioDraft != null,
    },
    'surfacesUsed': surfacesUsed.toList(),
    if (preRun.isNotEmpty) 'preRun': preRun,
  };
}
