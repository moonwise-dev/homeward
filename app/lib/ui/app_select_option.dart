import 'package:flutter/widgets.dart';

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
