import 'package:logging/logging.dart';

import '../../gemini/function_declaration.dart';
import '../../logging/log_entry.dart';
import '../../research/research_steps.dart';
import '../../tools/agent_tool.dart';

final _log = Logger('tools');

final class ToolBelt {
  const ToolBelt(this.tools);

  final List<AgentTool> tools;

  List<FunctionDeclaration> get declarations => [
    for (final tool in tools) tool.declaration,
  ];

  Future<ToolResult> call(
    String name,
    Map<String, Object?> arguments, {
    ResearchSteps steps = const SilentSteps(),
  }) async {
    for (final tool in tools) {
      if (tool.name == name) {
        return _run(tool, arguments, steps);
      }
    }
    return ToolResult(modelResult: {'error': 'There is no tool named $name'});
  }

  Future<ToolResult> _run(
    AgentTool tool,
    Map<String, Object?> arguments,
    ResearchSteps steps,
  ) async {
    final stopwatch = Stopwatch()..start();
    try {
      return await tool.run(arguments, steps);
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
