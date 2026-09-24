import 'package:common/common.dart';

import 'geo_place.dart';
import 'polite_client.dart';

final class Nominatim {
  Nominatim(this._client, {Uri? endpoint})
    : endpoint = endpoint ?? defaultEndpoint;

  static final defaultEndpoint = Uri.parse(
    'https://nominatim.openstreetmap.org/search',
  );

  final PoliteClient _client;
  final Uri endpoint;

  Future<GeoPlace?> locate(String query, {GeoBox? within}) async {
    if (within != null) {
      if (await _search(query, within) case final place?) {
        return place;
      }
    }
    return _search(query, null);
  }

  Future<GeoPlace?> _search(String query, GeoBox? within) async {
    final json = await _client.getJson(
      endpoint.replace(
        queryParameters: {
          'q': query,
          'format': 'jsonv2',
          'limit': '1',
          'addressdetails': '1',
          if (within != null) ...{
            'viewbox':
                '${within.west},${within.north},${within.east},${within.south}',
            'bounded': '1',
          },
        },
      ),
      gap: const Duration(seconds: 1),
    );
    if (json case [
      {
            'lat': final String lat,
            'lon': final String lon,
            'display_name': final String address,
          } &&
          final Map<String, Object?> place,
      ...,
    ]) {
      final details = place['address'];
      return (
        point: GeoPoint(lat: double.parse(lat), lng: double.parse(lon)),
        address: address,
        countryCode: switch (details) {
          {'country_code': final String code} => code.toUpperCase(),
          _ => null,
        },
        regionCode: switch (details) {
          {'ISO3166-2-lvl4': final String code} => code,
          _ => null,
        },
        box: switch (place['boundingbox']) {
          [
            final String south,
            final String north,
            final String west,
            final String east,
          ] =>
            (
              south: double.parse(south),
              north: double.parse(north),
              west: double.parse(west),
              east: double.parse(east),
            ),
          _ => null,
        },
      );
    }
    return null;
  }
}
