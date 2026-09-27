import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/money.dart';
import '../money/ppm_json_converter.dart';
import '../money/rate.dart';

part 'scenario.freezed.dart';
part 'scenario.g.dart';

@freezed
abstract class Scenario with _$Scenario {
  @Assert('termYears > 0', 'termYears must be positive')
  const factory Scenario({
    required Money price,
    required Money downPayment,
    required int termYears,
    required String loanTypeId,
    @JsonKey(name: 'rateSpreadPpm')
    @PpmJsonConverter()
    required Rate rateSpread,
    @JsonKey(name: 'rateShockPpm')
    @PpmJsonConverter()
    @Default(Rate.zero)
    Rate rateShock,
    Money? associationFee,
  }) = _Scenario;

  const Scenario._();

  factory Scenario.fromJson(Map<String, Object?> json) =>
      _$ScenarioFromJson(json);

  Money get loan => price - downPayment;

  int get months => termYears * 12;
}
