import 'package:json_annotation/json_annotation.dart';

T? jsonModelOf<T>(
  Object? value,
  T Function(Map<String, Object?> json) fromJson,
) {
  if (value is! Map<String, Object?>) {
    return null;
  }
  try {
    return fromJson(value);
  } on CheckedFromJsonException {
    return null;
  }
}
