import 'package:homeward_server/rate_limit/fixed_window_limiter.dart';
import 'package:test/test.dart';

void main() {
  test('allows the limit per key per window, then says how long to wait', () {
    var clock = DateTime.utc(2026, 9, 17, 12);
    final limiter = FixedWindowLimiter(
      limit: 2,
      window: const Duration(minutes: 10),
      now: () => clock,
    );

    expect(limiter.retryAfter('uid-1'), isNull);
    clock = clock.add(const Duration(minutes: 4));
    expect(limiter.retryAfter('uid-1'), isNull);
    expect(limiter.retryAfter('uid-1'), const Duration(minutes: 6));
    expect(limiter.retryAfter('uid-2'), isNull);

    clock = clock.add(const Duration(minutes: 6));
    expect(limiter.retryAfter('uid-1'), isNull);
  });
}
