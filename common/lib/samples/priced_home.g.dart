// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priced_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PricedHome _$PricedHomeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PricedHome', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['listing', 'cost', 'kept']);
      final val = _PricedHome(
        listing: $checkedConvert(
          'listing',
          (v) => Listing.fromJson(v as Map<String, dynamic>),
        ),
        cost: $checkedConvert(
          'cost',
          (v) =>
              v == null ? null : HomeCost.fromJson(v as Map<String, dynamic>),
        ),
        kept: $checkedConvert('kept', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$PricedHomeToJson(_PricedHome instance) =>
    <String, dynamic>{
      'listing': instance.listing.toJson(),
      'cost': ?instance.cost?.toJson(),
      'kept': instance.kept,
    };

_HomeCost _$HomeCostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_HomeCost', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'downPayment',
          'loan',
          'maxLoan',
          'cashNeeded',
          'savings',
          'annualRatePpm',
          'loanType',
          'termYears',
          'monthly',
        ],
      );
      final val = _HomeCost(
        downPayment: $checkedConvert(
          'downPayment',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        loan: $checkedConvert(
          'loan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        maxLoan: $checkedConvert(
          'maxLoan',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        cashNeeded: $checkedConvert(
          'cashNeeded',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        savings: $checkedConvert(
          'savings',
          (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
        ),
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        loanType: $checkedConvert('loanType', (v) => v as String),
        termYears: $checkedConvert('termYears', (v) => (v as num).toInt()),
        monthly: $checkedConvert(
          'monthly',
          (v) => MonthlyFigures.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$HomeCostToJson(_HomeCost instance) => <String, dynamic>{
  'downPayment': instance.downPayment.toJson(),
  'loan': instance.loan.toJson(),
  'maxLoan': instance.maxLoan.toJson(),
  'cashNeeded': ?instance.cashNeeded?.toJson(),
  'savings': ?instance.savings?.toJson(),
  'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
  'loanType': instance.loanType,
  'termYears': instance.termYears,
  'monthly': instance.monthly.toJson(),
};
