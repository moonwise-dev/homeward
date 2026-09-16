import 'package:common/common.dart';

Money eur(int minorUnits) =>
    Money(minorUnits: minorUnits, currency: Currency.parse('EUR'));

Money sek(int minorUnits) =>
    Money(minorUnits: minorUnits, currency: Currency.parse('SEK'));
