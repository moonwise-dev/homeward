import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_text_field.dart';

class MoneyInputView extends StatelessWidget {
  const MoneyInputView({
    required this.label,
    required this.currency,
    required this.amount,
    required this.onChanged,
    this.period,
    super.key,
  });

  final String label;
  final String currency;
  final num? amount;
  final String? period;
  final ValueChanged<num?> onChanged;

  @override
  Widget build(BuildContext context) => AppTextField(
    label: label,
    value: amount == null ? '' : _plain(amount!),
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    onChanged: (text) => onChanged(int.tryParse(text)),
    suffix: Text(
      [
        currency,
        ?switch (period) {
          'month' => 'a month',
          'year' => 'a year',
          _ => null,
        },
      ].join(' '),
      style: AppTextStyles.label,
    ),
  );

  static String _plain(num amount) =>
      amount == amount.roundToDouble() ? '${amount.round()}' : '$amount';
}
