import 'package:freezed_annotation/freezed_annotation.dart';

part 'year_range.freezed.dart';
part 'year_range.g.dart';

@freezed
abstract class YearRange with _$YearRange {
  const factory YearRange({int? min, int? max}) = _YearRange;

  const YearRange._();

  bool contains(int value) =>
      (min == null || value >= min!) && (max == null || value <= max!);

  factory YearRange.fromJson(Map<String, Object?> json) =>
      _$YearRangeFromJson(json);
}
