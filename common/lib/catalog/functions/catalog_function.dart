import 'package:a2ui_core/a2ui_core.dart';

abstract class CatalogFunction implements FunctionApi {
  const CatalogFunction();

  String get description;

  Object? evaluate(Map<String, Object?> args);
}
