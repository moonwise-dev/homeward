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
    @Default({}) Map<String, List<String>> showCardsAfter,
    @Default(false) bool asksOnCard,
    @Default({}) Map<String, String> cardNotes,
  }) = _ToolResult;
}

abstract class AgentTool {
  const AgentTool();

  String get name;

  String get description;

  Map<String, Object?> get parameters;

  bool get readsCatalog => false;

  Map<String, Object?>? argumentsForTap(
    String action,
    Map<String, Object?> context,
  ) => null;

  bool get tapsNeedNoReply => false;

  FunctionDeclaration get declaration => FunctionDeclaration(
    name: name,
    description: description,
    parameters: parameters,
  );

  FutureOr<ToolResult> run(Map<String, Object?> arguments, ToolContext context);
}
