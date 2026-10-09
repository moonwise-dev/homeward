import 'package:common/common.dart';

import 'agent_tool.dart';
import 'numbers_in.dart';
import 'their_words.dart';
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
      'whenever the buyer tells you something, with what they said and, in '
      'the same call, what follows from it that they did not say, as '
      'deduced, such as what the home must have. It does not draw, and '
      'the buyer sees the brief only when they ask what you know. It keeps '
      'every item it can, names under leftOut the ones it could not, and '
      'returns the whole brief.';

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
                  'existing ID replaces that item: reuse it when a fact '
                  'changes or the buyer corrects it.',
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
                  'wrote it, such as 55,000 kronor; a figure they did not '
                  'write leaves the item out.',
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
                  'of their messages. Leave it out when you cannot copy '
                  'them exactly.',
            },
          },
          'required': ['id', 'kind', 'text', 'source'],
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
    final given = [
      for (final item in arguments['items'] as List<Object?>? ?? const [])
        if (item is Map<String, Object?>) item,
    ];
    final problems = {
      for (final (index, item) in given.indexed)
        index: ?_problem(item, context.buyerWords),
    };
    final items = [
      for (final (index, item) in given.indexed)
        if (!problems.containsKey(index)) item,
    ];
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
      brief[item['id']! as String] = _itemOf(
        item,
        context.buyerWords,
      ).toJson();
    }
    final money = items.any((item) => item['kind'] == BriefKind.money.name);
    final notes = [
      if (problems.isNotEmpty)
        'The items under leftOut were not recorded. Do not call again for '
            'them; carry on with your reply.',
      if (money)
        'A money figure was recorded. If they are buying, or have not '
            'said whether they rent, call compute_affordability with '
            'it now, before you reply, unless you already did in this '
            'turn: it checks that the figure makes sense and assumes '
            'what they have not said. If they rent, do not: split_rent '
            'takes what each of them earns.',
    ];
    return ToolResult(
      modelResult: {
        'brief': brief,
        if (problems.isNotEmpty)
          'leftOut': [
            for (final MapEntry(key: index, value: problem) in problems.entries)
              'items[$index]: $problem',
          ],
        if (notes.isNotEmpty) 'note': notes.join(' '),
      },
      seeds: {briefSlice.name: brief},
    );
  }

  BriefItem _itemOf(Map<String, Object?> item, List<String> buyerWords) {
    final source = FactSource.values.byName(item['source']! as String);
    final words = switch (item['words']) {
      final String words when inTheirWords(words, buyerWords) =>
        words.replaceAll(
          quoteEdges,
          '',
        ),
      _ => null,
    };
    return BriefItem(
      id: item['id']! as String,
      kind: BriefKind.values.byName(item['kind']! as String),
      text: (item['text']! as String).trim(),
      source: words == null && source == FactSource.said
          ? FactSource.deduced
          : source,
      words: words,
    );
  }

  String? _problem(Map<String, Object?> item, List<String> buyerWords) {
    final id = item['id'];
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
    final unsaid = numbersIn(text)
        .where((number) => !_isSmallCount(number))
        .toSet()
        .difference(numbersIn(buyerWords.join(' ')));
    if (unsaid.isNotEmpty) {
      return 'text has ${unsaid.join(', ')}, which the buyer did not write; '
          'a figure in the brief is always their own.';
    }
    return null;
  }

  static final _idPattern = RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$');

  static bool _isSmallCount(String number) =>
      (int.tryParse(number) ?? smallCountLimit + 1) <= smallCountLimit;

  static const smallCountLimit = 12;
}
