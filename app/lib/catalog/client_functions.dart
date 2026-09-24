import 'package:a2ui_core/a2ui_core.dart' show A2uiReturnType;
import 'package:common/common.dart';
import 'package:genui/genui.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

final class CatalogClientFunction extends SynchronousClientFunction {
  const CatalogClientFunction(this.function);

  final CatalogFunction function;

  @override
  String get name => function.name;

  @override
  String get description => function.description;

  @override
  Schema get argumentSchema => function.argumentSchema;

  @override
  ClientFunctionReturnType get returnType => switch (function.returnType) {
    A2uiReturnType.string => ClientFunctionReturnType.string,
    A2uiReturnType.number => ClientFunctionReturnType.number,
    A2uiReturnType.boolean => ClientFunctionReturnType.boolean,
    A2uiReturnType.array => ClientFunctionReturnType.array,
    A2uiReturnType.object => ClientFunctionReturnType.object,
    A2uiReturnType.any => ClientFunctionReturnType.any,
    A2uiReturnType.void_ => ClientFunctionReturnType.empty,
  };

  @override
  Object? executeSync(JsonMap args, ExecutionContext context) =>
      function.evaluate(args);
}
