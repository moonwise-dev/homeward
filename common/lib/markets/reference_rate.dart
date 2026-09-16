import 'package:freezed_annotation/freezed_annotation.dart';

import '../money/rate.dart';
import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';
import 'source.dart';
import 'values/percent_json_converter.dart';

part 'reference_rate.freezed.dart';
part 'reference_rate.g.dart';

@freezed
abstract class ReferenceRate with _$ReferenceRate {
  const factory ReferenceRate({
    required String id,
    @PercentJsonConverter() required Rate rate,
    @CalendarDateJsonConverter() required CalendarDate asOf,
    required Source source,
  }) = _ReferenceRate;

  factory ReferenceRate.fromJson(Map<String, Object?> json) =>
      _$ReferenceRateFromJson(json);
}
