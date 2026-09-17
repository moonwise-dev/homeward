import 'package:common/common.dart';
import 'package:intl/intl.dart';

final _share = NumberFormat.decimalPercentPattern(decimalDigits: 1);

String? formatShare(Money part, Money whole) =>
    whole.isZero || part.currency != whole.currency
    ? null
    : _share.format(part.minorUnits / whole.minorUnits);
