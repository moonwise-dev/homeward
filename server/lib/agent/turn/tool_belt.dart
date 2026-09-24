import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../../gemini/function_declaration.dart';
import '../../logging/log_entry.dart';
import '../../markets/market_directory.dart';
import '../../research/research_steps.dart';
import '../../tools/agent_tool.dart';

final _log = Logger('tools');

final class ToolBelt {
  ToolBelt({required this.tools, required this.markets});

  final List<AgentTool> tools;
  final MarketDirectory markets;

  Future<Map<String, ToolResult>> runSettled(
    Plan plan, {
    ResearchSteps steps = const SilentSteps(),
  }) async {
    final context = ToolContext(markets: markets, plan: plan, steps: steps);
    return {
      for (final tool in tools)
        if (tool.settledArguments(context) case final arguments?)
          tool.name: await _run(tool, arguments, context),
    };
  }

  List<FunctionDeclaration> declarationsFor(Plan plan) {
    final context = ToolContext(markets: markets, plan: plan);
    return [
      for (final tool in tools.whereType<ModelTool>())
        if (tool.settledArguments(context) == null) tool.declaration,
    ];
  }

  int orderOf(String name) {
    final index = tools.indexWhere((tool) => tool.name == name);
    return index == -1 ? tools.length : index;
  }

  Future<ToolResult> call(
    String name,
    Map<String, Object?> arguments,
    Plan plan, {
    ResearchSteps steps = const SilentSteps(),
  }) async {
    final context = ToolContext(markets: markets, plan: plan, steps: steps);
    for (final tool in tools.whereType<ModelTool>()) {
      if (tool.name == name) {
        return _run(tool, arguments, context);
      }
    }
    return ToolResult(modelResult: {'error': 'There is no tool named $name'});
  }

  Future<ToolResult> _run(
    AgentTool tool,
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final stopwatch = Stopwatch()..start();
    try {
      return await tool.run(arguments, context);
    } on Object catch (error, stackTrace) {
      _log.severe('Tool ${tool.name} failed', error, stackTrace);
      return const ToolResult(
        modelResult: {'error': 'The tool failed; nothing was changed'},
      );
    } finally {
      _log.fine(
        LogEntry(
          'Tool ${tool.name}',
          fields: {
            'tool': tool.name,
            'durationMs': stopwatch.elapsedMilliseconds,
          },
        ),
      );
    }
  }
}
