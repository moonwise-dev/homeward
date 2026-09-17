import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'app_text_field.dart';

class AppMoneyField extends StatelessWidget {
  const AppMoneyField({
    required this.label,
    required this.majorUnits,
    required this.unitLabel,
    required this.onChanged,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  final String label;
  final int? majorUnits;
  final String unitLabel;
  final ValueChanged<int?> onChanged;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) => AppTextField(
    label: label,
    value: majorUnits?.toString() ?? '',
    onChanged: (text) => onChanged(int.tryParse(text)),
    errorText: errorText,
    enabled: enabled,
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
