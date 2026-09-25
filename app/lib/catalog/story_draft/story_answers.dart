import 'package:common/common.dart';

import '../bindings/binding_parsers.dart';

enum CriterionStance { matters, must, leftOut }

class StoryAnswers {
  const StoryAnswers({
    this.mode,
    this.maxMinutes,
    this.picks = const {},
    this.mustHaves = const {},
    this.pins = const {},
    this.anchors = const [],
    this.center,
  });

  final TravelMode? mode;
  final int? maxMinutes;
  final Set<CriterionKind> picks;
  final Set<CriterionKind> mustHaves;
  final Map<String, StoryPin> pins;
  final List<Anchor> anchors;
  final GeoPoint? center;

  static StoryAnswers? of(Object? value) {
    if (value is! Map<String, Object?>) {
      return null;
    }
    return StoryAnswers(
      mode: _named(TravelMode.values, _first(value['mode'])),
      maxMinutes: integerOf(value['maxMinutes']),
      picks: switch (value['picks']) {
        final Map<String, Object?> groups => {
          for (final list in groups.values) ..._kinds(list),
        },
        _ => const {},
      },
      mustHaves: _kinds(value['mustHaves']),
      pins: storyPinsOf(value['pins']) ?? const {},
      anchors: jsonModelsOf(value['anchors'], Anchor.fromJson) ?? const [],
      center: jsonModelOf(value['center'], GeoPoint.fromJson),
    );
  }

  CriterionStance stanceOf(CriterionKind kind) => mustHaves.contains(kind)
      ? CriterionStance.must
      : picks.contains(kind)
      ? CriterionStance.matters
      : CriterionStance.leftOut;

  GeoPoint? placeOf(String id, String label) {
    if (pins[id] case final pin?) {
      return GeoPoint(lat: pin.lat, lng: pin.lng);
    }
    return anchors
        .where((anchor) => anchor.label.toLowerCase() == label.toLowerCase())
        .map((anchor) => anchor.point)
        .firstOrNull;
  }

  GeoPoint? get mapCenter =>
      center ??
      anchors.map((anchor) => anchor.point).nonNulls.firstOrNull ??
      pins.values
          .map((pin) => GeoPoint(lat: pin.lat, lng: pin.lng))
          .firstOrNull;
}

Object? _first(Object? value) => switch (value) {
  [final Object? first, ...] => first,
  _ => value,
};

Set<CriterionKind> _kinds(Object? list) => {
  if (list is List<Object?>)
    for (final item in list) ?_named(CriterionKind.values, item),
};

T? _named<T extends Enum>(List<T> values, Object? name) =>
    values.where((value) => value.name == name).firstOrNull;
