// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SampleCity _$SampleCityFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_SampleCity',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'id',
        'name',
        'aliases',
        'marketId',
        'currency',
        'pricePeriod',
        'sources',
        'areas',
        'lineups',
      ],
    );
    final val = _SampleCity(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      aliases: $checkedConvert(
        'aliases',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
      marketId: $checkedConvert(
        'marketId',
        (v) => const MarketIdJsonConverter().fromJson(v as String),
      ),
      currency: $checkedConvert(
        'currency',
        (v) => const CurrencyJsonConverter().fromJson(v as String),
      ),
      pricePeriod: $checkedConvert('pricePeriod', (v) => v as String),
      sources: $checkedConvert(
        'sources',
        (v) => (v as List<dynamic>)
            .map((e) => Source.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      areas: $checkedConvert(
        'areas',
        (v) => (v as List<dynamic>)
            .map((e) => SampleArea.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      lineups: $checkedConvert(
        'lineups',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                k,
                (e as List<dynamic>).map((e) => e as String).toList(),
              ),
            ) ??
            const {},
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$SampleCityToJson(_SampleCity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'aliases': instance.aliases,
      'marketId': const MarketIdJsonConverter().toJson(instance.marketId),
      'currency': const CurrencyJsonConverter().toJson(instance.currency),
      'pricePeriod': instance.pricePeriod,
      'sources': instance.sources.map((e) => e.toJson()).toList(),
      'areas': instance.areas.map((e) => e.toJson()).toList(),
      'lineups': instance.lineups,
    };
