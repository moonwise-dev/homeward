import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../markets/market_directory.dart';
import '../../samples/swipe_deck.dart';
import 'action_outcome.dart';

ActionOutcome caseAnswer({
  required ClientAction action,
  required Map<String, Map<String, Object?>> form,
  required Plan plan,
  required MarketDirectory markets,
  required Map<String, Object?> summary,
}) {
  final context = action.context;
  final facet = _enum(CaseFacet.values, context['facet']);
  final value = context['value'];
  final label = context['label'] as String?;
  ActionOutcome refused(String reason) => ActionOutcome(
    plan: plan,
    summary: {...summary, 'applied': false, 'reason': reason},
  );
  if (facet == null) {
    return refused('The answer names no facet of the story');
  }
  final story = plan.story;
  final answered = _answered(facet, story, value, context, form, markets);
  if (answered == null) {
    return refused('That answer does not fit ${facet.name}');
  }
  final (next, facets, placeToFind) = answered;
  return ActionOutcome(
    plan: plan.copyWith(
      story: next
          .answering({facet, ...facets})
          .copyWith(questions: story.questions + 1),
    ),
    summary: {
      ...summary,
      'applied': true,
      'facet': facet.name,
      'label': ?label,
      if (facet == CaseFacet.swipe)
        'pattern': switch (_swiped(context, story, markets)) {
          (final kept, final passed) => swipePattern(
            kept,
            passed,
            readSwipe(kept, passed),
          ),
        },
      'stillOpen': [
        for (final gap in caseGaps(next.answering({facet, ...facets})))
          gap.name,
      ],
    },
    placeToFind: placeToFind,
  );
}

typedef _Answered = (Story, Set<CaseFacet>, PlaceToFind?);

_Answered? _answered(
  CaseFacet facet,
  Story story,
  Object? value,
  Map<String, Object?> context,
  Map<String, Map<String, Object?>> form,
  MarketDirectory markets,
) {
  final label = context['label'] as String?;
  switch (facet) {
    case CaseFacet.place:
      if (context['pin'] case {'lat': final num lat, 'lng': final num lng}) {
        final name = label ?? 'Your daily place';
        return (
          story.copyWith(
            anchors: [
              ...story.anchors,
              Anchor(
                id: 'a${story.anchors.length + 1}',
                label: name,
                query: name,
                point: GeoPoint(lat: lat.toDouble(), lng: lng.toDouble()),
                mode: story.mode ?? TravelMode.transit,
                maxMinutes: story.maxMinutes ?? 30,
              ),
            ],
          ),
          const {},
          null,
        );
      }
      if (value is! String || value.trim().isEmpty) {
        return null;
      }
      return (story, const {}, (label: label ?? value, query: value.trim()));
    case CaseFacet.household:
      final answers = form[storySlice.name] ?? const {};
      final adults = _int(answers['adults']);
      if (adults == null || adults < 1) {
        return null;
      }
      final childAges = [
        for (final age in answers['childAges'] as List<Object?>? ?? const [])
          ?_int(age),
      ];
      return (
        _withCriteria(story, [
          if (childAges.any((age) => age >= 6)) CriterionKind.schools,
          if (childAges.any((age) => age < 6)) CriterionKind.preschool,
          if (childAges.any((age) => age < 10)) CriterionKind.playground,
        ]).copyWith(adults: adults, childAges: childAges),
        const {},
        null,
      );
    case CaseFacet.mode:
      final mode = _enum(TravelMode.values, value);
      if (mode == null) {
        return null;
      }
      return (
        story.copyWith(
          mode: mode,
          anchors: [
            for (final anchor in story.anchors) anchor.copyWith(mode: mode),
          ],
        ),
        const {},
        null,
      );
    case CaseFacet.maxMinutes:
      final minutes = _int(value);
      if (minutes == null || minutes < 5 || minutes > 120) {
        return null;
      }
      return (
        story.copyWith(
          maxMinutes: minutes,
          anchors: [
            for (final anchor in story.anchors)
              anchor.copyWith(maxMinutes: minutes),
          ],
        ),
        const {CaseFacet.mode},
        null,
      );
    case CaseFacet.homeType:
      final type = _enum(HomeType.values, value);
      return type == null
          ? null
          : (story.copyWith(homeType: type), const {}, null);
    case CaseFacet.outdoor:
      final outdoor = _enum(OutdoorSpace.values, value);
      return outdoor == null
          ? null
          : (story.copyWith(outdoor: outdoor), const {}, null);
    case CaseFacet.style:
      final style = _enum(HomeStyle.values, value);
      return style == null
          ? null
          : (story.copyWith(style: style), const {}, null);
    case CaseFacet.rooms:
      final rooms = _int(value);
      if (rooms == null || rooms < 1 || rooms > 8) {
        return null;
      }
      return (story.copyWith(rooms: rooms), const {}, null);
    case CaseFacet.criterion:
      final kind = _enum(CriterionKind.values, value);
      if (kind == null || kind == CriterionKind.commute) {
        return null;
      }
      return (_withCriteria(story, [kind]), const {}, null);
    case CaseFacet.photo:
      final photo = value is String ? markets.samples.photo(value) : null;
      if (photo == null) {
        return null;
      }
      final traits = photo.traits;
      final next = _withCriteria(story, traits.criteria).copyWith(
        homeType: traits.homeType ?? story.homeType,
        outdoor: traits.outdoor ?? story.outdoor,
        style: traits.style ?? story.style,
        areaIds: story.areaIds.isEmpty ? traits.areaIds : story.areaIds,
      );
      return (
        next,
        {
          if (traits.homeType != null) CaseFacet.homeType,
          if (traits.outdoor != null) CaseFacet.outdoor,
          if (traits.style != null) CaseFacet.style,
        },
        null,
      );
    case CaseFacet.swipe:
      final (kept, passed) = _swiped(context, story, markets);
      if (kept.isEmpty && passed.isEmpty) {
        return null;
      }
      final reading = readSwipe(kept, passed);
      return (
        story.copyWith(
          homeType: reading.homeType ?? story.homeType,
          outdoor: reading.outdoor ?? story.outdoor,
          style: reading.style ?? story.style,
        ),
        {
          if (reading.homeType != null) CaseFacet.homeType,
          if (reading.outdoor != null) CaseFacet.outdoor,
          if (reading.style != null) CaseFacet.style,
        },
        null,
      );
    case CaseFacet.routine:
      final routine = form[storySlice.name]?['routine'];
      if (routine is! List<Object?>) {
        return null;
      }
      return (_withRoutine(story, routine), const {}, null);
    case CaseFacet.needs:
      final needs = HomeNeed.parse(value);
      return needs == null
          ? null
          : (story.copyWith(needs: needs), const {}, null);
    case CaseFacet.area:
      final option = story.areaOptions
          .where((option) => option.id == value)
          .firstOrNull;
      if (option == null) {
        return null;
      }
      return (
        story.copyWith(
          areaIds: [option.areaId],
          homeType: option.homeType,
          rooms: story.rooms ?? option.rooms,
          priceMax: option.price.copyWith(
            minorUnits: (option.price.minorUnits * 1.1).round(),
          ),
        ),
        const {CaseFacet.homeType},
        null,
      );
  }
}

