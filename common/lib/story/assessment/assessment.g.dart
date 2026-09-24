// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Assessment _$AssessmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Assessment', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['candidates', 'rows', 'markers', 'routes'],
      );
      final val = _Assessment(
        candidates: $checkedConvert(
          'candidates',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        AssessedCandidate.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
        rows: $checkedConvert(
          'rows',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => AssessedRow.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
        markers: $checkedConvert(
          'markers',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => MapMarker.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
        routes: $checkedConvert(
          'routes',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => MapRoute.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$AssessmentToJson(_Assessment instance) =>
    <String, dynamic>{
      'candidates': instance.candidates.map((e) => e.toJson()).toList(),
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'markers': instance.markers.map((e) => e.toJson()).toList(),
      'routes': instance.routes.map((e) => e.toJson()).toList(),
    };
