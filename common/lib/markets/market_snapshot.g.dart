// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketSnapshot _$MarketSnapshotFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MarketSnapshot', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'name', 'coverage']);
      final val = _MarketSnapshot(
        id: $checkedConvert(
          'id',
          (v) => const MarketIdJsonConverter().fromJson(v as String),
        ),
        name: $checkedConvert('name', (v) => v as String),
        coverage: $checkedConvert(
          'coverage',
          (v) => $enumDecodeNullable(_$CoverageEnumMap, v) ?? Coverage.curated,
        ),
      );
      return val;
    });

Map<String, dynamic> _$MarketSnapshotToJson(_MarketSnapshot instance) =>
    <String, dynamic>{
      'id': const MarketIdJsonConverter().toJson(instance.id),
      'name': instance.name,
      'coverage': _$CoverageEnumMap[instance.coverage]!,
    };

const _$CoverageEnumMap = {
  Coverage.curated: 'curated',
  Coverage.uncovered: 'uncovered',
};
