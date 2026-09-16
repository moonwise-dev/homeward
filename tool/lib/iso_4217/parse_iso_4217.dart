import 'package:xml/xml.dart';

import 'iso_4217_table.dart';

Iso4217Table parseIso4217(String source) {
  final document = XmlDocument.parse(source);
  final entries = document
      .findAllElements('CcyNtry')
      .where(_isCirculatingCurrency);
  return (
    publishedOn: document.rootElement.getAttribute('Pblshd')!,
    minorDigits: {
      for (final entry in entries)
        _text(entry, 'Ccy')!: int.parse(_text(entry, 'CcyMnrUnts')!),
    },
  );
}

bool _isCirculatingCurrency(XmlElement entry) {
  final code = _text(entry, 'Ccy');
  final minorUnits = _text(entry, 'CcyMnrUnts');
  final isFund = entry.getElement('CcyNm')?.getAttribute('IsFund') == 'true';
  return code != null &&
      minorUnits != null &&
      int.tryParse(minorUnits) != null &&
      !isFund;
}

String? _text(XmlElement entry, String name) =>
    entry.getElement(name)?.innerText.trim();
