// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavingsPlanSlice _$SavingsPlanSliceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SavingsPlanSlice', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'marketName',
          'sample',
          'homeId',
          'homeName',
          'price',
          'downPayment',
          'downPaymentChosen',
          'cashNeeded',
          'costsIncluded',
          'saved',
          'monthlySaving',
          'toSave',
          'months',
          'from',
          'reachedIn',
        ],
      );
      final val = _SavingsPlanSlice(
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
        downPaymentChosen: $checkedConvert(
          'downPaymentChosen',
          (v) => v as bool? ?? false,
        ),
        cashNeeded: $checkedConvert(
          'cashNeeded',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        costsIncluded: $checkedConvert(
          'costsIncluded',
          (v) => v as bool? ?? true,
        ),
        saved: $checkedConvert(
          'saved',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        monthlySaving: $checkedConvert(
          'monthlySaving',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        toSave: $checkedConvert(
          'toSave',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        months: $checkedConvert('months', (v) => (v as num).toInt()),
        from: $checkedConvert(
          'from',
          (v) => const CalendarDateJsonConverter().fromJson(v as String),
        ),
        reachedIn: $checkedConvert(
          'reachedIn',
          (v) => const CalendarDateJsonConverter().fromJson(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SavingsPlanSliceToJson(_SavingsPlanSlice instance) =>
    <String, dynamic>{
      'marketName': instance.marketName,
      'sample': instance.sample,
      'homeId': ?instance.homeId,
      'homeName': ?instance.homeName,
      'price': instance.price.toJson(),
      'downPayment': instance.downPayment.toJson(),
      'downPaymentChosen': instance.downPaymentChosen,
      'cashNeeded': instance.cashNeeded.toJson(),
      'costsIncluded': instance.costsIncluded,
      'saved': instance.saved.toJson(),
      'monthlySaving': instance.monthlySaving.toJson(),
      'toSave': instance.toSave.toJson(),
      'months': instance.months,
      'from': const CalendarDateJsonConverter().toJson(instance.from),
      'reachedIn': const CalendarDateJsonConverter().toJson(instance.reachedIn),
    };
