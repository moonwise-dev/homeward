// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Candidate _$CandidateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Candidate', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'id',
          'label',
          'query',
          'point',
          'address',
          'price',
          'monthlyFee',
          'listingUrl',
        ],
      );
      final val = _Candidate(
        id: $checkedConvert('id', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        query: $checkedConvert('query', (v) => v as String),
        point: $checkedConvert(
          'point',
          (v) =>
              v == null ? null : GeoPoint.fromJson(v as Map<String, dynamic>),
        ),
        address: $checkedConvert('address', (v) => v as String?),
        price: $checkedConvert(
          'price',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        monthlyFee: $checkedConvert(
          'monthlyFee',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        listingUrl: $checkedConvert('listingUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CandidateToJson(_Candidate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'query': instance.query,
      'point': ?instance.point?.toJson(),
      'address': ?instance.address,
      'price': ?instance.price?.toJson(),
      'monthlyFee': ?instance.monthlyFee?.toJson(),
      'listingUrl': ?instance.listingUrl,
    };
