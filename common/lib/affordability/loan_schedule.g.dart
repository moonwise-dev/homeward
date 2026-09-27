// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoanYear _$LoanYearFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LoanYear', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const ['year', 'balance', 'equity', 'interestPaid'],
      );
      final val = _LoanYear(
        year: $checkedConvert('year', (v) => (v as num).toInt()),
        balance: $checkedConvert(
          'balance',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        equity: $checkedConvert(
          'equity',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
        interestPaid: $checkedConvert(
          'interestPaid',
          (v) => Money.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoanYearToJson(_LoanYear instance) => <String, dynamic>{
  'year': instance.year,
  'balance': instance.balance.toJson(),
  'equity': instance.equity.toJson(),
  'interestPaid': instance.interestPaid.toJson(),
};

_AmortizationStep _$AmortizationStepFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AmortizationStep',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['year', 'annualRatePpm', 'belowSharePpm'],
        );
        final val = _AmortizationStep(
          year: $checkedConvert('year', (v) => (v as num).toInt()),
          annualRate: $checkedConvert(
            'annualRatePpm',
            (v) => const PpmJsonConverter().fromJson((v as num).toInt()),
          ),
          belowShare: $checkedConvert(
            'belowSharePpm',
            (v) => _$JsonConverterFromJson<int, Rate>(
              v,
              const PpmJsonConverter().fromJson,
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'annualRate': 'annualRatePpm',
        'belowShare': 'belowSharePpm',
      },
    );

Map<String, dynamic> _$AmortizationStepToJson(_AmortizationStep instance) =>
    <String, dynamic>{
      'year': instance.year,
      'annualRatePpm': const PpmJsonConverter().toJson(instance.annualRate),
      'belowSharePpm': ?_$JsonConverterToJson<int, Rate>(
        instance.belowShare,
        const PpmJsonConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_LoanSchedule _$LoanScheduleFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LoanSchedule', json, ($checkedConvert) {
  $checkKeys(json, allowedKeys: const ['years', 'steps', 'paidOffYear']);
  final val = _LoanSchedule(
    years: $checkedConvert(
      'years',
      (v) => (v as List<dynamic>)
          .map((e) => LoanYear.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    steps: $checkedConvert(
      'steps',
      (v) =>
          (v as List<dynamic>?)
              ?.map((e) => AmortizationStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    ),
    paidOffYear: $checkedConvert('paidOffYear', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$LoanScheduleToJson(_LoanSchedule instance) =>
    <String, dynamic>{
      'years': instance.years.map((e) => e.toJson()).toList(),
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'paidOffYear': ?instance.paidOffYear,
    };
