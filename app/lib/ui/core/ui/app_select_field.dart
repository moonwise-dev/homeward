import 'package:flutter/material.dart';

import '../themes/text_styles.dart';

class AppSelectField<T> extends StatelessWidget {
  const AppSelectField({
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.enableFilter = false,
    this.enabled = true,
    super.key,
  });

  final String label;
  final List<AppSelectOption<T>> options;
  final T? value;
  final ValueChanged<T> onChanged;
  final bool enableFilter;
  final bool enabled;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => DropdownMenu<T>(
      key: ValueKey(value),
      width: constraints.maxWidth,
      label: Text(label),
      initialSelection: value,
      enabled: enabled,
      enableFilter: enableFilter,
      requestFocusOnTap: enableFilter,
      textStyle: AppTextStyles.body,
      menuHeight: 320,
      onSelected: (selected) {
        if (selected != null) {
          onChanged(selected);
        }
      },
      dropdownMenuEntries: [
        for (final option in options)
          DropdownMenuEntry(
            value: option.value,
            label: option.label,
            trailingIcon: option.trailing,
          ),
      ],
    ),
  );
}

class AppSelectOption<T> {
  const AppSelectOption({
    required this.value,
    required this.label,
    this.trailing,
  });

  final T value;
  final String label;
  final Widget? trailing;
}
