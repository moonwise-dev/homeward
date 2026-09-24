import 'package:common/common.dart';

import 'open_data_unavailable.dart';
import 'osm_feature.dart';
import 'osm_matcher.dart';
import 'polite_client.dart';

typedef OverpassQuery = ({OsmMatcher matcher, int radius, bool lines});

final class Overpass {
  Overpass(
    this._client, {
    Uri? endpoint,
    this.retryAfter = const [Duration(seconds: 6), Duration(seconds: 12)],
  }) : endpoint = endpoint ?? defaultEndpoint;

  static final defaultEndpoint = Uri.parse(
    'https://overpass-api.de/api/interpreter',
  );

  final PoliteClient _client;
  final Uri endpoint;
  final List<Duration> retryAfter;

  Future<List<OsmFeature>> around(
    List<GeoPoint> points,
    List<OverpassQuery> queries,
  ) async {
    final body = {'data': queryFor(points, queries)};
    for (var attempt = 0; ; attempt++) {
      try {
        return _features(
          await _client.postFormJson(
            endpoint,
            body,
            gap: const Duration(seconds: 1),
          ),
        );
      } on OpenDataUnavailable catch (error) {
        if (attempt == retryAfter.length || !error.isBusy) {
          rethrow;
        }
        await Future<void>.delayed(retryAfter[attempt]);
      }
    }
  }

  List<OsmFeature> _features(Object? json) => switch (json) {
    {'elements': final List<Object?> elements} => [
      for (final element in elements) ?_feature(element),
    ],
    _ => const [],
  };

  static String queryFor(List<GeoPoint> points, List<OverpassQuery> queries) {
    String block(bool lines) => [
      for (final point in points)
        for (final query in queries.where((query) => query.lines == lines))
          '${lines ? 'way' : 'nwr'}(around:${query.radius},'
              '${point.lat},${point.lng})${query.matcher.selector};',
    ].join();
    return '[out:json][timeout:25];'
        '(${block(false)});out center tags;'
        '(${block(true)});out geom tags;';
  }

  OsmFeature? _feature(Object? element) {
    if (element is! Map<String, Object?>) {
      return null;
    }
    final tags = {
      for (final MapEntry(:key, :value)
          in (element['tags'] as Map<String, Object?>? ?? const {}).entries)
        if (value is String) key: value,
    };
    final points = switch (element) {
      {'lat': final num lat, 'lon': final num lon} => [_point(lat, lon)],
      {'center': {'lat': final num lat, 'lon': final num lon}} => [
        _point(lat, lon),
      ],
      {'geometry': final List<Object?> geometry} => [
        for (final vertex in geometry)
          if (vertex case {'lat': final num lat, 'lon': final num lon})
            _point(lat, lon),
      ],
      _ => <GeoPoint>[],
    };
    return points.isEmpty ? null : (tags: tags, points: points);
  }

  GeoPoint _point(num lat, num lon) =>
      GeoPoint(lat: lat.toDouble(), lng: lon.toDouble());
}
