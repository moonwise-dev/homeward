import 'package:flutter/services.dart';

import '../display/money_format.dart';

class AppDigitGroupFormatter extends TextInputFormatter {
  const AppDigitGroupFormatter(this.group);

  final String Function(String digits) group;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final caret = newValue.selection.end.clamp(0, newValue.text.length);
    final typed = digitsOf(newValue.text.substring(0, caret)).length;
    final text = group(digitsOf(newValue.text));
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: _offsetAfter(text, typed)),
    );
  }

  int _offsetAfter(String text, int digits) {
    if (digits == 0) {
      return 0;
    }
    var seen = 0;
    for (var index = 0; index < text.length; index++) {
      if (digitsOf(text[index]).isNotEmpty) {
        seen++;
        if (seen == digits) {
          return index + 1;
        }
      }
    }
    return text.length;
  }
}
