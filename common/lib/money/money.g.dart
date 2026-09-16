// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Money _$MoneyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Money', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['minorUnits', 'currency']);
      final val = _Money(
        minorUnits: $checkedConvert('minorUnits', (v) => (v as num).toInt()),
        currency: $checkedConvert(
          'currency',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MoneyToJson(_Money instance) => <String, dynamic>{
  'minorUnits': instance.minorUnits,
  'currency': const CurrencyJsonConverter().toJson(instance.currency),
};
