DateTime nextPacificMidnight(DateTime now) {
  final utc = now.toUtc();
  final local = utc.add(Duration(hours: _pacificOffsetHours(utc)));
  final tomorrow = DateTime.utc(local.year, local.month, local.day + 1);
  return tomorrow.add(
    Duration(hours: _isDaylightTimeAtMidnight(tomorrow) ? 7 : 8),
  );
}

int _pacificOffsetHours(DateTime utc) {
  final start = _nthSunday(utc.year, DateTime.march, 2).add(
    const Duration(hours: 10),
  );
  final end = _nthSunday(utc.year, DateTime.november, 1).add(
    const Duration(hours: 9),
  );
  return !utc.isBefore(start) && utc.isBefore(end) ? -7 : -8;
}

bool _isDaylightTimeAtMidnight(DateTime localDate) =>
    localDate.isAfter(_nthSunday(localDate.year, DateTime.march, 2)) &&
    !localDate.isAfter(_nthSunday(localDate.year, DateTime.november, 1));

DateTime _nthSunday(int year, int month, int n) {
  final first = DateTime.utc(year, month);
  final firstSunday = 1 + (DateTime.sunday - first.weekday) % 7;
  return DateTime.utc(year, month, firstSunday + 7 * (n - 1));
}
