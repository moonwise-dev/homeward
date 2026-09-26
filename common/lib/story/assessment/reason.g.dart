// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reason _$ReasonFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Reason',
  json,
  ($checkedConvert) {
    $checkKeys(json, allowedKeys: const ['text', 'source', 'status', 'quote']);
    final val = _Reason(
      text: $checkedConvert('text', (v) => v as String),
      source: $checkedConvert(
        'source',
        (v) => $enumDecode(_$ReasonSourceEnumMap, v),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$FitStatusEnumMap, v),
      ),
      quote: $checkedConvert('quote', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$ReasonToJson(_Reason instance) => <String, dynamic>{
  'text': instance.text,
  'source': _$ReasonSourceEnumMap[instance.source]!,
  'status': _$FitStatusEnumMap[instance.status]!,
  'quote': ?instance.quote,
};

const _$ReasonSourceEnumMap = {
  ReasonSource.listing: 'listing',
  ReasonSource.measured: 'measured',
  ReasonSource.buyer: 'buyer',
};

const _$FitStatusEnumMap = {
  FitStatus.fits: 'fits',
  FitStatus.close: 'close',
  FitStatus.misses: 'misses',
  FitStatus.unknown: 'unknown',
};
