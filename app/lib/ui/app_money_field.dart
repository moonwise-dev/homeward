import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../display/money_format.dart';
import 'app_digit_group_formatter.dart';
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
      inputFormatters: [AppDigitGroupFormatter(group)],
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
