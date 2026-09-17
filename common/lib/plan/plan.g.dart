// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Plan _$PlanFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Plan',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'marketId',
        'profile',
        'profileDraft',
        'scenario',
        'scenarioDraft',
      ],
    );
    final val = _Plan(
      marketId: $checkedConvert(
        'marketId',
        (v) => _$JsonConverterFromJson<String, MarketId>(
          v,
          const MarketIdJsonConverter().fromJson,
        ),
      ),
      profile: $checkedConvert(
        'profile',
        (v) => v == null
            ? const BuyerProfile()
            : BuyerProfile.fromJson(v as Map<String, dynamic>),
      ),
      profileDraft: $checkedConvert(
        'profileDraft',
        (v) =>
            v == null ? null : BuyerProfile.fromJson(v as Map<String, dynamic>),
      ),
      scenario: $checkedConvert(
        'scenario',
        (v) => v == null ? null : Scenario.fromJson(v as Map<String, dynamic>),
      ),
      scenarioDraft: $checkedConvert(
        'scenarioDraft',
        (v) => v == null ? null : Scenario.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$PlanToJson(_Plan instance) => <String, dynamic>{
  'marketId': ?_$JsonConverterToJson<String, MarketId>(
    instance.marketId,
    const MarketIdJsonConverter().toJson,
  ),
  'profile': instance.profile.toJson(),
  'profileDraft': ?instance.profileDraft?.toJson(),
  'scenario': ?instance.scenario?.toJson(),
  'scenarioDraft': ?instance.scenarioDraft?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
