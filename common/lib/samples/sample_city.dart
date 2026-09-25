import 'package:freezed_annotation/freezed_annotation.dart';

import '../markets/market_id.dart';
import '../markets/market_id_json_converter.dart';
import '../markets/source.dart';
import '../money/currency.dart';
import '../money/currency_json_converter.dart';
import 'sample_area.dart';

part 'sample_city.freezed.dart';
part 'sample_city.g.dart';

@freezed
abstract class SampleCity with _$SampleCity {
  const factory SampleCity({
    required String id,
    required String name,
    @Default([]) List<String> aliases,
    @MarketIdJsonConverter() required MarketId marketId,
    @CurrencyJsonConverter() required Currency currency,
    required String pricePeriod,
    required List<Source> sources,
    required List<SampleArea> areas,
    @Default({}) Map<String, List<String>> lineups,
  }) = _SampleCity;

  const SampleCity._();

  factory SampleCity.fromJson(Map<String, Object?> json) =>
      _$SampleCityFromJson(json);

  SampleArea? areaWith(String id) =>
      areas.where((area) => area.id == id).firstOrNull;

  Source? sourceWith(String id) =>
      sources.where((source) => source.id == id).firstOrNull;

  String priceSourceOf(SampleArea area) => [
    sourceWith(area.sourceId)?.publisher ?? 'Price statistics',
    pricePeriod,
  ].join(', ');

  bool isNamed(String place) {
    final wanted = _normalized(place);
    return [name, ...aliases].any((known) => _normalized(known) == wanted);
  }

  static String _normalized(String text) =>
      text.split(',').first.trim().toLowerCase();
}
