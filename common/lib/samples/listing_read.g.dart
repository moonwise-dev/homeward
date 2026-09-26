// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_read.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListingRead _$ListingReadFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_ListingRead', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['listingId', 'need', 'verdict', 'quote'],
      );
      final val = _ListingRead(
        listingId: $checkedConvert('listingId', (v) => v as String),
        need: $checkedConvert('need', (v) => $enumDecode(_$HomeNeedEnumMap, v)),
        verdict: $checkedConvert(
          'verdict',
          (v) => $enumDecode(_$ReadVerdictEnumMap, v),
        ),
        quote: $checkedConvert('quote', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ListingReadToJson(_ListingRead instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'need': _$HomeNeedEnumMap[instance.need]!,
      'verdict': _$ReadVerdictEnumMap[instance.verdict]!,
      'quote': ?instance.quote,
    };

const _$HomeNeedEnumMap = {
  HomeNeed.stepFree: 'stepFree',
  HomeNeed.lift: 'lift',
  HomeNeed.entryLevelShower: 'entryLevelShower',
  HomeNeed.entryLevelBedroom: 'entryLevelBedroom',
  HomeNeed.homeOffice: 'homeOffice',
  HomeNeed.pets: 'pets',
};

const _$ReadVerdictEnumMap = {
  ReadVerdict.meets: 'meets',
  ReadVerdict.fails: 'fails',
  ReadVerdict.silent: 'silent',
};
