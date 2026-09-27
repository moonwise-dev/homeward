import 'package:common/common.dart';

import 'agent_tool.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class UpdateBrief extends AgentTool {
  const UpdateBrief();

  static const _written = [
    FactSource.said,
    FactSource.deduced,
    FactSource.confirmed,
  ];

  @override
  String get name => 'update_brief';

  @override
  String get description =>
      'Records what you learned or deduced about this household in the '
      'brief, your notes on it, which surfaces bind as /brief. Call it '
      'whenever the buyer tells you something or you deduce something from '
      'their words. It does not draw: add a Fact to the plan for each new '
      'item in the same turn. It stores nothing if any item fails a check, '
      'and returns the whole brief.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'items': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'id': {
              'type': 'string',
              'description':
                  'Lowercase words joined by hyphens, such as step-free. An '
                  'existing ID replaces that item.',
            },
            'kind': {
              'type': 'string',
              'enum': [for (final kind in BriefKind.values) kind.name],
            },
            'text': {
              'type': 'string',
              'description':
                  'One thing you learned, one short sentence to the buyer, '
                  'in the second person, such as "You have 600,000 kronor '
                  'saved". '
                  'Keep what the buyer said and what you conclude from it as '
                  'separate items. Write a figure in digits as the buyer '
                  'wrote it, such as 55,000 kronor; it must appear in words.',
            },
            'source': {
              'type': 'string',
              'enum': [for (final source in _written) source.name],
              'description':
                  'said: the sentence only restates what the buyer told '
                  'you. deduced: anything you concluded from their words, '
                  'even when it seems obvious, such as a need behind what '
                  'they describe. confirmed: a '
                  'deduction the buyer tapped Right on.',
            },
            'words': {
              'type': 'string',
              'description':
                  "The buyer's words it came from, copied exactly from one "
                  'of their messages.',
            },
          },
          'required': ['id', 'kind', 'text', 'source', 'words'],
        },
      },
      'remove': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'IDs of items that no longer hold.',
      },
    },
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final items = [
      for (final item in arguments['items'] as List<Object?>? ?? const [])
        if (item is Map<String, Object?>) item,
    ];
    final problems = [
      for (final (index, item) in items.indexed)
        if (_problem(item, context.buyerWords) case final problem?)
          'items[$index]: $problem',
    ];
    if (problems.isNotEmpty) {
      return ToolResult(
        modelResult: {
          'error': 'Nothing was recorded; fix the problems and call again.',
          'problems': problems,
        },
      );
    }
    final brief = {
      ...switch (context.slices[briefSlice.name]) {
        final Map<String, Object?> brief => brief,
        _ => const <String, Object?>{},
      },
    };
    for (final id in arguments['remove'] as List<Object?>? ?? const []) {
      brief.remove(id);
    }
    for (final item in items) {
      brief[item['id']! as String] = _itemOf(item).toJson();
    }
    return ToolResult(
      modelResult: {'brief': brief},
      seeds: {briefSlice.name: brief},
    );
  }

  BriefItem _itemOf(Map<String, Object?> item) => BriefItem(
    id: item['id']! as String,
    kind: BriefKind.values.byName(item['kind']! as String),
    text: (item['text']! as String).trim(),
    source: FactSource.values.byName(item['source']! as String),
    words: (item['words']! as String).replaceAll(_edges, ''),
  );

  String? _problem(Map<String, Object?> item, List<String> buyerWords) {
    final id = item['id'];
    final words = item['words'];
    final text = item['text'];
    if (id is! String || !_idPattern.hasMatch(id)) {
      return 'id must be lowercase words joined by hyphens.';
    }
    if (!BriefKind.values.any((kind) => kind.name == item['kind'])) {
      return 'kind must be one of ${BriefKind.values.map((k) => k.name)}.';
    }
    if (!_written.any((source) => source.name == item['source'])) {
      return 'source must be said, deduced, or confirmed.';
    }
    if (text is! String || text.trim().isEmpty) {
      return 'text must be a sentence.';
    }
    if (words is! String || !_appearsIn(words, buyerWords)) {
      return 'words must be copied exactly from something the buyer wrote.';
    }
    final unsaid =
        numbersIn(
              text,
            )
            .where((number) => !_isSmallCount(number))
            .toSet()
            .difference(numbersIn(words));
    if (unsaid.isNotEmpty) {
      return 'text has ${unsaid.join(', ')}, which is not in words; write '
          'figures only as the buyer wrote them.';
    }
    return null;
  }

  static final _idPattern = RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$');

  static bool _isSmallCount(String number) =>
      (int.tryParse(number) ?? smallCountLimit + 1) <= smallCountLimit;

  static const smallCountLimit = 12;

  static bool _appearsIn(String words, List<String> buyerWords) {
    final quote = _normalized(words).replaceAll(_edges, '');
    return quote.isNotEmpty &&
        buyerWords.any((said) => _normalized(said).contains(quote));
  }

  static final _edges = RegExp(r'''^[\s"'“”‘’.,;:!?]+|[\s"'“”‘’.,;:!?]+$''');

  static String _normalized(String text) => text
      .toLowerCase()
      .replaceAll(RegExp('[‘’]'), "'")
      .replaceAll(RegExp('[“”]'), '"')
      .replaceAll(RegExp(r'\s+'), ' ');
}
