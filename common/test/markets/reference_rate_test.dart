import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('reads a dated rate written as published', () {
    final rate = ReferenceRate.fromJson({
      'id': 'SE.AVG_VARIABLE_3M',
      'rate': '3.12%',
      'asOf': '2026-08-31',
      'source': {
        'id': 'scb-mortgage-rates',
        'publisher': 'Statistics Sweden',
        'title': 'Average interest rates on new mortgage loans',
        'url': 'https://www.scb.se',
        'kind': 'officialStatistics',
        'retrievedAt': '2026-09-17',
      },
    });

    expect(rate.rate, const Rate.ppm(31200));
    expect(rate.asOf, CalendarDate.parse('2026-08-31'));
    expect(ReferenceRate.fromJson(rate.toJson()), rate);
  });
}
