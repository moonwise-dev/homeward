import 'package:json_annotation/json_annotation.dart';

import 'calendar_date.dart';

class CalendarDateJsonConverter implements JsonConverter<CalendarDate, String> {
  const CalendarDateJsonConverter();

  @override
  CalendarDate fromJson(String json) => CalendarDate.parse(json);

  @override
  String toJson(CalendarDate date) => date.isoDate;
}
