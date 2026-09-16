import 'package:freezed_annotation/freezed_annotation.dart';

import '../time/calendar_date.dart';
import '../time/calendar_date_json_converter.dart';
import 'source_kind.dart';

part 'source.freezed.dart';
part 'source.g.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    required String id,
    required String publisher,
    required String title,
    required String url,
    required SourceKind kind,
    @CalendarDateJsonConverter() required CalendarDate retrievedAt,
  }) = _Source;

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);
}
