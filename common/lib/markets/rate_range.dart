import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/rate.dart';
import 'values/percent_json_converter.dart';

part 'rate_range.freezed.dart';
part 'rate_range.g.dart';

@freezed
abstract class RateRange with _$RateRange {
  const factory RateRange({
    @PercentJsonConverter() required Rate min,
    @PercentJsonConverter() required Rate max,
  }) = _RateRange;

  factory RateRange.fromJson(Map<String, Object?> json) =>
      _$RateRangeFromJson(json);
}
