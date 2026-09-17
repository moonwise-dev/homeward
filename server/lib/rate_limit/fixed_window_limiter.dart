final class FixedWindowLimiter {
  FixedWindowLimiter({
    required this.limit,
    required this.window,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  final int limit;
  final Duration window;
  final DateTime Function() _now;
  final _windows = <String, ({DateTime start, int count})>{};

  Duration? retryAfter(String key) {
    final now = _now();
    _windows.removeWhere((_, entry) => !now.isBefore(entry.start.add(window)));
    final entry = _windows[key] ?? (start: now, count: 0);
    if (entry.count >= limit) {
      return entry.start.add(window).difference(now);
    }
    _windows[key] = (start: entry.start, count: entry.count + 1);
    return null;
  }
}
