import 'package:common/common.dart';
import 'package:json_annotation/json_annotation.dart';

Story storyFromAnswers(Story story, Map<String, Object?> answers) {
  final mode = _enum(TravelMode.values, _first(answers['mode'])) ?? story.mode;
  final maxMinutes =
      switch (answers['maxMinutes']) {
        final num minutes when minutes > 0 => minutes.round(),
        final String text => int.tryParse(text.trim()),
        _ => null,
      } ??
      story.maxMinutes;
  final picks = switch (answers['picks']) {
    final Map<String, Object?> groups => {
      for (final list in groups.values) ..._kinds(list),
    },
    _ => null,
  };
  final mustHaves = _kinds(answers['mustHaves']);
  final anchors = _withPins(
    [
      for (final anchor in story.anchors)
        anchor.copyWith(
          mode: mode ?? anchor.mode,
          maxMinutes: maxMinutes ?? anchor.maxMinutes,
        ),
    ],
    answers['pins'],
    mode: mode ?? TravelMode.transit,
    maxMinutes: maxMinutes ?? 30,
  );
  final kinds = picks == null
      ? {for (final criterion in story.criteria) criterion.kind}
      : {...picks, ...mustHaves};
  kinds.remove(CriterionKind.commute);
  return story.copyWith(
    reason:
        _enum(StoryReason.values, _first(answers['reason'])) ?? story.reason,
    mode: mode,
    maxMinutes: maxMinutes,
    anchors: anchors,
    criteria: [
      for (final anchor in anchors)
        Criterion(
          kind: CriterionKind.commute,
          anchorId: anchor.id,
          mustHave: mustHaves.contains(CriterionKind.commute),
        ),
      for (final kind in CriterionKind.values)
        if (kinds.contains(kind))
          Criterion(kind: kind, mustHave: mustHaves.contains(kind)),
    ],
    committed: true,
    chosenCandidateId: null,
  );
}

List<Anchor> _withPins(
  List<Anchor> anchors,
  Object? pins, {
  required TravelMode mode,
  required int maxMinutes,
}) {
  if (pins is! Map<String, Object?>) {
    return anchors;
  }
  final result = [...anchors];
  for (final value in pins.values) {
    if (value is! Map<String, Object?>) {
      continue;
    }
    final StoryPin pin;
    try {
      pin = StoryPin.fromJson(value);
    } on CheckedFromJsonException {
      continue;
    }
    final point = GeoPoint(lat: pin.lat, lng: pin.lng);
    final index = result.indexWhere(
      (anchor) => anchor.label.toLowerCase() == pin.label.toLowerCase(),
    );
    if (index == -1) {
      result.add(
        Anchor(
          id: 'a${result.length + 1}',
          label: pin.label,
          query: pin.label,
          point: point,
          mode: mode,
          maxMinutes: maxMinutes,
        ),
      );
    } else {
      result[index] = result[index].copyWith(point: point);
    }
  }
  return result;
}

Object? _first(Object? value) => switch (value) {
  [final Object? first, ...] => first,
  final String text => text,
  _ => null,
};

Set<CriterionKind> _kinds(Object? list) => {
  if (list is List<Object?>)
    for (final item in list) ?_enum(CriterionKind.values, item),
};

T? _enum<T extends Enum>(List<T> values, Object? name) =>
    values.where((value) => value.name == name).firstOrNull;