(List<Listing>, List<Listing>) _swiped(
  Map<String, Object?> context,
  Story story,
  MarketDirectory markets,
) {
  final homes = {
    for (final home in markets.samples.listingsIn(story.sampleCity ?? ''))
      home.id: home,
  };
  List<Listing> named(Object? ids) => [
    for (final id in ids as List<Object?>? ?? const []) ?homes[id],
  ];
  return (named(context['kept']), named(context['passed']));
}

Story _withRoutine(Story story, List<Object?> routine) {
  final places = [
    for (final json in routine)
      if (json is Map<String, Object?>) ?_routinePlace(json),
  ];
  final days = {
    for (final place in places) place.id: place.perWeek.clamp(1, 7),
  };
  final known = {for (final anchor in story.anchors) anchor.id};
  final added = [
    for (final place in places)
      if (!known.contains(place.id) && place.pin != null) place,
  ];
  return story.copyWith(
    anchors: [
      for (final anchor in story.anchors)
        anchor.copyWith(perWeek: days[anchor.id] ?? anchor.perWeek),
      for (final (index, place) in added.indexed)
        Anchor(
          id: 'a${story.anchors.length + index + 1}',
          label: place.label.trim(),
          query: place.label.trim(),
          point: place.pin,
          mode: story.mode ?? TravelMode.transit,
          maxMinutes: story.maxMinutes ?? 30,
          perWeek: place.perWeek.clamp(1, 7),
        ),
    ],
  );
}

RoutinePlace? _routinePlace(Map<String, Object?> json) {
  try {
    final place = RoutinePlace.fromJson(json);
    return place.label.trim().isEmpty ? null : place;
  } on CheckedFromJsonException {
    return null;
  }
}

Story _withCriteria(Story story, List<CriterionKind> kinds) {
  final present = {for (final criterion in story.criteria) criterion.kind};
  return story.copyWith(
    criteria: [
      ...story.criteria,
      for (final kind in kinds)
        if (!present.contains(kind) && kind != CriterionKind.commute)
          Criterion(kind: kind),
    ],
  );
}

int? _int(Object? value) => switch (value) {
  final num number => number.round(),
  final String text => int.tryParse(text.trim()),
  _ => null,
};

T? _enum<T extends Enum>(List<T> values, Object? name) =>
    values.where((value) => value.name == name).firstOrNull;
