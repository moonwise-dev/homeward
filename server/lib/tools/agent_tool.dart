import 'dart:async';

import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../gemini/function_declaration.dart';
import '../markets/market_directory.dart';
import '../research/research_steps.dart';

part 'agent_tool.freezed.dart';

@freezed
abstract class ToolContext with _$ToolContext {
  const factory ToolContext({
    required MarketDirectory markets,
    required Plan plan,
    @Default(SilentSteps()) ResearchSteps steps,
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

  Map<String, Object?>? settledArguments(ToolContext context) => null;

  bool isOffered(ToolContext context) => true;

  FutureOr<ToolResult> run(Map<String, Object?> arguments, ToolContext context);
}

abstract class ModelTool extends AgentTool {
  const ModelTool();

  String get description;

  Map<String, Object?> get parameters;

  FunctionDeclaration get declaration => FunctionDeclaration(
    name: name,
    description: description,
    parameters: parameters,
  );
}
