import 'package:common/common.dart';

import '../../markets/market_directory.dart';
import '../../tools/profile_field_paths.dart';

Map<String, Object?> turnContext({
  required int turn,
  required Plan plan,
  required MarketDirectory markets,
  Set<String> surfacesUsed = const {},
  Map<String, Map<String, Object?>> preRun = const {},
  bool deal = true,
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
      for (final decision in openDecisions(plan, market, deal: deal))
        decision.name,
    ],
    if (deal && marketId != null)
      'market': {
        'marketId': marketId.code,
        'name': markets.nameOf(marketId),
        'coverage': markets.coverageOf(marketId).name,
      },
    if (deal)
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
    'story': _story(plan.story),
    'case': _case(plan.story, markets),
    if (deal)
      'scenario': {
        'committed': plan.scenario != null,
        'draftPending': plan.scenarioDraft != null,
      },
    'surfacesUsed': surfacesUsed.toList(),
    if (preRun.isNotEmpty) 'preRun': preRun,
  };
}

Map<String, Object?> _case(Story story, MarketDirectory markets) {
  final samples = markets.samples;
  final city = samples.city(story.sampleCity);
  return {
    'questionsAsked': story.questions,
    'maxQuestions': maxCaseQuestions,
    'mustAsk': [for (final gap in caseMustAsk(story)) gap.name],
    'open': [for (final gap in caseGaps(story)) gap.name],
    'answered': [for (final facet in story.answered) facet.name],
    'known': {
      'adults': ?story.adults,
      'childAges': ?story.childAges,
      'homeType': ?story.homeType?.name,
      'outdoor': ?story.outdoor?.name,
      'style': ?story.style?.name,
      'rooms': ?story.rooms,
      if (story.needs.isNotEmpty)
        'needs': [for (final need in story.needs) need.name],
      if (story.areaIds.isNotEmpty) 'areas': story.areaIds,
      'priceRangeSet': story.priceMax != null,
    },
    if (city != null)
      'sampleHomes': {
        'city': city.name,
        'homes': samples.listingsIn(city.id).length,
        'areas': [
          for (final area in city.areas)
            {
              'id': area.id,
              'name': area.name,
              'types': [for (final type in area.homeTypes) type.name],
              'character': area.character,
            },
        ],
        'lineups': [
          for (final name in samples.lineupsOf(city.id).keys)
            if (name != 'homes') name,
        ],
      },
  };
}

Map<String, Object?> _story(Story story) => {
  'reason': ?story.reason?.name,
  'city': ?story.city,
  'anchors': [
    for (final anchor in story.anchors)
      {
        'id': anchor.id,
        'label': anchor.label,
        'placed': anchor.point != null,
        'mode': anchor.mode.name,
        'maxMinutes': anchor.maxMinutes,
        'perWeek': anchor.perWeek,
      },
  ],
  'homes': [
    for (final candidate in story.candidates)
      {
        'id': candidate.id,
        'label': candidate.label,
        'placed': candidate.point != null,
        'priceGiven': candidate.price != null,
      },
  ],
  'criteria': [for (final criterion in story.criteria) criterion.id],
  'mustHaves': [
    for (final criterion in story.criteria)
      if (criterion.mustHave) criterion.id,
  ],
  'committed': story.committed,
  if (story.chosen case final chosen?)
    'chosenHome': {
      'id': chosen.id,
      'label': chosen.label,
      'price': ?chosen.price?.toJson(),
    },
};
