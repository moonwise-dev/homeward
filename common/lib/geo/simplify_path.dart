import 'dart:math';

import 'geo_point.dart';

List<GeoPoint> simplifyPath(
  List<GeoPoint> path, {
  required int maxPoints,
  double toleranceMeters = 8,
}) {
  if (maxPoints < 2) {
    throw ArgumentError.value(maxPoints, 'maxPoints', 'A path has two ends');
  }
  var tolerance = toleranceMeters;
  var simplified = _withinTolerance(path, tolerance);
  while (simplified.length > maxPoints) {
    tolerance *= 2;
    simplified = _withinTolerance(path, tolerance);
  }
  return simplified;
}

List<GeoPoint> _withinTolerance(List<GeoPoint> path, double toleranceMeters) {
  if (path.length < 3) {
    return path;
  }
  final kept = List.filled(path.length, false)
    ..first = true
    ..last = true;
  final spans = [(0, path.length - 1)];
  while (spans.isNotEmpty) {
    final (start, end) = spans.removeLast();
    var farthest = start;
    var farthestMeters = 0.0;
    for (var index = start + 1; index < end; index++) {
      final meters = _metersFromSegment(path[index], path[start], path[end]);
      if (meters > farthestMeters) {
        farthest = index;
        farthestMeters = meters;
      }
    }
    if (farthestMeters > toleranceMeters) {
      kept[farthest] = true;
      spans
        ..add((start, farthest))
        ..add((farthest, end));
    }
  }
  return [
    for (final (index, point) in path.indexed)
      if (kept[index]) point,
  ];
}

double _metersFromSegment(GeoPoint point, GeoPoint start, GeoPoint end) {
  const metersPerDegree = 111320.0;
  final eastScale = cos(start.lat * pi / 180) * metersPerDegree;
  final pointEast = (point.lng - start.lng) * eastScale;
  final pointNorth = (point.lat - start.lat) * metersPerDegree;
  final endEast = (end.lng - start.lng) * eastScale;
  final endNorth = (end.lat - start.lat) * metersPerDegree;
  final lengthSquared = endEast * endEast + endNorth * endNorth;
  final along = lengthSquared == 0
      ? 0.0
      : ((pointEast * endEast + pointNorth * endNorth) / lengthSquared).clamp(
          0.0,
          1.0,
        );
  final east = pointEast - along * endEast;
  final north = pointNorth - along * endNorth;
  return sqrt(east * east + north * north);
}
