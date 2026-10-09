import 'package:logging/logging.dart';

import '../../gemini/function_declaration.dart';
import '../../logging/log_entry.dart';
import '../../tools/agent_tool.dart';
import '../../tools/tool_context.dart';

final _log = Logger('tools');

final class ToolBelt {
  const ToolBelt(this.tools);

  final List<AgentTool> tools;

  List<FunctionDeclaration> get declarations => [
    for (final tool in tools) tool.declaration,
  ];

  bool onlyReadCatalog(Iterable<String> names) =>
      names.isNotEmpty &&
      names.every(
        (name) => tools.any((tool) => tool.name == name && tool.readsCatalog),
      );

  ({String name, Map<String, Object?> arguments, bool needsReply})? answering(
    String action,
    Map<String, Object?> context,
  ) {
    for (final tool in tools) {
      if (tool.argumentsForTap(action, context) case final arguments?) {
        return (
          name: tool.name,
          arguments: arguments,
          needsReply: !tool.tapsNeedNoReply,
        );
      }
    }
    return null;
  }

  Future<ToolResult> call(
    String name,
    Map<String, Object?> arguments, {
    ToolContext context = const ToolContext(),
  }) async {
    for (final tool in tools) {
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
    ToolResult result;
    try {
      result = await tool.run(arguments, context);
    } on Object catch (error, stackTrace) {
      _log.severe('Tool ${tool.name} failed', error, stackTrace);
      result = const ToolResult(
        modelResult: {'error': 'The tool failed; nothing was changed'},
      );
    }
    _log.log(
      result.modelResult['error'] == null && result.logFields.isEmpty
          ? Level.FINE
          : Level.INFO,
      LogEntry(
        'Tool ${tool.name}',
        fields: {
          'tool': tool.name,
          'durationMs': stopwatch.elapsedMilliseconds,
          'error': ?result.modelResult['error'],
          ...result.logFields,
        },
      ),
    );
    return result;
  }
}
