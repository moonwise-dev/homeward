import 'package:common/common.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../formats.dart';
import 'app_text_field.dart';

class AppMoneyField extends StatelessWidget {
  const AppMoneyField({
    required this.label,
    required this.majorUnits,
    required this.unitLabel,
    required this.locale,
    required this.onChanged,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  final String label;
  final int? majorUnits;
  final String unitLabel;
  final LocaleTag? locale;
  final ValueChanged<int?> onChanged;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final group = digitGroupingFor(locale);
    return AppTextField(
      label: label,
      value: majorUnits == null ? '' : group(majorUnits.toString()),
      onChanged: (text) => onChanged(int.tryParse(digitsOf(text))),
      errorText: errorText,
      enabled: enabled,
      keyboardType: TextInputType.number,
      inputFormatters: [_DigitGroupFormatter(group)],
      suffix: Padding(
        padding: const EdgeInsetsDirectional.only(end: 12),
        child: Align(
          widthFactor: 1,
          alignment: Alignment.centerRight,
          child: Text(unitLabel),
        ),
      ),
    );
  }
}

class _DigitGroupFormatter extends TextInputFormatter {
  const _DigitGroupFormatter(this.group);

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
