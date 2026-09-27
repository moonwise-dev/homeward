// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketRate _$MarketRateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MarketRate', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'loanTypeId',
          'label',
          'rateType',
          'fixedYears',
          'annualRatePpm',
          'asOf',
          'source',
        ],
      );
      final val = _MarketRate(
        loanTypeId: $checkedConvert('loanTypeId', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
        rateType: $checkedConvert(
          'rateType',
          (v) => $enumDecode(_$RateTypeEnumMap, v),
        ),
        fixedYears: $checkedConvert(
          'fixedYears',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        annualRate: $checkedConvert(
          'annualRatePpm',
          (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
        ),
        asOf: $checkedConvert(
          'asOf',
          (v) => _$JsonConverterFromJson<String, CalendarDate>(
            v,
            const CalendarDateJsonConverter().fromJson,
          ),
        ),
        source: $checkedConvert(
          'source',
          (v) => v == null ? null : Source.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'annualRate': 'annualRatePpm'});

Map<String, dynamic> _$MarketRateToJson(_MarketRate instance) =>
    <String, dynamic>{
      'loanTypeId': instance.loanTypeId,
      'label': instance.label,
      'rateType': _$RateTypeEnumMap[instance.rateType]!,
      'fixedYears': instance.fixedYears,
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'asOf': ?_$JsonConverterToJson<String, CalendarDate>(
        instance.asOf,
        const CalendarDateJsonConverter().toJson,
      ),
      'source': ?instance.source?.toJson(),
    };

const _$RateTypeEnumMap = {
  RateType.variable: 'variable',
  RateType.mixed: 'mixed',
  RateType.fixed: 'fixed',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_MarketRule _$MarketRuleFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MarketRule',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      allowedKeys: const [
        'kind',
        'ratePpm',
        'multiple',
        'incomeBasis',
        'whenLtvAbovePpm',
        'upTo',
        'rateAbovePpm',
        'perBorrower',
        'source',
      ],
    );
    final val = _MarketRule(
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(_$MarketRuleKindEnumMap, v),
      ),
      rate: $checkedConvert(
        'ratePpm',
        (v) => _$JsonConverterFromJson<int, Rate>(
          v,
          const PpmJsonConverter().fromJson,
        ),
      ),
      multiple: $checkedConvert(
        'multiple',
        (v) => _$JsonConverterFromJson<String, ExactDecimal>(
          v,
          const ExactDecimalJsonConverter().fromJson,
        ),
      ),
      incomeBasis: $checkedConvert(
        'incomeBasis',
        (v) => $enumDecodeNullable(_$IncomeBasisEnumMap, v),
      ),
      whenLtvAbove: $checkedConvert(
        'whenLtvAbovePpm',
        (v) => _$JsonConverterFromJson<int, Rate>(
          v,
          const PpmJsonConverter().fromJson,
        ),
      ),
      upTo: $checkedConvert(
        'upTo',
        (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
      ),
      rateAbove: $checkedConvert(
        'rateAbovePpm',
        (v) => _$JsonConverterFromJson<int, Rate>(
          v,
          const PpmJsonConverter().fromJson,
        ),
      ),
      perBorrower: $checkedConvert('perBorrower', (v) => v as bool? ?? false),
      source: $checkedConvert(
        'source',
        (v) => v == null ? null : Source.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'rate': 'ratePpm',
    'whenLtvAbove': 'whenLtvAbovePpm',
    'rateAbove': 'rateAbovePpm',
  },
);

Map<String, dynamic> _$MarketRuleToJson(_MarketRule instance) =>
    <String, dynamic>{
      'kind': _$MarketRuleKindEnumMap[instance.kind]!,
      'ratePpm': ?_$JsonConverterToJson<int, Rate>(
        instance.rate,
        const PpmJsonConverter().toJson,
      ),
      'multiple': ?_$JsonConverterToJson<String, ExactDecimal>(
        instance.multiple,
        const ExactDecimalJsonConverter().toJson,
      ),
      'incomeBasis': ?_$IncomeBasisEnumMap[instance.incomeBasis],
      'whenLtvAbovePpm': ?_$JsonConverterToJson<int, Rate>(
        instance.whenLtvAbove,
        const PpmJsonConverter().toJson,
      ),
      'upTo': ?instance.upTo?.toJson(),
      'rateAbovePpm': ?_$JsonConverterToJson<int, Rate>(
        instance.rateAbove,
        const PpmJsonConverter().toJson,
      ),
      'perBorrower': instance.perBorrower,
      'source': ?instance.source?.toJson(),
    };

const _$MarketRuleKindEnumMap = {
  MarketRuleKind.loanToValue: 'loanToValue',
  MarketRuleKind.loanToIncome: 'loanToIncome',
  MarketRuleKind.debtServiceToIncome: 'debtServiceToIncome',
  MarketRuleKind.testedRate: 'testedRate',
  MarketRuleKind.amortization: 'amortization',
  MarketRuleKind.interestDeduction: 'interestDeduction',
};

const _$IncomeBasisEnumMap = {
  IncomeBasis.net: 'net',
  IncomeBasis.gross: 'gross',
};

_AreaFigures _$AreaFiguresFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_AreaFigures', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'areaId',
          'areaName',
          'homes',
          'pricePerM2',
          'priceSource',
          'rentPerM2',
          'rentSource',
        ],
      );
      final val = _AreaFigures(
        areaId: $checkedConvert('areaId', (v) => v as String),
        areaName: $checkedConvert('areaName', (v) => v as String),
        homes: $checkedConvert('homes', (v) => (v as num).toInt()),
        pricePerM2: $checkedConvert(
          'pricePerM2',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        priceSource: $checkedConvert('priceSource', (v) => v as String),
        rentPerM2: $checkedConvert(
          'rentPerM2',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        rentSource: $checkedConvert('rentSource', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AreaFiguresToJson(_AreaFigures instance) =>
    <String, dynamic>{
      'areaId': instance.areaId,
      'areaName': instance.areaName,
      'homes': instance.homes,
      'pricePerM2': instance.pricePerM2.toJson(),
      'priceSource': instance.priceSource,
      'rentPerM2': instance.rentPerM2.toJson(),
      'rentSource': instance.rentSource,
    };

_MarketSnapshot _$MarketSnapshotFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_MarketSnapshot', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'cityId',
          'cityName',
          'marketId',
          'marketName',
          'sample',
          'currency',
          'rates',
          'rules',
          'waitingOn',
          'areas',
        ],
      );
      final val = _MarketSnapshot(
        cityId: $checkedConvert('cityId', (v) => v as String),
        cityName: $checkedConvert('cityName', (v) => v as String),
        marketId: $checkedConvert('marketId', (v) => v as String),
        marketName: $checkedConvert('marketName', (v) => v as String),
        sample: $checkedConvert('sample', (v) => v as bool? ?? true),
        currency: $checkedConvert(
          'currency',
          (v) => const CurrencyJsonConverter().fromJson(v as String),
        ),
        rates: $checkedConvert(
          'rates',
          (v) => (v as List<dynamic>)
              .map((e) => MarketRate.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        rules: $checkedConvert(
          'rules',
          (v) => (v as List<dynamic>)
              .map((e) => MarketRule.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        waitingOn: $checkedConvert(
          'waitingOn',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => $enumDecode(_$ProfileFieldEnumMap, e))
                  .toList() ??
              const [],
        ),
        areas: $checkedConvert(
          'areas',
          (v) => (v as List<dynamic>)
              .map((e) => AreaFigures.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MarketSnapshotToJson(_MarketSnapshot instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'marketId': instance.marketId,
      'marketName': instance.marketName,
      'sample': instance.sample,
      'currency': const CurrencyJsonConverter().toJson(instance.currency),
      'rates': instance.rates.map((e) => e.toJson()).toList(),
      'rules': instance.rules.map((e) => e.toJson()).toList(),
      'waitingOn': instance.waitingOn
          .map((e) => _$ProfileFieldEnumMap[e]!)
          .toList(),
      'areas': instance.areas.map((e) => e.toJson()).toList(),
    };

const _$ProfileFieldEnumMap = {
  ProfileField.citizenship: 'citizenship',
  ProfileField.residency: 'residency',
  ProfileField.formerResident: 'formerResident',
  ProfileField.residencyIntent: 'residencyIntent',
  ProfileField.use: 'use',
  ProfileField.firstTime: 'firstTime',
  ProfileField.employment: 'employment',
  ProfileField.netMonthlyIncome: 'netMonthlyIncome',
  ProfileField.grossMonthlyIncome: 'grossMonthlyIncome',
  ProfileField.incomeCurrency: 'incomeCurrency',
  ProfileField.savings: 'savings',
  ProfileField.monthlyDebtPayments: 'monthlyDebtPayments',
  ProfileField.age: 'age',
  ProfileField.household: 'household',
  ProfileField.borrowers: 'borrowers',
};
