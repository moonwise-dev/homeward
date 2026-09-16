import 'package:json_annotation/json_annotation.dart';

import 'rate.dart';

class PpmJsonConverter implements JsonConverter<Rate, int> {
  const PpmJsonConverter();

  @override
  Rate fromJson(int json) => Rate.ppm(json);

  @override
  int toJson(Rate rate) => rate.partsPerMillion;
}
