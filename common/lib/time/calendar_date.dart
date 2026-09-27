extension type const CalendarDate._(String isoDate) {
  factory CalendarDate.parse(String text) {
    final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(text);
    if (match == null ||
        DateTime.utc(
              int.parse(match[1]!),
              int.parse(match[2]!),
              int.parse(match[3]!),
            ).toIso8601String().substring(0, 10) !=
            text) {
      throw FormatException('Expected a calendar date as YYYY-MM-DD', text);
    }
    return CalendarDate._(text);
  }

  factory CalendarDate.ofUtc(DateTime time) =>
      CalendarDate._(time.toIso8601String().substring(0, 10));

  DateTime get utcMidnight => DateTime.parse('${isoDate}T00:00:00Z');

  CalendarDate plusDays(int days) =>
      CalendarDate.ofUtc(utcMidnight.add(Duration(days: days)));

  CalendarDate monthStartIn(int months) {
    final date = utcMidnight;
    return CalendarDate.ofUtc(DateTime.utc(date.year, date.month + months));
  }

  bool isBefore(CalendarDate other) => isoDate.compareTo(other.isoDate) < 0;
}
