// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_field_requirement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileFieldRequirement _$ProfileFieldRequirementFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfileFieldRequirement', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['id', 'field', 'appliesTo', 'reason']);
  final val = _ProfileFieldRequirement(
    id: $checkedConvert('id', (v) => v as String),
    field: $checkedConvert(
      'field',
      (v) => $enumDecode(_$ProfileFieldEnumMap, v),
    ),
    appliesTo: $checkedConvert(
      'appliesTo',
      (v) =>
          v == null ? null : BuyerPredicate.fromJson(v as Map<String, dynamic>),
    ),
    reason: $checkedConvert('reason', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ProfileFieldRequirementToJson(
  _ProfileFieldRequirement instance,
) => <String, dynamic>{
  'id': instance.id,
  'field': _$ProfileFieldEnumMap[instance.field]!,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'reason': instance.reason,
};

const _$ProfileFieldEnumMap = {
  ProfileField.citizenship: 'citizenship',
  ProfileField.residency: 'residency',
  ProfileField.formerResident: 'formerResident',
  ProfileField.residencyIntent: 'residencyIntent',
  ProfileField.use: 'use',
  ProfileField.firstTime: 'firstTime',
  ProfileField.employment: 'employment',
  ProfileField.netMonthlyIncome: 'netMonthlyIncome',
  ProfileField.grossMonthlyIncome: 'grossMonthlyIncome',
  ProfileField.incomeCurrency: 'incomeCurrency',
  ProfileField.savings: 'savings',
  ProfileField.monthlyDebtPayments: 'monthlyDebtPayments',
  ProfileField.age: 'age',
  ProfileField.household: 'household',
  ProfileField.borrowers: 'borrowers',
};
