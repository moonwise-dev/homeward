import 'package:common/common.dart';

import 'polite_client.dart';
import 'polyline.dart';
import 'travel_route.dart';

final class Routing {
  Routing(
    this._client, {
    Uri? roads,
    Uri? transit,
    DateTime Function()? now,
  }) : roads = roads ?? defaultRoads,
       transit = transit ?? defaultTransit,
       _now = now ?? DateTime.now;

  static final defaultRoads = Uri.parse('https://routing.openstreetmap.de/');
  static final defaultTransit = Uri.parse(
    'https://api.transitous.org/api/v1/plan',
  );

  final PoliteClient _client;
  final Uri roads;
  final Uri transit;
  final DateTime Function() _now;

  Future<TravelRoute?> route(GeoPoint from, GeoPoint to, TravelMode mode) =>
      switch (mode) {
        TravelMode.transit => _transit(from, to),
        _ => _road(from, to, mode),
      };

  Future<TravelRoute?> _road(
    GeoPoint from,
    GeoPoint to,
    TravelMode mode,
  ) async {
    final profile = switch (mode) {
      TravelMode.walk => 'foot',
      TravelMode.bike => 'bike',
      _ => 'car',
    };
    final json = await _client.getJson(
      roads.resolve(
        'routed-$profile/route/v1/driving/'
        '${from.lng},${from.lat};${to.lng},${to.lat}'
        '?overview=simplified&geometries=geojson',
      ),
      gap: const Duration(milliseconds: 500),
    );
    if (json case {
      'routes': [
        {
          'duration': final num seconds,
          'distance': final num meters,
          'geometry': {'coordinates': final List<Object?> coordinates},
        },
        ...,
      ],
    }) {
      return (
        mode: mode,
        minutes: (seconds / 60).ceil(),
        meters: meters.round(),
        path: [
          for (final coordinate in coordinates)
            if (coordinate case [final num lng, final num lat])
              GeoPoint(lat: lat.toDouble(), lng: lng.toDouble()),
        ],
      );
    }
    return null;
  }

  Future<TravelRoute?> _transit(GeoPoint from, GeoPoint to) async {
    final json = await _client.getJson(
      transit.replace(
        queryParameters: {
          'fromPlace': '${from.lat},${from.lng}',
          'toPlace': '${to.lat},${to.lng}',
          'time': _nextWeekdayMorning().toIso8601String(),
        },
      ),
      gap: const Duration(milliseconds: 500),
    );
    final itineraries = switch (json) {
      {'itineraries': final List<Object?> items} =>
        items.whereType<Map<String, Object?>>().toList(),
      _ => <Map<String, Object?>>[],
    };
    if (itineraries.isEmpty) {
      return null;
    }
    final fastest = itineraries.reduce(
      (a, b) => (a['duration'] as num) <= (b['duration'] as num) ? a : b,
    );
    final legs = (fastest['legs'] as List<Object?>? ?? const [])
        .whereType<Map<String, Object?>>();
    final path = [
      for (final leg in legs)
        if (leg['legGeometry']
            case {'points': final String points} &&
                final Map<String, Object?> geometry)
          ...decodePolyline(
            points,
            precision: (geometry['precision'] as num?)?.toInt() ?? 5,
          ),
    ];
    return (
      mode: TravelMode.transit,
      minutes: ((fastest['duration'] as num) / 60).ceil(),
      meters: _length(path),
      path: path,
    );
  }

  DateTime _nextWeekdayMorning() {
    var day = _now().toUtc().add(const Duration(days: 1));
    while (day.weekday > DateTime.friday) {
      day = day.add(const Duration(days: 1));
    }
    return DateTime.utc(day.year, day.month, day.day, 6, 30);
  }

  int _length(List<GeoPoint> path) {
    var meters = 0;
    for (var index = 1; index < path.length; index++) {
      meters += path[index - 1].metersTo(path[index]);
    }
    return meters;
  }
}
