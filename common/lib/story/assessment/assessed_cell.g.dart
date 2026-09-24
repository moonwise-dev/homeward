// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessed_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssessedCell _$AssessedCellFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AssessedCell', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['candidateId', 'status', 'text', 'detail'],
      );
      final val = _AssessedCell(
        candidateId: $checkedConvert('candidateId', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$FitStatusEnumMap, v),
        ),
        text: $checkedConvert('text', (v) => v as String),
        detail: $checkedConvert('detail', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$AssessedCellToJson(_AssessedCell instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'status': _$FitStatusEnumMap[instance.status]!,
      'text': instance.text,
      'detail': ?instance.detail,
    };

const _$FitStatusEnumMap = {
  FitStatus.fits: 'fits',
  FitStatus.close: 'close',
  FitStatus.misses: 'misses',
  FitStatus.unknown: 'unknown',
};
