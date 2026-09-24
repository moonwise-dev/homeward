import 'package:common/common.dart';

Story storyFromAnswers(Story story, Map<String, Object?> answers) {
  final mode = _enum(TravelMode.values, _first(answers['mode']));
  final maxMinutes = switch (answers['maxMinutes']) {
    final num minutes when minutes > 0 => minutes.round(),
    final String text => int.tryParse(text.trim()),
    _ => null,
  };
  final picks = switch (answers['picks']) {
    final Map<String, Object?> groups => {
      for (final list in groups.values) ..._kinds(list),
    },
    _ => null,
  };
  final mustHaves = _kinds(answers['mustHaves']);
  final anchors = [
    for (final anchor in story.anchors)
      anchor.copyWith(
        mode: mode ?? anchor.mode,
        maxMinutes: maxMinutes ?? anchor.maxMinutes,
      ),
  ];
  final kinds = picks == null
      ? {for (final criterion in story.criteria) criterion.kind}
      : {...picks, ...mustHaves};
  kinds.remove(CriterionKind.commute);
  return story.copyWith(
    reason:
        _enum(StoryReason.values, _first(answers['reason'])) ?? story.reason,
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
