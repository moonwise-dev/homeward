import 'dart:math';

import 'package:common/common.dart';

List<GeoPoint> decodePolyline(String encoded, {int precision = 5}) {
  final factor = pow(10, precision);
  final points = <GeoPoint>[];
  var index = 0;
  var lat = 0;
  var lng = 0;
  int next() {
    var shift = 0;
    var result = 0;
    int byte;
    do {
      byte = encoded.codeUnitAt(index++) - 63;
      result |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20 && index < encoded.length);
    return result & 1 == 1 ? ~(result >> 1) : result >> 1;
  }

  while (index < encoded.length) {
    lat += next();
    lng += next();
    points.add(GeoPoint(lat: lat / factor, lng: lng / factor));
  }
  return points;
}
