// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_vs_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuyRentYear _$BuyRentYearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuyRentYear', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['year', 'buying', 'renting', 'equity'],
      );
      final val = _BuyRentYear(
        year: $checkedConvert('year', (v) => (v as num).toInt()),
        buying: $checkedConvert(
          'buying',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        renting: $checkedConvert(
          'renting',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        equity: $checkedConvert(
          'equity',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BuyRentYearToJson(_BuyRentYear instance) =>
    <String, dynamic>{
      'year': instance.year,
      'buying': instance.buying.toJson(),
      'renting': instance.renting.toJson(),
      'equity': instance.equity.toJson(),
    };

_BuyVsRentSlice _$BuyVsRentSliceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_BuyVsRentSlice', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'marketName',
          'sample',
          'homeId',
          'homeName',
          'price',
          'downPayment',
          'loan',
          'annualRatePpm',
          'loanType',
          'purchaseCosts',
          'fee',
          'deducts',
          'rent',
          'years',
          'yearsAssumed',
          'points',
          'breakEvenYear',
        ],
      );
      final val = _BuyVsRentSlice(
        marketName: $checkedConvert('marketName', (v) => v as String),
        sample: $checkedConvert('sample', (v) => v as bool? ?? true),
        homeId: $checkedConvert('homeId', (v) => v as String?),
        homeName: $checkedConvert('homeName', (v) => v as String?),
        price: $checkedConvert(
          'price',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        downPayment: $checkedConvert(
          'downPayment',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        loan: $checkedConvert(
          'loan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        loanType: $checkedConvert('loanType', (v) => v as String),
        purchaseCosts: $checkedConvert(
          'purchaseCosts',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        fee: $checkedConvert(
          'fee',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        deducts: $checkedConvert('deducts', (v) => v as bool),
        rent: $checkedConvert(
          'rent',
          (v) => RentFigure.fromJson(v as Map<String, dynamic>),
        ),
        years: $checkedConvert('years', (v) => (v as num).toInt()),
        yearsAssumed: $checkedConvert(
          'yearsAssumed',
          (v) => v as bool? ?? false,
        ),
        points: $checkedConvert(
          'points',
          (v) => (v as List<dynamic>)
              .map((e) => BuyRentYear.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        breakEvenYear: $checkedConvert(
          'breakEvenYear',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$BuyVsRentSliceToJson(_BuyVsRentSlice instance) =>
    <String, dynamic>{
      'marketName': instance.marketName,
      'sample': instance.sample,
      'homeId': ?instance.homeId,
      'homeName': ?instance.homeName,
      'price': instance.price.toJson(),
      'downPayment': instance.downPayment.toJson(),
      'loan': instance.loan.toJson(),
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'loanType': instance.loanType,
      'purchaseCosts': instance.purchaseCosts.toJson(),
      'fee': ?instance.fee?.toJson(),
      'deducts': instance.deducts,
      'rent': instance.rent.toJson(),
      'years': instance.years,
      'yearsAssumed': instance.yearsAssumed,
      'points': instance.points.map((e) => e.toJson()).toList(),
      'breakEvenYear': ?instance.breakEvenYear,
    };
