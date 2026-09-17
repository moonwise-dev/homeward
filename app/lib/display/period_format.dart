import 'package:common/common.dart';

String formatPeriod(Period period) {
  final parts = [
    if (period.years > 0) _count(period.years, 'year'),
    if (period.months > 0) _count(period.months, 'month'),
    if (period.weeks > 0) _count(period.weeks, 'week'),
    if (period.days > 0) _count(period.days, 'day'),
  ];
  return parts.join(' and ');
}

String _count(int amount, String unit) =>
    '$amount $unit${amount == 1 ? '' : 's'}';
