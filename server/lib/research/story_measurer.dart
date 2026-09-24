import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../logging/log_entry.dart';
import 'open_data/criterion_matchers.dart';
import 'open_data/open_data_unavailable.dart';
import 'open_data/osm_feature.dart';
import 'open_data/osm_matcher.dart';
import 'open_data/overpass.dart';
import 'open_data/routing.dart';
import 'research_steps.dart';
import 'step_labels.dart';

final _log = Logger('research');

final class StoryMeasurer {
  StoryMeasurer({required this.overpass, required this.routing});

  final Overpass overpass;
  final Routing routing;

  Future<Measurements> measure(
    Story story, {
    ResearchSteps steps = const SilentSteps(),
  }) async {
    final located = [
      for (final candidate in story.candidates)
        if (candidate.point != null) candidate,
    ];
    final nearby = [
      for (final criterion in story.criteria)
        if (criterion.kind.measure != CriterionMeasure.route) criterion,
    ];
    final (features, commutes) = await (
      _features(located, nearby, steps),
      Future.wait([
        for (final criterion in story.criteria)
          if (criterion.kind.measure == CriterionMeasure.route)
            _commutes(located, criterion, story, steps),
      ]),
    ).wait;
    return Measurements({
      for (final candidate in located)
        for (final criterion in nearby)
          (candidate.id, criterion.id): switch (features) {
            final found? => _measurementFor(
              criterion,
              candidate.point!,
              found,
            ),
            null => const Measurement.unavailable(),
          },
      for (final routes in commutes)
        for (final (key, measurement) in routes) key: measurement,
    });
  }

  Future<List<OsmFeature>?> _features(
    List<Candidate> located,
    List<Criterion> criteria,
    ResearchSteps steps,
  ) async {
    if (located.isEmpty || criteria.isEmpty) {
      return const [];
    }
    final queries = {
      for (final criterion in criteria)
        for (final matcher in _matchersFor(criterion.kind))
          '${matcher.selector} ${_searchRadius(criterion)}': (
            matcher: matcher,
            radius: _searchRadius(criterion),
          ),
    };
    return steps.track(
      nearbyLabel([for (final criterion in criteria) criterion.kind], located),
      () async {
        try {
          return await overpass.around([
            for (final candidate in located) candidate.point!,
          ], queries.values.toList());
        } on OpenDataUnavailable catch (error) {
          _unavailable(error);
          return null;
        }
      },
      measured: (found) => found != null,
    );
  }

  Future<List<((String, String), Measurement)>> _commutes(
    List<Candidate> located,
    Criterion criterion,
    Story story,
    ResearchSteps steps,
  ) async {
    final anchor = story.anchorWith(criterion.anchorId);
    final target = anchor?.point;
    if (anchor == null || target == null || located.isEmpty) {
      return [
        for (final candidate in located)
          ((candidate.id, criterion.id), const Measurement.unavailable()),
      ];
    }
    return steps.track(
      routeLabel(anchor),
      () => Future.wait([
        for (final candidate in located)
          _commute(candidate.point!, target, anchor.mode).then(
            (measurement) => ((candidate.id, criterion.id), measurement),
          ),
      ]),
      measured: (routes) => routes.any(
        (route) => route.$2 is! UnavailableMeasurement,
      ),
    );
  }

  Future<Measurement> _commute(
    GeoPoint from,
    GeoPoint to,
    TravelMode mode,
  ) async {
    try {
      return await routing.route(from, to, mode);
    } on OpenDataUnavailable catch (error) {
      _unavailable(error);
      return const Measurement.unavailable();
    }
  }

  Measurement _measurementFor(
    Criterion criterion,
    GeoPoint home,
    List<OsmFeature> features,
  ) {
    final matchers = _matchersFor(criterion.kind);
    final found = [
      for (final feature in features)
        if (matchers.any((matcher) => matcher.matches(feature.tags)) &&
            !excludedFeature(criterion.kind, feature.tags))
          (feature: feature, nearest: _nearestPoint(home, feature.points)),
    ];
    switch (criterion.kind.measure) {
      case CriterionMeasure.density || CriterionMeasure.sparse:
        return Measurement.count(
          count: found
              .where((item) => item.nearest.$2 <= criterion.radius)
              .length,
        );
      case CriterionMeasure.nearest || CriterionMeasure.clearance:
        final within = found
            .where((item) => item.nearest.$2 <= _searchRadius(criterion))
            .toList();
        if (within.isEmpty) {
          return const Measurement.none();
        }
        final closest = within.reduce(
          (a, b) => a.nearest.$2 <= b.nearest.$2 ? a : b,
        );
        return Measurement.nearest(
          meters: closest.nearest.$2,
          name: _nameOf(closest.feature.tags),
          point: closest.nearest.$1,
        );
      case CriterionMeasure.route:
        return const Measurement.unavailable();
    }
  }

  (GeoPoint, int) _nearestPoint(GeoPoint home, List<GeoPoint> points) {
    var best = (points.first, home.metersTo(points.first));
    for (final point in points.skip(1)) {
      final meters = home.metersTo(point);
      if (meters < best.$2) {
        best = (point, meters);
      }
    }
    return best;
  }

  List<OsmMatcher> _matchersFor(CriterionKind kind) =>
      kind == CriterionKind.noise
      ? noiseMatchers
      : criterionMatchers[kind] ?? const [];

  int _searchRadius(Criterion criterion) =>
      criterion.kind.measure == CriterionMeasure.nearest
      ? criterion.radius * 2
      : criterion.radius;

  String? _nameOf(Map<String, String> tags) =>
      tags['name'] ??
      tags['ref'] ??
      (tags.containsKey('railway') ? 'Railway' : null);

  void _unavailable(OpenDataUnavailable error) => _log.warning(
    LogEntry(
      'Open data unavailable',
      fields: {'service': error.service, 'reason': error.reason},
    ),
  );
}
