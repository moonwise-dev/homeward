import 'agent_tool.dart';
import 'tool_context.dart';

final class ArrangePlan extends AgentTool {
  const ArrangePlan();

  @override
  String get name => 'arrange_plan';

  @override
  String get description =>
      'Changes which cards the plan shows. show puts cards on the plan, '
      'the first you name on top: a card that waits under ready in the '
      'turn context, or under drawWhenAsked in a tool answer, such as '
      'another home or the stress test, or one already there that should '
      'come first now. remove takes cards off. Cards under draw go on the '
      'plan by themselves, so never call this for them. Call it in the '
      'same step as the tool whose card you want, or on its own when the '
      'buyer asks to see or drop something. It measures nothing.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'show': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'IDs of cards to put on the plan, top first.',
      },
      'remove': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'IDs of cards to take off the plan.',
      },
    },
  };

  @override
  bool get tapsNeedNoReply => true;

  @override
  Map<String, Object?>? argumentsForTap(
    String action,
    Map<String, Object?> context,
  ) => switch ((action, context)) {
    ('show_card', {'card': final String card}) => {
      'show': [card],
    },
    _ => null,
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final show = _ids(arguments['show']);
    final remove = _ids(arguments['remove']);
    final unknown = [
      for (final id in show)
        if (!context.cards.contains(id)) id,
    ];
    if (show.isEmpty && remove.isEmpty) {
      return const ToolResult(
        modelResult: {'error': 'Pass show, remove, or both.'},
      );
    }
    if (unknown.isNotEmpty) {
      return ToolResult(
        modelResult: {
          'error':
              'No card is named ${unknown.join(', ')}. Cards that wait: '
              '${_listed(context.cards.difference({...context.onPlan}))}. '
              'On the plan: ${_listed(context.onPlan)}.',
        },
      );
    }
    final wasThere = [
      for (final id in show)
        if (context.onPlan.contains(id)) id,
    ];
    return ToolResult(
      modelResult: {
        'shown': show,
        'removed': remove,
        if (wasThere.isNotEmpty) 'alreadyOnThePlan': wasThere,
        'means': {
          for (final id in show) id: ?context.cardNotes[id],
        },
        'note':
            'The plan changes as you reply; send no message for it. Say '
            'in your text what the cards under means tell this household, '
            'never only that they are on the plan.',
      },
      showCards: show,
      removeCards: remove,
      logFields: {'show': show.length, 'remove': remove.length},
    );
  }

  static List<String> _ids(Object? value) => switch (value) {
    final List<Object?> ids => ids.whereType<String>().toList(),
    final String id => [id],
    _ => const [],
  };

  static String _listed(Iterable<String> ids) =>
      ids.isEmpty ? 'none' : ids.join(', ');
}
