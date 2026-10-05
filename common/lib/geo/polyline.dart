import 'dart:math';

import 'geo_point.dart';

String encodePolyline(List<GeoPoint> points, {int precision = 5}) {
  final factor = pow(10, precision);
  final encoded = StringBuffer();
  var lastLat = 0;
  var lastLng = 0;
  for (final point in points) {
    final lat = (point.lat * factor).round();
    final lng = (point.lng * factor).round();
    _write(encoded, lat - lastLat);
    _write(encoded, lng - lastLng);
    lastLat = lat;
    lastLng = lng;
  }
  return encoded.toString();
}

List<GeoPoint> decodePolyline(String encoded, {int precision = 5}) {
  final factor = pow(10, precision);
  final points = <GeoPoint>[];
  var index = 0;
  var lat = 0;
  var lng = 0;
  int next() {
    var scale = 1;
    var result = 0;
    int chunk;
    do {
      chunk = encoded.codeUnitAt(index++) - 63;
      result += (chunk & 0x1f) * scale;
      scale *= 32;
    } while (chunk >= 0x20 && index < encoded.length);
    return result.isOdd ? -(result ~/ 2) - 1 : result ~/ 2;
  }

  while (index < encoded.length) {
    lat += next();
    lng += next();
    points.add(GeoPoint(lat: lat / factor, lng: lng / factor));
  }
  return points;
}

void _write(StringBuffer encoded, int delta) {
  var value = delta < 0 ? -2 * delta - 1 : 2 * delta;
  while (value >= 0x20) {
    encoded.writeCharCode(0x20 + value % 32 + 63);
    value ~/= 32;
  }
  encoded.writeCharCode(value + 63);
}
