import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../logging/log_entry.dart';
import 'open_data/criterion_matchers.dart';
import 'open_data/open_data_unavailable.dart';
import 'open_data/osm_feature.dart';
import 'open_data/osm_matcher.dart';
import 'open_data/overpass.dart';
import 'open_data/routing.dart';

final _log = Logger('research');

final class StoryMeasurer {
  StoryMeasurer({required this.overpass, required this.routing});

  final Overpass overpass;
  final Routing routing;

  Future<Measurements> measure(Story story) async {
    final located = [
      for (final candidate in story.candidates)
        if (candidate.point != null) candidate,
    ];
    final nearby = [
      for (final criterion in story.criteria)
        if (criterion.kind.measure != CriterionMeasure.route) criterion,
    ];
    final (features, routes) = await (
      _features(located, nearby),
      Future.wait([
        for (final candidate in located)
          for (final criterion in story.criteria)
            if (criterion.kind.measure == CriterionMeasure.route)
              _commute(candidate, criterion, story),
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
      for (final (key, measurement) in routes) key: measurement,
    });
  }

  Future<List<OsmFeature>?> _features(
    List<Candidate> located,
    List<Criterion> criteria,
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
            lines: criterion.kind == CriterionKind.noise,
          ),
    };
    try {
      return await overpass.around([
        for (final candidate in located) candidate.point!,
      ], queries.values.toList());
    } on OpenDataUnavailable catch (error) {
      _unavailable(error);
      return null;
    }
  }

  Future<((String, String), Measurement)> _commute(
    Candidate candidate,
    Criterion criterion,
    Story story,
  ) async {
    final key = (candidate.id, criterion.id);
    final anchor = story.anchorWith(criterion.anchorId);
    final target = anchor?.point;
    if (anchor == null || target == null) {
      return (key, const Measurement.unavailable());
    }
    try {
      return (
        key,
        await routing.route(candidate.point!, target, anchor.mode),
      );
    } on OpenDataUnavailable catch (error) {
      _unavailable(error);
      return (key, const Measurement.unavailable());
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
