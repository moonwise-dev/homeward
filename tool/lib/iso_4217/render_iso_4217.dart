import 'iso_4217_table.dart';

String renderIso4217(Iso4217Table table) {
  final codes = table.minorDigits.keys.toList()..sort();
  final entries = codes.map((code) => "  '$code': ${table.minorDigits[code]},");
  return [
    "const iso4217PublishedOn = '${table.publishedOn}';",
    '',
    'const iso4217MinorDigits = <String, int>{',
    ...entries,
    '};',
    '',
  ].join('\n');
}
