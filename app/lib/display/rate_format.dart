import 'package:common/common.dart';
import 'package:intl/intl.dart';

final _rate = NumberFormat.decimalPercentPattern(decimalDigits: 2);

String formatRate(Rate rate) => _rate.format(rate.fraction);
