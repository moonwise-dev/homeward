// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_rule_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketRulePack _$MarketRulePackFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_MarketRulePack', json, ($checkedConvert) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'parent',
      'name',
      'currency',
      'version',
      'effectiveFrom',
      'reviewedAt',
      'reviewedBy',
      'profileFields',
      'lending',
      'purchaseCosts',
      'recurringCosts',
      'loanTypes',
      'removedRuleIds',
      'sources',
    ],
  );
  final val = _MarketRulePack(
    id: $checkedConvert(
      'id',
      (v) => const MarketIdJsonConverter().fromJson(v as String),
    ),
    parent: $checkedConvert(
      'parent',
      (v) => _$JsonConverterFromJson<String, MarketId>(
        v,
        const MarketIdJsonConverter().fromJson,
      ),
    ),
    name: $checkedConvert('name', (v) => v as String),
    currency: $checkedConvert(
      'currency',
      (v) => _$JsonConverterFromJson<String, Currency>(
        v,
        const CurrencyJsonConverter().fromJson,
      ),
    ),
    version: $checkedConvert('version', (v) => (v as num).toInt()),
    effectiveFrom: $checkedConvert(
      'effectiveFrom',
      (v) => const CalendarDateJsonConverter().fromJson(v as String),
    ),
    reviewedAt: $checkedConvert(
      'reviewedAt',
      (v) => _$JsonConverterFromJson<String, CalendarDate>(
        v,
        const CalendarDateJsonConverter().fromJson,
      ),
    ),
    reviewedBy: $checkedConvert('reviewedBy', (v) => v as String?),
    profileFields: $checkedConvert(
      'profileFields',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) =>
                    ProfileFieldRequirement.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
    lending: $checkedConvert(
      'lending',
      (v) => v == null
          ? const LendingRules()
          : LendingRules.fromJson(v as Map<String, dynamic>),
    ),
    purchaseCosts: $checkedConvert(
      'purchaseCosts',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => CostRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    recurringCosts: $checkedConvert(
      'recurringCosts',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => CostRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    loanTypes: $checkedConvert(
      'loanTypes',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => LoanType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    removedRuleIds: $checkedConvert(
      'removedRuleIds',
      (v) =>
          (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    ),
    sources: $checkedConvert(
      'sources',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$MarketRulePackToJson(_MarketRulePack instance) =>
    <String, dynamic>{
      'id': const MarketIdJsonConverter().toJson(instance.id),
      'parent': ?_$JsonConverterToJson<String, MarketId>(
        instance.parent,
        const MarketIdJsonConverter().toJson,
      ),
      'name': instance.name,
      'currency': ?_$JsonConverterToJson<String, Currency>(
        instance.currency,
        const CurrencyJsonConverter().toJson,
      ),
      'version': instance.version,
      'effectiveFrom': const CalendarDateJsonConverter().toJson(
        instance.effectiveFrom,
      ),
      'reviewedAt': ?_$JsonConverterToJson<String, CalendarDate>(
        instance.reviewedAt,
        const CalendarDateJsonConverter().toJson,
      ),
      'reviewedBy': ?instance.reviewedBy,
      'profileFields': instance.profileFields.map((e) => e.toJson()).toList(),
      'lending': instance.lending.toJson(),
      'purchaseCosts': instance.purchaseCosts.map((e) => e.toJson()).toList(),
      'recurringCosts': instance.recurringCosts.map((e) => e.toJson()).toList(),
      'loanTypes': instance.loanTypes.map((e) => e.toJson()).toList(),
      'removedRuleIds': instance.removedRuleIds,
      'sources': instance.sources.map((e) => e.toJson()).toList(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
