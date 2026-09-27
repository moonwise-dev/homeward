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

List<T>? jsonModelsOf<T extends Object>(
  Object? value,
  T Function(Map<String, Object?> json) fromJson,
) {
  if (value is! List<Object?>) {
    return null;
  }
  final models = [for (final item in value) jsonModelOf<T>(item, fromJson)];
  return models.contains(null) ? null : models.nonNulls.toList();
}
