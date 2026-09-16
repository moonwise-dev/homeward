// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rounding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rounding _$RoundingFromJson(Map<String, dynamic> json) => _Rounding(
  mode: $enumDecode(_$RoundingModeEnumMap, json['mode']),
  step: (json['step'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$RoundingToJson(_Rounding instance) => <String, dynamic>{
  'mode': _$RoundingModeEnumMap[instance.mode]!,
  'step': instance.step,
};

const _$RoundingModeEnumMap = {
  RoundingMode.halfUp: 'halfUp',
  RoundingMode.halfEven: 'halfEven',
  RoundingMode.down: 'down',
  RoundingMode.up: 'up',
};
