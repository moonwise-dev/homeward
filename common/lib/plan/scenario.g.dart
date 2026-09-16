// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Scenario _$ScenarioFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Scenario',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'price',
        'downPayment',
        'termYears',
        'loanTypeId',
        'rateSpreadPpm',
        'rateShockPpm',
        'associationFee',
      ],
    );
    final val = _Scenario(
      price: $checkedConvert(
        'price',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      downPayment: $checkedConvert(
        'downPayment',
        (v) => Money.fromJson(v as Map<String, dynamic>),
      ),
      termYears: $checkedConvert('termYears', (v) => (v as num).toInt()),
      loanTypeId: $checkedConvert('loanTypeId', (v) => v as String),
      rateSpread: $checkedConvert(
        'rateSpreadPpm',
        (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
      ),
      rateShock: $checkedConvert(
        'rateShockPpm',
        (v) => v == null
            ? Rate.zero
            : const PpmJsonConverter().fromJson((v as num).toInt()),
      ),
      associationFee: $checkedConvert(
        'associationFee',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'rateSpread': 'rateSpreadPpm',
    'rateShock': 'rateShockPpm',
  },
);

Map<String, dynamic> _$ScenarioToJson(_Scenario instance) => <String, dynamic>{
  'price': instance.price.toJson(),
  'downPayment': instance.downPayment.toJson(),
  'termYears': instance.termYears,
  'loanTypeId': instance.loanTypeId,
  'rateSpreadPpm': const PpmJsonConverter().toJson(instance.rateSpread),
  'rateShockPpm': const PpmJsonConverter().toJson(instance.rateShock),
  'associationFee': ?instance.associationFee?.toJson(),
};
