// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_tax_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomeTaxTable _$IncomeTaxTableFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_IncomeTaxTable', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'currency',
          'year',
          'basis',
          'points',
          'above',
          'source',
        ],
      );
      final val = _IncomeTaxTable(
        id: $checkedConvert('id', (v) => v as String),
        currency: $checkedConvert(
          'currency',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        year: $checkedConvert('year', (v) => (v as num).toInt()),
        basis: $checkedConvert('basis', (v) => v as String),
        points: $checkedConvert(
          'points',
          (v) => (v as List<dynamic>)
              .map((e) => TaxPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        above: $checkedConvert(
          'above',
          (v) => (v as List<dynamic>)
              .map((e) => TaxBand.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IncomeTaxTableToJson(_IncomeTaxTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': const CurrencyJsonConverter().toJson(instance.currency),
      'year': instance.year,
      'basis': instance.basis,
      'points': instance.points.map((e) => e.toJson()).toList(),
      'above': instance.above.map((e) => e.toJson()).toList(),
      'source': instance.source.toJson(),
    };

_TaxPoint _$TaxPointFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaxPoint', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['monthlyPay', 'tax']);
      final val = _TaxPoint(
        monthlyPay: $checkedConvert(
          'monthlyPay',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
        tax: $checkedConvert(
          'tax',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TaxPointToJson(_TaxPoint instance) => <String, dynamic>{
  'monthlyPay': const ExactDecimalJsonConverter().toJson(instance.monthlyPay),
  'tax': const ExactDecimalJsonConverter().toJson(instance.tax),
};

_TaxBand _$TaxBandFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_TaxBand', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['upTo', 'rate']);
      final val = _TaxBand(
        upTo: $checkedConvert(
          'upTo',
          (v) => _$JsonConverterFromJson<String, ExactDecimal>(
            v,
            const ExactDecimalJsonConverter().fromJson,
          ),
        ),
        rate: $checkedConvert(
          'rate',
          (v) => const PercentJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TaxBandToJson(_TaxBand instance) => <String, dynamic>{
  'upTo': ?_$JsonConverterToJson<String, ExactDecimal>(
    instance.upTo,
    const ExactDecimalJsonConverter().toJson,
  ),
  'rate': const PercentJsonConverter().toJson(instance.rate),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
