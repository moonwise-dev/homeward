import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('accepts real dates and adds days across months', () {
    final date = CalendarDate.parse('2026-09-16');

    expect(date.plusDays(180), CalendarDate.parse('2027-03-15'));
    expect(date.isBefore(CalendarDate.parse('2026-09-17')), isTrue);
  });

  for (final text in ['2026-02-30', '2026-9-16', '16/09/2026', '2026-13-01']) {
    test('rejects $text', () {
      expect(() => CalendarDate.parse(text), throwsFormatException);
    });
  }
}
