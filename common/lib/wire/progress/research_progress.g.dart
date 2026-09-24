// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResearchProgress _$ResearchProgressFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ResearchProgress', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['steps']);
      final val = _ResearchProgress(
        steps: $checkedConvert(
          'steps',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => ResearchStep.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$ResearchProgressToJson(_ResearchProgress instance) =>
    <String, dynamic>{'steps': instance.steps.map((e) => e.toJson()).toList()};
