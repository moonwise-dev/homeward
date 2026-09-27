// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuyerProfile _$BuyerProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuyerProfile', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'citizenship',
          'taxResidence',
          'formerResident',
          'residencyIntent',
          'use',
          'firstTime',
          'employment',
          'age',
          'netMonthlyIncome',
          'grossMonthlyIncome',
          'monthlyDebtPayments',
          'savings',
          'borrowers',
          'adults',
          'childAges',
        ],
      );
      final val = _BuyerProfile(
        citizenship: $checkedConvert(
          'citizenship',
          (v) => _$JsonConverterFromJson<String, CountryCode>(
            v,
            const CountryCodeJsonConverter().fromJson,
          ),
        ),
        taxResidence: $checkedConvert(
          'taxResidence',
          (v) => _$JsonConverterFromJson<String, CountryCode>(
            v,
            const CountryCodeJsonConverter().fromJson,
          ),
        ),
        formerResident: $checkedConvert('formerResident', (v) => v as bool?),
        residencyIntent: $checkedConvert(
          'residencyIntent',
          (v) => $enumDecodeNullable(_$ResidencyIntentEnumMap, v),
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
        age: $checkedConvert('age', (v) => (v as num?)?.toInt()),
        netMonthlyIncome: $checkedConvert(
          'netMonthlyIncome',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        grossMonthlyIncome: $checkedConvert(
          'grossMonthlyIncome',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        monthlyDebtPayments: $checkedConvert(
          'monthlyDebtPayments',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        savings: $checkedConvert(
          'savings',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        borrowers: $checkedConvert('borrowers', (v) => (v as num?)?.toInt()),
        adults: $checkedConvert('adults', (v) => (v as num?)?.toInt()),
        childAges: $checkedConvert(
          'childAges',
          (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BuyerProfileToJson(_BuyerProfile instance) =>
    <String, dynamic>{
      'citizenship': ?_$JsonConverterToJson<String, CountryCode>(
        instance.citizenship,
        const CountryCodeJsonConverter().toJson,
      ),
      'taxResidence': ?_$JsonConverterToJson<String, CountryCode>(
        instance.taxResidence,
        const CountryCodeJsonConverter().toJson,
      ),
      'formerResident': ?instance.formerResident,
      'residencyIntent': ?_$ResidencyIntentEnumMap[instance.residencyIntent],
      'use': ?_$PropertyUseEnumMap[instance.use],
      'firstTime': ?instance.firstTime,
      'employment': ?_$EmploymentEnumMap[instance.employment],
      'age': ?instance.age,
      'netMonthlyIncome': ?instance.netMonthlyIncome?.toJson(),
      'grossMonthlyIncome': ?instance.grossMonthlyIncome?.toJson(),
      'monthlyDebtPayments': ?instance.monthlyDebtPayments?.toJson(),
      'savings': ?instance.savings?.toJson(),
      'borrowers': ?instance.borrowers,
      'adults': ?instance.adults,
      'childAges': ?instance.childAges,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$ResidencyIntentEnumMap = {
  ResidencyIntent.stay: 'stay',
  ResidencyIntent.becomeResident: 'becomeResident',
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

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
