// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExchangeRate', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['from', 'to', 'rate', 'asOf', 'source'],
      );
      final val = _ExchangeRate(
        from: $checkedConvert(
          'from',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        to: $checkedConvert(
          'to',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        rate: $checkedConvert(
          'rate',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        asOf: $checkedConvert(
          'asOf',
          (v) => const CalendarDateJsonConverter().fromJson(v as String),
        ),
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ExchangeRateToJson(_ExchangeRate instance) =>
    <String, dynamic>{
      'from': const CurrencyJsonConverter().toJson(instance.from),
      'to': const CurrencyJsonConverter().toJson(instance.to),
      'rate': const ExactDecimalJsonConverter().toJson(instance.rate),
      'asOf': const CalendarDateJsonConverter().toJson(instance.asOf),
      'source': instance.source.toJson(),
    };

_ExchangeRateTable _$ExchangeRateTableFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ExchangeRateTable', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['base', 'asOf', 'rates', 'source']);
      final val = _ExchangeRateTable(
        base: $checkedConvert(
          'base',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        asOf: $checkedConvert(
          'asOf',
          (v) => const CalendarDateJsonConverter().fromJson(v as String),
        ),
        rates: $checkedConvert(
          'rates',
          (v) => Map<String, String>.from(v as Map),
        ),
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ExchangeRateTableToJson(_ExchangeRateTable instance) =>
    <String, dynamic>{
      'base': const CurrencyJsonConverter().toJson(instance.base),
      'asOf': const CalendarDateJsonConverter().toJson(instance.asOf),
      'rates': instance.rates,
      'source': instance.source.toJson(),
    };
