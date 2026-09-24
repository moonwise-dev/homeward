// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessed_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssessedRow _$AssessedRowFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AssessedRow', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['id', 'label', 'group', 'mustHave', 'cells'],
      );
      final val = _AssessedRow(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        group: $checkedConvert('group', (v) => v as String),
        mustHave: $checkedConvert('mustHave', (v) => v as bool),
        cells: $checkedConvert(
          'cells',
          (v) => (v as List<dynamic>)
              .map((e) => AssessedCell.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AssessedRowToJson(_AssessedRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'group': instance.group,
      'mustHave': instance.mustHave,
      'cells': instance.cells.map((e) => e.toJson()).toList(),
    };
