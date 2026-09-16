import 'package:freezed_annotation/freezed_annotation.dart';

import '../finance/bracket.dart';
import '../money/currency.dart';
import '../money/rate.dart';
import 'values/exact_decimal.dart';
import 'values/exact_decimal_json_converter.dart';
import 'values/percent_json_converter.dart';

part 'bracket_rule.freezed.dart';
part 'bracket_rule.g.dart';

@freezed
abstract class BracketRule with _$BracketRule {
  const factory BracketRule({
    @ExactDecimalJsonConverter() ExactDecimal? upTo,
    @PercentJsonConverter() required Rate rate,
    @ExactDecimalJsonConverter() ExactDecimal? deduction,
  }) = _BracketRule;

  const BracketRule._();

  factory BracketRule.fromJson(Map<String, Object?> json) =>
      _$BracketRuleFromJson(json);

  Bracket toBracket(Currency currency) => Bracket(
    rate: rate,
    upTo: upTo?.toMoney(currency),
    deduction: deduction?.toMoney(currency),
  );
}
