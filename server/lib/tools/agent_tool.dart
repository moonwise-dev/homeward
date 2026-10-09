import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../gemini/function_declaration.dart';
import 'tool_context.dart';

part 'agent_tool.freezed.dart';

@freezed
abstract class ToolResult with _$ToolResult {
  const factory ToolResult({
    required Map<String, Object?> modelResult,
    @Default({}) Map<String, Object?> seeds,
    @Default({}) Map<String, Object?> logFields,
    @Default([]) List<String> showCards,
    @Default([]) List<String> removeCards,
  }) = _ToolResult;
}

abstract class AgentTool {
  const AgentTool();

  String get name;

  String get description;

  Map<String, Object?> get parameters;

  bool get readsCatalog => false;

  FunctionDeclaration get declaration => FunctionDeclaration(
    name: name,
    description: description,
    parameters: parameters,
  );

  FutureOr<ToolResult> run(Map<String, Object?> arguments, ToolContext context);
}
