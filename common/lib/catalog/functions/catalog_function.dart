import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_annotation/json_annotation.dart';

import '../catalog_component.dart';

abstract class CatalogFunction implements FunctionApi {
  const CatalogFunction();

  String get description;

  CatalogPart get part => CatalogPart.story;

  Object? evaluate(Map<String, Object?> args);
}

T? parseArgument<T>(
  Map<String, Object?> args,
  String name,
  T Function(Map<String, Object?> json) fromJson,
) {
  if (args[name] case final Map<String, Object?> json) {
    try {
      return fromJson(json);
    } on CheckedFromJsonException {
      return null;
    }
  }
  return null;
}
