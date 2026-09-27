// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'living_costs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LivingCosts _$LivingCostsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LivingCosts', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'currency',
          'year',
          'individual',
          'household',
          'source',
        ],
      );
      final val = _LivingCosts(
        id: $checkedConvert('id', (v) => v as String),
        currency: $checkedConvert(
          'currency',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        year: $checkedConvert('year', (v) => (v as num).toInt()),
        individual: $checkedConvert(
          'individual',
          (v) => (v as List<dynamic>)
              .map((e) => IndividualCost.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        household: $checkedConvert(
          'household',
          (v) => (v as List<dynamic>)
              .map((e) => HouseholdCost.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        source: $checkedConvert(
          'source',
          (v) => Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LivingCostsToJson(_LivingCosts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': const CurrencyJsonConverter().toJson(instance.currency),
      'year': instance.year,
      'individual': instance.individual.map((e) => e.toJson()).toList(),
      'household': instance.household.map((e) => e.toJson()).toList(),
      'source': instance.source.toJson(),
    };

_IndividualCost _$IndividualCostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_IndividualCost', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['ageFrom', 'ageTo', 'monthly']);
      final val = _IndividualCost(
        ageFrom: $checkedConvert('ageFrom', (v) => (v as num).toInt()),
        ageTo: $checkedConvert('ageTo', (v) => (v as num?)?.toInt()),
        monthly: $checkedConvert(
          'monthly',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IndividualCostToJson(_IndividualCost instance) =>
    <String, dynamic>{
      'ageFrom': instance.ageFrom,
      'ageTo': ?instance.ageTo,
      'monthly': const ExactDecimalJsonConverter().toJson(instance.monthly),
    };

_HouseholdCost _$HouseholdCostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HouseholdCost', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['persons', 'monthly']);
      final val = _HouseholdCost(
        persons: $checkedConvert('persons', (v) => (v as num).toInt()),
        monthly: $checkedConvert(
          'monthly',
          (v) => const ExactDecimalJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HouseholdCostToJson(_HouseholdCost instance) =>
    <String, dynamic>{
      'persons': instance.persons,
      'monthly': const ExactDecimalJsonConverter().toJson(instance.monthly),
    };
