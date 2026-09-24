import 'package:flutter/material.dart';

import '../themes/dimens.dart';
import '../themes/text_styles.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    super.key,
  });

  final String label;
  final int? value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final value = this.value;
    return Row(
      children: [
        Expanded(child: Text(label, style: AppTextStyles.body)),
        IconButton.outlined(
          tooltip: 'One less',
          onPressed: value != null && value > min
              ? () => onChanged(value - 1)
              : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: AppSizes.control,
          child: Text(
            value?.toString() ?? '–',
            textAlign: TextAlign.center,
            style: AppTextStyles.figure,
          ),
        ),
        IconButton.outlined(
          tooltip: 'One more',
          onPressed: switch (value) {
            null => () => onChanged(min),
            _ when value < max => () => onChanged(value + 1),
            _ => null,
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
