import 'package:freezed_annotation/freezed_annotation.dart';

part 'function_declaration.freezed.dart';

@freezed
abstract class FunctionDeclaration with _$FunctionDeclaration {
  const factory FunctionDeclaration({
    required String name,
    required String description,
    required Map<String, Object?> parameters,
  }) = _FunctionDeclaration;

  const FunctionDeclaration._();

  Map<String, Object?> toJson() => {
    'type': 'function',
    'name': name,
    'description': description,
    'parameters': parameters,
  };
}
