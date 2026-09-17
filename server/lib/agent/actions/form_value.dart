import 'package:common/common.dart';

Object? formValue(SliceField field, Object? value) => switch ((
  field.kind,
  value,
)) {
  (FieldKind.choice, [final Object? selected]) => selected,
  (FieldKind.choice, []) => null,
  (FieldKind.integer, _) => _integer(value),
  (FieldKind.integers, final List<Object?> items) => [
    for (final item in items) _integer(item),
  ],
  (FieldKind.country, final String code) => code.trim().toUpperCase(),
  _ => value,
};

Object? _integer(Object? value) => switch (value) {
  final double number when number == number.truncateToDouble() =>
    number.toInt(),
  final String text => int.tryParse(text.trim()) ?? text,
  _ => value,
};
