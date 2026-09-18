// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_predicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuyerPredicate _$BuyerPredicateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuyerPredicate', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'residency',
          'formerResident',
          'residencyIntent',
          'citizenship',
          'residencyRegion',
          'use',
          'firstTime',
          'employment',
          'age',
        ],
      );
      final val = _BuyerPredicate(
        residency: $checkedConvert(
          'residency',
          (v) => $enumDecodeNullable(_$ResidencyEnumMap, v),
        ),
        formerResident: $checkedConvert('formerResident', (v) => v as bool?),
        residencyIntent: $checkedConvert(
          'residencyIntent',
          (v) => $enumDecodeNullable(_$ResidencyIntentEnumMap, v),
        ),
        citizenship: $checkedConvert(
          'citizenship',
          (v) => $enumDecodeNullable(_$RegionEnumMap, v),
        ),
        residencyRegion: $checkedConvert(
          'residencyRegion',
          (v) => $enumDecodeNullable(_$RegionEnumMap, v),
        ),
        use: $checkedConvert(
          'use',
          (v) => $enumDecodeNullable(_$PropertyUseEnumMap, v),
        ),
        firstTime: $checkedConvert('firstTime', (v) => v as bool?),
        employment: $checkedConvert(
          'employment',
          (v) => $enumDecodeNullable(_$EmploymentEnumMap, v),
        ),
        age: $checkedConvert(
          'age',
          (v) =>
              v == null ? null : YearRange.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BuyerPredicateToJson(_BuyerPredicate instance) =>
    <String, dynamic>{
      'residency': ?_$ResidencyEnumMap[instance.residency],
      'formerResident': ?instance.formerResident,
      'residencyIntent': ?_$ResidencyIntentEnumMap[instance.residencyIntent],
      'citizenship': ?_$RegionEnumMap[instance.citizenship],
      'residencyRegion': ?_$RegionEnumMap[instance.residencyRegion],
      'use': ?_$PropertyUseEnumMap[instance.use],
      'firstTime': ?instance.firstTime,
      'employment': ?_$EmploymentEnumMap[instance.employment],
      'age': ?instance.age?.toJson(),
    };

const _$ResidencyEnumMap = {
  Residency.resident: 'resident',
  Residency.nonResident: 'nonResident',
};

const _$ResidencyIntentEnumMap = {
  ResidencyIntent.stay: 'stay',
  ResidencyIntent.becomeResident: 'becomeResident',
};

const _$RegionEnumMap = {
  Region.domestic: 'domestic',
  Region.regional: 'regional',
  Region.foreign: 'foreign',
};

const _$PropertyUseEnumMap = {
  PropertyUse.primary: 'primary',
  PropertyUse.secondary: 'secondary',
  PropertyUse.investment: 'investment',
};

const _$EmploymentEnumMap = {
  Employment.employed: 'employed',
  Employment.selfEmployed: 'selfEmployed',
  Employment.retired: 'retired',
};
