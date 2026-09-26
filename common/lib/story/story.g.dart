// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Story _$StoryFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Story',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'reason',
        'city',
        'cityPoint',
        'mode',
        'maxMinutes',
        'anchors',
        'candidates',
        'criteria',
        'committed',
        'chosenCandidateId',
        'adults',
        'childAges',
        'homeType',
        'outdoor',
        'style',
        'rooms',
        'areaIds',
        'priceMax',
        'sampleCity',
        'areaOptions',
        'needs',
        'readings',
        'answered',
        'questions',
      ],
    );
    final val = _Story(
      reason: $checkedConvert(
        'reason',
        (v) => $enumDecodeNullable(_$StoryReasonEnumMap, v),
      ),
      city: $checkedConvert('city', (v) => v as String?),
      cityPoint: $checkedConvert(
        'cityPoint',
        (v) => v == null ? null : GeoPoint.fromJson(v as Map<String, dynamic>),
      ),
      mode: $checkedConvert(
        'mode',
        (v) => $enumDecodeNullable(_$TravelModeEnumMap, v),
      ),
      maxMinutes: $checkedConvert('maxMinutes', (v) => (v as num?)?.toInt()),
      anchors: $checkedConvert(
        'anchors',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Anchor.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      candidates: $checkedConvert(
        'candidates',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      criteria: $checkedConvert(
        'criteria',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Criterion.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      committed: $checkedConvert('committed', (v) => v as bool? ?? false),
      chosenCandidateId: $checkedConvert(
        'chosenCandidateId',
        (v) => v as String?,
      ),
      adults: $checkedConvert('adults', (v) => (v as num?)?.toInt()),
      childAges: $checkedConvert(
        'childAges',
        (v) => (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList(),
      ),
      homeType: $checkedConvert(
        'homeType',
        (v) => $enumDecodeNullable(_$HomeTypeEnumMap, v),
      ),
      outdoor: $checkedConvert(
        'outdoor',
        (v) => $enumDecodeNullable(_$OutdoorSpaceEnumMap, v),
      ),
      style: $checkedConvert(
        'style',
        (v) => $enumDecodeNullable(_$HomeStyleEnumMap, v),
      ),
      rooms: $checkedConvert('rooms', (v) => (v as num?)?.toInt()),
      areaIds: $checkedConvert(
        'areaIds',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
      priceMax: $checkedConvert(
        'priceMax',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      sampleCity: $checkedConvert('sampleCity', (v) => v as String?),
      areaOptions: $checkedConvert(
        'areaOptions',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => AreaOption.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      needs: $checkedConvert(
        'needs',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => $enumDecode(_$HomeNeedEnumMap, e))
                .toList() ??
            const [],
      ),
      readings: $checkedConvert(
        'readings',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => ListingRead.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      answered: $checkedConvert(
        'answered',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => $enumDecode(_$CaseFacetEnumMap, e))
                .toList() ??
            const [],
      ),
      questions: $checkedConvert('questions', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
);

Map<String, dynamic> _$StoryToJson(_Story instance) => <String, dynamic>{
  'reason': ?_$StoryReasonEnumMap[instance.reason],
  'city': ?instance.city,
  'cityPoint': ?instance.cityPoint?.toJson(),
  'mode': ?_$TravelModeEnumMap[instance.mode],
  'maxMinutes': ?instance.maxMinutes,
  'anchors': instance.anchors.map((e) => e.toJson()).toList(),
  'candidates': instance.candidates.map((e) => e.toJson()).toList(),
  'criteria': instance.criteria.map((e) => e.toJson()).toList(),
  'committed': instance.committed,
  'chosenCandidateId': ?instance.chosenCandidateId,
  'adults': ?instance.adults,
  'childAges': ?instance.childAges,
  'homeType': ?_$HomeTypeEnumMap[instance.homeType],
  'outdoor': ?_$OutdoorSpaceEnumMap[instance.outdoor],
  'style': ?_$HomeStyleEnumMap[instance.style],
  'rooms': ?instance.rooms,
  'areaIds': instance.areaIds,
  'priceMax': ?instance.priceMax?.toJson(),
  'sampleCity': ?instance.sampleCity,
  'areaOptions': instance.areaOptions.map((e) => e.toJson()).toList(),
  'needs': instance.needs.map((e) => _$HomeNeedEnumMap[e]!).toList(),
  'readings': instance.readings.map((e) => e.toJson()).toList(),
  'answered': instance.answered.map((e) => _$CaseFacetEnumMap[e]!).toList(),
  'questions': instance.questions,
};

const _$StoryReasonEnumMap = {
  StoryReason.work: 'work',
  StoryReason.study: 'study',
  StoryReason.family: 'family',
  StoryReason.lifestyle: 'lifestyle',
  StoryReason.retirement: 'retirement',
  StoryReason.investment: 'investment',
  StoryReason.other: 'other',
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.bike: 'bike',
  TravelMode.car: 'car',
  TravelMode.transit: 'transit',
};

const _$HomeTypeEnumMap = {HomeType.flat: 'flat', HomeType.house: 'house'};

const _$OutdoorSpaceEnumMap = {
  OutdoorSpace.none: 'none',
  OutdoorSpace.balcony: 'balcony',
  OutdoorSpace.garden: 'garden',
};

const _$HomeStyleEnumMap = {
  HomeStyle.classic: 'classic',
  HomeStyle.modern: 'modern',
};

const _$HomeNeedEnumMap = {
  HomeNeed.stepFree: 'stepFree',
  HomeNeed.lift: 'lift',
  HomeNeed.entryLevelShower: 'entryLevelShower',
  HomeNeed.entryLevelBedroom: 'entryLevelBedroom',
  HomeNeed.homeOffice: 'homeOffice',
  HomeNeed.pets: 'pets',
};

const _$CaseFacetEnumMap = {
  CaseFacet.place: 'place',
  CaseFacet.household: 'household',
  CaseFacet.mode: 'mode',
  CaseFacet.maxMinutes: 'maxMinutes',
  CaseFacet.homeType: 'homeType',
  CaseFacet.outdoor: 'outdoor',
  CaseFacet.style: 'style',
  CaseFacet.rooms: 'rooms',
  CaseFacet.criterion: 'criterion',
  CaseFacet.photo: 'photo',
  CaseFacet.area: 'area',
  CaseFacet.needs: 'needs',
  CaseFacet.routine: 'routine',
  CaseFacet.swipe: 'swipe',
};
