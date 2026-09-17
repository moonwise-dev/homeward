import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  test('accepts a language with a known region', () {
    expect(LocaleTag.parse('sv-SE').tag, 'sv-SE');
    expect(LocaleTag.parse('pt-PT').tag, 'pt-PT');
    expect(LocaleTag.parse('fil-PH').tag, 'fil-PH');
  });

  test('refuses tags without a known region', () {
    for (final tag in ['sv', 'sv_SE', 'SV-se', 'sv-XX', 'sv-SE-x', '']) {
      expect(() => LocaleTag.parse(tag), throwsFormatException, reason: tag);
    }
  });
}
