import 'dart:convert';

import 'package:common/common.dart';
import 'package:homeward_server/research/open_data/nominatim.dart';
import 'package:homeward_server/research/open_data/open_data_unavailable.dart';
import 'package:homeward_server/research/open_data/osm_matcher.dart';
import 'package:homeward_server/research/open_data/overpass.dart';
import 'package:homeward_server/research/open_data/polite_client.dart';
import 'package:homeward_server/research/open_data/routing.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  const odenplan = GeoPoint(lat: 59.3431, lng: 18.049);
  const kth = GeoPoint(lat: 59.3498, lng: 18.0707);

  PoliteClient client(Future<http.Response> Function(http.Request) handler) =>
      PoliteClient(MockClient(handler), userAgent: 'Homeward test');

  http.Response json(Object body, [int status = 200]) => http.Response(
    jsonEncode(body),
    status,
    headers: {'content-type': 'application/json; charset=utf-8'},
  );

  test('a polyline decodes to the points it encodes', () {
    expect(decodePolyline('_p~iF~ps|U_ulLnnqC_mqNvxq`@'), [
      const GeoPoint(lat: 38.5, lng: -120.2),
      const GeoPoint(lat: 40.7, lng: -120.95),
      const GeoPoint(lat: 43.252, lng: -126.453),
    ]);
  });

  test('geocoding tries inside the city first, then anywhere', () async {
    final queries = <Map<String, String>>[];
    final nominatim = Nominatim(
      client((request) async {
        queries.add(request.url.queryParameters);
        return request.url.queryParameters.containsKey('bounded')
            ? json([])
            : json([
                {
                  'lat': '59.3498',
                  'lon': '18.0707',
                  'display_name': 'Kungliga Tekniska högskolan, Stockholm',
                  'address': {'country_code': 'se', 'ISO3166-2-lvl4': 'SE-AB'},
                  'boundingbox': ['59.34', '59.35', '18.06', '18.08'],
                },
              ]);
      }),
    );

    final place = await nominatim.locate(
      'KTH',
      within: (south: 59.2, north: 59.5, west: 17.8, east: 18.3),
    );

    expect(queries.map((query) => query['bounded']), ['1', null]);
    expect(queries.first['viewbox'], '17.8,59.5,18.3,59.2');
    expect(place?.point, kth);
    expect(place?.countryCode, 'SE');
    expect(place?.regionCode, 'SE-AB');
    expect(place?.box?.north, 59.35);
  });

  test(
    'one Overpass query covers every home and waits out a busy slot',
    () async {
      final bodies = <String>[];
      final overpass = Overpass(
        client((request) async {
          bodies.add(request.bodyFields['data']!);
          return bodies.length == 1
              ? http.Response('rate limited', 429)
              : json({
                  'elements': [
                    {
                      'type': 'node',
                      'lat': 59.344,
                      'lon': 18.05,
                      'tags': {'amenity': 'school', 'name': 'Karlbergsskolan'},
                    },
                    {
                      'type': 'way',
                      'center': {'lat': 59.345, 'lon': 18.051},
                      'tags': {'leisure': 'park'},
                    },
                    {
                      'type': 'way',
                      'geometry': [
                        {'lat': 59.342, 'lon': 18.04},
                        {'lat': 59.343, 'lon': 18.041},
                      ],
                      'tags': {'highway': 'primary', 'ref': '279'},
                    },
                  ],
                });
        }),
        retryAfter: const [Duration.zero],
      );

      final features = await overpass.around(
        [odenplan, kth],
        [
          (matcher: const OsmMatcher('amenity', ['school']), radius: 2000),
          (
            matcher: const OsmMatcher('highway', [
              'motorway',
              'trunk',
              'primary',
            ], lines: true),
            radius: 200,
          ),
        ],
      );

      expect(bodies, hasLength(2));
      expect(bodies.last, contains('around:2000,59.3431,18.049'));
      expect(bodies.last, contains('around:2000,59.3498,18.0707'));
      expect(bodies.last, contains('out geom tags'));
      expect(features.map((feature) => feature.points.length), [1, 1, 2]);
    },
  );

  test(
    'a failed call is remembered for a minute, not paid for again',
    () async {
      var calls = 0;
      final nominatim = Nominatim(
        client((_) async {
          calls++;
          return http.Response('down', 500);
        }),
      );

      for (var attempt = 0; attempt < 2; attempt++) {
        await expectLater(
          nominatim.locate('KTH'),
          throwsA(isA<OpenDataUnavailable>()),
        );
      }
      expect(calls, 1);
    },
  );

  test('a refused Overpass query is reported, not retried forever', () async {
    final overpass = Overpass(
      client((_) async => http.Response('bad query', 400)),
      retryAfter: const [Duration.zero],
    );

    await expectLater(
      overpass.around([odenplan], const []),
      throwsA(isA<OpenDataUnavailable>()),
    );
  });

  test('road routes read minutes, metres, and the path', () async {
    final routing = Routing(
      client((request) async {
        expect(request.url.path, contains('routed-bike'));
        return json({
          'routes': [
            {
              'duration': 713.4,
              'distance': 2134.2,
              'geometry': {
                'coordinates': [
                  [18.049, 59.3431],
                  [18.0707, 59.3498],
                ],
              },
            },
          ],
        });
      }),
    );

    final route = await routing.route(odenplan, kth, TravelMode.bike);

    expect(route?.mode, TravelMode.bike);
    expect(route?.minutes, 12);
    expect(route?.meters, 2134);
    expect(route?.path, [odenplan, kth]);
  });

  test('transit takes the fastest itinerary of a weekday morning', () async {
    final routing = Routing(
      client((request) async {
        expect(request.url.queryParameters['time'], '2026-09-28T06:30:00.000Z');
        return json({
          'itineraries': [
            {'duration': 1500, 'legs': <Object?>[]},
            {
              'duration': 1020,
              'legs': [
                {
                  'legGeometry': {
                    'points': '_p~iF~ps|U_ulLnnqC',
                    'precision': 5,
                  },
                },
              ],
            },
          ],
        });
      }),
      now: () => DateTime.utc(2026, 9, 25, 20),
    );

    final route = await routing.route(odenplan, kth, TravelMode.transit);

    expect(route?.minutes, 17);
    expect(route?.path, hasLength(2));
  });
}
