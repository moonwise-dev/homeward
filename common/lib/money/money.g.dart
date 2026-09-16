// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Money _$MoneyFromJson(Map<String, dynamic> json) => _Money(
  minorUnits: (json['minorUnits'] as num).toInt(),
  currency: const CurrencyJsonConverter().fromJson(json['currency'] as String),
);

Map<String, dynamic> _$MoneyToJson(_Money instance) => <String, dynamic>{
  'minorUnits': instance.minorUnits,
  'currency': const CurrencyJsonConverter().toJson(instance.currency),
};
