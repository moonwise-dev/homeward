import 'package:common/common.dart';

import '../research/research_steps.dart';
import 'agent_tool.dart';

final class ComponentDocs extends AgentTool {
  const ComponentDocs();

  @override
  String get name => 'component_docs';

  @override
  String get description =>
      'Returns the full JSON Schema and examples of catalog components listed '
      'in the index of the catalog skill. Call it once with every such '
      'component you are about to draw whose schema you have not read in this '
      'plan, before you write their messages.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'components': {
        'type': 'array',
        'items': {
          'type': 'string',
          'enum': [...catalogComponentNames],
        },
        'minItems': 1,
      },
    },
    'required': ['components'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ResearchSteps steps) {
    final docs = {
      for (final name in arguments['components'] as List<Object?>? ?? const [])
        '$name': componentDocs('$name'),
    };
    final unknown = [
      for (final MapEntry(:key, :value) in docs.entries)
        if (value == null) key,
    ];
    if (docs.isEmpty || unknown.isNotEmpty) {
      final problem = unknown.isEmpty
          ? 'Name at least one component'
          : 'No component named ${unknown.join(', ')}';
      return ToolResult(
        modelResult: {
          'error':
              '$problem; the catalog has ${catalogComponentNames.join(', ')}',
        },
      );
    }
    return ToolResult(modelResult: {'components': docs});
  }
}
