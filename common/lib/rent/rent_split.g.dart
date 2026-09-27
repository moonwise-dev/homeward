// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_split.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SharingPerson _$SharingPersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SharingPerson', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['label', 'income', 'roomM2']);
      final val = _SharingPerson(
        label: $checkedConvert('label', (v) => v as String),
        income: $checkedConvert(
          'income',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        roomM2: $checkedConvert('roomM2', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SharingPersonToJson(_SharingPerson instance) =>
    <String, dynamic>{
      'label': instance.label,
      'income': ?instance.income?.toJson(),
      'roomM2': ?instance.roomM2,
    };

_PersonShare _$PersonShareFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PersonShare', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['label', 'rent', 'bills']);
      final val = _PersonShare(
        label: $checkedConvert('label', (v) => v as String),
        rent: $checkedConvert(
          'rent',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        bills: $checkedConvert(
          'bills',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PersonShareToJson(_PersonShare instance) =>
    <String, dynamic>{
      'label': instance.label,
      'rent': instance.rent.toJson(),
      'bills': ?instance.bills?.toJson(),
    };

_RuleSplit _$RuleSplitFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_RuleSplit',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['rule', 'shares']);
    final val = _RuleSplit(
      rule: $checkedConvert('rule', (v) => $enumDecode(_$SplitRuleEnumMap, v)),
      shares: $checkedConvert(
        'shares',
        (v) => (v as List<dynamic>)
            .map((e) => PersonShare.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$RuleSplitToJson(_RuleSplit instance) =>
    <String, dynamic>{
      'rule': _$SplitRuleEnumMap[instance.rule]!,
      'shares': instance.shares.map((e) => e.toJson()).toList(),
    };

const _$SplitRuleEnumMap = {
  SplitRule.equal: 'equal',
  SplitRule.income: 'income',
  SplitRule.room: 'room',
};

_RentSplitSlice _$RentSplitSliceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_RentSplitSlice', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'rent',
          'bills',
          'homeId',
          'homeName',
          'homeM2',
          'people',
          'splits',
          'chosen',
        ],
      );
      final val = _RentSplitSlice(
        rent: $checkedConvert(
          'rent',
          (v) => RentFigure.fromJson(v as Map<String, dynamic>),
        ),
        bills: $checkedConvert(
          'bills',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        homeId: $checkedConvert('homeId', (v) => v as String?),
        homeName: $checkedConvert('homeName', (v) => v as String?),
        homeM2: $checkedConvert('homeM2', (v) => (v as num?)?.toInt()),
        people: $checkedConvert(
          'people',
          (v) => (v as List<dynamic>)
              .map((e) => SharingPerson.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        splits: $checkedConvert(
          'splits',
          (v) => (v as List<dynamic>)
              .map((e) => RuleSplit.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        chosen: $checkedConvert(
          'chosen',
          (v) => $enumDecodeNullable(_$SplitRuleEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RentSplitSliceToJson(_RentSplitSlice instance) =>
    <String, dynamic>{
      'rent': instance.rent.toJson(),
      'bills': ?instance.bills?.toJson(),
      'homeId': ?instance.homeId,
      'homeName': ?instance.homeName,
      'homeM2': ?instance.homeM2,
      'people': instance.people.map((e) => e.toJson()).toList(),
      'splits': instance.splits.map((e) => e.toJson()).toList(),
      'chosen': ?_$SplitRuleEnumMap[instance.chosen],
    };
