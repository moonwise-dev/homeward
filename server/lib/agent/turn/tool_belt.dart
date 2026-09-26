import 'package:common/common.dart';
import 'package:logging/logging.dart';

import '../../gemini/function_declaration.dart';
import '../../logging/log_entry.dart';
import '../../markets/market_directory.dart';
import '../../research/research_steps.dart';
import '../../research/researcher.dart';
import '../../tools/agent_tool.dart';

final _log = Logger('tools');

typedef SettledRun = ({Map<String, ToolResult> results, Plan plan});

final class ToolBelt {
  ToolBelt({required this.tools, required this.markets});

  final List<AgentTool> tools;
  final MarketDirectory markets;

  Future<SettledRun> runSettled(
    Plan plan, {
    ResearchSteps steps = const SilentSteps(),
    Researcher? researcher,
  }) async {
    var settled = plan;
    final results = <String, ToolResult>{};
    for (final tool in tools) {
      final context = ToolContext(
        markets: markets,
        plan: settled,
        steps: steps,
        researcher: researcher,
      );
      if (tool.settledArguments(context) case final arguments?) {
        final result = await _run(tool, arguments, context);
        results[tool.name] = result;
        settled = result.plan ?? settled;
      }
    }
    return (results: results, plan: settled);
  }

  List<FunctionDeclaration> declarationsFor(
    Plan plan, {
    Set<String> withholding = const {},
  }) {
    final context = ToolContext(markets: markets, plan: plan);
    return [
      for (final tool in tools.whereType<ModelTool>())
        if (tool.settledArguments(context) == null &&
            tool.isOffered(context) &&
            !withholding.contains(tool.name))
          tool.declaration,
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
