// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResearchStep _$ResearchStepFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ResearchStep', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['label', 'state']);
      final val = _ResearchStep(
        label: $checkedConvert('label', (v) => v as String),
        state: $checkedConvert(
          'state',
          (v) => $enumDecode(_$ResearchStepStateEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ResearchStepToJson(_ResearchStep instance) =>
    <String, dynamic>{
      'label': instance.label,
      'state': _$ResearchStepStateEnumMap[instance.state]!,
    };

const _$ResearchStepStateEnumMap = {
  ResearchStepState.running: 'running',
  ResearchStepState.done: 'done',
  ResearchStepState.unavailable: 'unavailable',
};
