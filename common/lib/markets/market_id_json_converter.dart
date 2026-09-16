import 'package:json_annotation/json_annotation.dart';

import 'market_id.dart';

class MarketIdJsonConverter implements JsonConverter<MarketId, String> {
  const MarketIdJsonConverter();

  @override
  MarketId fromJson(String json) => MarketId.parse(json);

  @override
  String toJson(MarketId id) => id.code;
}
