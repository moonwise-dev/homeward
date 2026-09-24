import 'package:common/common.dart';

typedef GeoBox = ({double south, double north, double west, double east});

typedef GeoPlace = ({
  GeoPoint point,
  String address,
  String? countryCode,
  String? regionCode,
  GeoBox? box,
});
