import 'package:homeward_server/gemini/pacific_midnight.dart';
import 'package:test/test.dart';

void main() {
  final cases = <(String, DateTime, DateTime)>[
    (
      'a summer morning',
      DateTime.utc(2026, 9, 17, 10),
      DateTime.utc(2026, 9, 18, 7),
    ),
    (
      'a minute before midnight in summer',
      DateTime.utc(2026, 9, 17, 6, 59),
      DateTime.utc(2026, 9, 17, 7),
    ),
    (
      'a winter day',
      DateTime.utc(2026, 12, 1, 12),
      DateTime.utc(2026, 12, 2, 8),
    ),
    (
      'the night clocks go forward',
      DateTime.utc(2026, 3, 8, 9),
      DateTime.utc(2026, 3, 9, 7),
    ),
    (
      'the evening before clocks go back',
      DateTime.utc(2026, 11, 1, 6),
      DateTime.utc(2026, 11, 1, 7),
    ),
    (
      'the day clocks went back',
      DateTime.utc(2026, 11, 1, 12),
      DateTime.utc(2026, 11, 2, 8),
    ),
  ];

  for (final (name, now, expected) in cases) {
    test('resets after $name', () {
      expect(nextPacificMidnight(now), expected);
    });
  }
}
