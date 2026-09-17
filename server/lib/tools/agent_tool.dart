import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../gemini/function_declaration.dart';
import '../markets/market_directory.dart';

part 'agent_tool.freezed.dart';

@freezed
abstract class ToolContext with _$ToolContext {
  const factory ToolContext({
    required MarketDirectory markets,
    required Plan plan,
  }) = _ToolContext;
}

@freezed
abstract class ToolResult with _$ToolResult {
  const factory ToolResult({
    required Map<String, Object?> modelResult,
    @Default({}) Map<String, Object?> seeds,
    Plan? plan,
  }) = _ToolResult;
}

abstract class AgentTool {
  const AgentTool();

  String get name;

  String get description;

  Map<String, Object?> get parameters;

  Map<String, Object?>? settledArguments(ToolContext context) => null;

  ToolResult run(Map<String, Object?> arguments, ToolContext context);

  FunctionDeclaration get declaration => FunctionDeclaration(
    name: name,
    description: description,
    parameters: parameters,
  );
}
