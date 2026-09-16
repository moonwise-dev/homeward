// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rounding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rounding _$RoundingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Rounding', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['mode', 'step']);
      final val = _Rounding(
        mode: $checkedConvert(
          'mode',
          (v) => $enumDecode(_$RoundingModeEnumMap, v),
        ),
        step: $checkedConvert('step', (v) => (v as num?)?.toInt() ?? 1),
      );
      return val;
    });

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
