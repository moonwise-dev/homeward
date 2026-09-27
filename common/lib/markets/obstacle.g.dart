// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obstacle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Obstacle _$ObstacleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Obstacle', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'appliesTo',
          'title',
          'severity',
          'mitigation',
          'typicalDuration',
          'sourceId',
        ],
      );
      final val = _Obstacle(
        id: $checkedConvert('id', (v) => v as String),
        appliesTo: $checkedConvert(
          'appliesTo',
          (v) => v == null
              ? null
              : BuyerPredicate.fromJson(v as Map<String, dynamic>),
        ),
        title: $checkedConvert('title', (v) => v as String),
        severity: $checkedConvert(
          'severity',
          (v) => $enumDecode(_$ObstacleSeverityEnumMap, v),
        ),
        mitigation: $checkedConvert('mitigation', (v) => v as String),
        typicalDuration: $checkedConvert(
          'typicalDuration',
          (v) => _$JsonConverterFromJson<String, Period>(
            v,
            const PeriodJsonConverter().fromJson,
          ),
        ),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ObstacleToJson(_Obstacle instance) => <String, dynamic>{
  'id': instance.id,
  'appliesTo': ?instance.appliesTo?.toJson(),
  'title': instance.title,
  'severity': _$ObstacleSeverityEnumMap[instance.severity]!,
  'mitigation': instance.mitigation,
  'typicalDuration': ?_$JsonConverterToJson<String, Period>(
    instance.typicalDuration,
    const PeriodJsonConverter().toJson,
  ),
  'sourceId': instance.sourceId,
};

const _$ObstacleSeverityEnumMap = {
  ObstacleSeverity.blocker: 'blocker',
  ObstacleSeverity.effort: 'effort',
  ObstacleSeverity.info: 'info',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
