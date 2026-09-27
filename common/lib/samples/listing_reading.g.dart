// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeNeed _$HomeNeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HomeNeed', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['id', 'label', 'meaning']);
      final val = _HomeNeed(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        meaning: $checkedConvert('meaning', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$HomeNeedToJson(_HomeNeed instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'meaning': instance.meaning,
};

_NeedReading _$NeedReadingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_NeedReading', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['needId', 'label', 'verdict', 'quote'],
      );
      final val = _NeedReading(
        needId: $checkedConvert('needId', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        verdict: $checkedConvert(
          'verdict',
          (v) => $enumDecode(_$ReadVerdictEnumMap, v),
        ),
        quote: $checkedConvert('quote', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$NeedReadingToJson(_NeedReading instance) =>
    <String, dynamic>{
      'needId': instance.needId,
      'label': instance.label,
      'verdict': _$ReadVerdictEnumMap[instance.verdict]!,
      'quote': ?instance.quote,
    };

const _$ReadVerdictEnumMap = {
  ReadVerdict.meets: 'meets',
  ReadVerdict.fails: 'fails',
  ReadVerdict.silent: 'silent',
};

_ListingReading _$ListingReadingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ListingReading', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['homeId', 'homeName', 'description', 'readings'],
      );
      final val = _ListingReading(
        homeId: $checkedConvert('homeId', (v) => v as String),
        homeName: $checkedConvert('homeName', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        readings: $checkedConvert(
          'readings',
          (v) => (v as List<dynamic>)
              .map((e) => NeedReading.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingReadingToJson(_ListingReading instance) =>
    <String, dynamic>{
      'homeId': instance.homeId,
      'homeName': instance.homeName,
      'description': instance.description,
      'readings': instance.readings.map((e) => e.toJson()).toList(),
    };
