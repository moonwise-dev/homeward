import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'amount_arguments.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class SplitRent extends AgentTool {
  const SplitRent(this.markets);

  final MarketDirectory markets;

  static const minPeople = 2;
  static const maxPeople = 8;

  @override
  String get name => 'split_rent';

  @override
  String get description =>
      "Splits a home's rent and bills between the people sharing it: "
      'equally, by the incomes the buyer stated, and by room size with the '
      'shared space split equally, each worked out when its figures are '
      "given. Give a sample home's ID, whose area gives an estimated rent, or "
      'the rent the buyer stated; pass only figures in their words. It seeds '
      '/rentSplit for RentSplit and answers with the rules it worked out and '
      'what would add the others.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'home': {
        'type': 'string',
        'description':
            'Optional. A sample home ID from search_homes; its area gives the '
            'rent unless the buyer stated one.',
      },
      'market': {
        'type': 'string',
        'enum': [...markets.covered.keys],
        'description': 'The market the home is in, when no home is given.',
      },
      'rent': {
        ...amountParameter,
        'description': 'Optional. The rent a month the buyer stated.',
      },
      'bills': {
        ...amountParameter,
        'description': 'Optional. The bills a month the buyer stated.',
      },
      'people': {
        'type': 'array',
        'description': '$minPeople to $maxPeople people sharing the home.',
        'items': {
          'type': 'object',
          'properties': {
            'label': {
              'type': 'string',
              'description':
                  'Who this is in the buyer\'s words, such as "You" or '
                  '"Your friend".',
            },
            'income': {
              ...amountParameter,
              'description': 'Optional. Their monthly income as stated.',
            },
            'roomM2': {
              'type': 'integer',
              'description': 'Optional. Their room in square metres as stated.',
            },
          },
          'required': ['label'],
        },
      },
      'rule': {
        'type': 'string',
        'enum': [for (final rule in SplitRule.values) rule.name],
        'description': 'Optional. The rule the buyer took from RentSplit.',
      },
    },
    'required': ['people'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final sample = switch (arguments['home']) {
      final String id => markets.home(id),
      _ => null,
    };
    if (arguments['home'] case final String id when sample == null) {
      return _error('No sample home $id; take the ID from search_homes.');
    }
    final marketId = sample?.city.marketId ?? arguments['market'] as String?;
    if (marketId == null || !markets.covered.containsKey(marketId)) {
      return _error(
        'Pass a sample home or the market: ${markets.covered.keys.join(', ')}.',
      );
    }
    if (sample == null && arguments['rent'] == null) {
      return _error(
        'Pass the rent the buyer stated, or a sample home whose area gives '
        'one.',
      );
    }
    final people = [
      for (final person in arguments['people'] as List<Object?>? ?? const [])
        if (person case {'label': final String label})
          (label: label.trim(), json: person as Map<String, Object?>),
    ];
    if (people.length < minPeople || people.length > maxPeople) {
      return _error('Pass $minPeople to $maxPeople people.');
    }
    final said = numbersIn(context.buyerWords.join('\n'));
    final unsaid = [
      for (final name in ['rent', 'bills'])
        if (isUnsaid(arguments[name], said)) name,
      for (final person in people) ...[
        if (isUnsaid(person.json['income'], said)) "${person.label}'s income",
        if (person.json['roomM2'] case final int room
            when !said.contains('$room'))
          "${person.label}'s room",
      ],
    ];
    if (unsaid.isNotEmpty) {
      return _error(
        "${unsaid.join(', ')} not in the buyer's words; pass only figures "
        'they stated, or ask them.',
      );
    }
    final id = MarketId.parse(marketId);
    final currency = markets.packFor(id)!.currency;
    final Money? rentStated;
    final Money? bills;
    final List<Money?> incomes;
    try {
      rentStated = _money(arguments['rent'], currency);
      bills = _money(arguments['bills'], currency);
      incomes = [
        for (final person in people) _money(person.json['income'], currency),
      ];
    } on FormatException catch (error) {
      return _error(error.message);
    }
    final market = markets.resolveFor(
      id,
      const BuyerProfile(),
      currencies: {
        for (final money in [rentStated, bills, ...incomes].nonNulls)
          money.currency,
      },
    )!;
    Money? inMarket(Money? money) => market.converted(money);
    final unconverted = {
      for (final money in [rentStated, bills, ...incomes].nonNulls)
        if (inMarket(money)!.currency != market.currency) money.currency.code,
    };
    if (unconverted.isNotEmpty) {
      return ToolResult(
        modelResult: {
          'noExchangeRateFor': [...unconverted],
        },
      );
    }
    final rent = switch (inMarket(rentStated)) {
      final stated? => RentFigure.stated(stated),
      null => RentFigure.like(sample!.listing),
    };
    final sharing = [
      for (final (index, person) in people.indexed)
        SharingPerson(
          label: person.label,
          income: inMarket(incomes[index]),
          roomM2: person.json['roomM2'] as int?,
        ),
    ];
    final homeM2 = sample?.listing.sizeM2;
    final splits = splitRent(
      rent: rent.monthly,
      bills: inMarket(bills),
      people: sharing,
      homeM2: homeM2,
    );
    final rules = [for (final split in splits) split.rule];
    final chosen = switch (arguments['rule']) {
      final String name =>
        SplitRule.values.where((rule) => rule.name == name).firstOrNull,
      _ => null,
    };
    if (arguments['rule'] != null && !rules.contains(chosen)) {
      return _error(
        '${arguments['rule']} cannot be worked out without its figures; '
        'the rules worked out: ${rules.map((rule) => rule.name).join(', ')}.',
      );
    }
    final slice = RentSplitSlice(
      rent: rent,
      bills: inMarket(bills),
      homeId: sample?.listing.id,
      homeName: sample?.listing.addressLine,
      homeM2: homeM2,
      people: sharing,
      splits: splits,
      chosen: chosen,
    );
    return ToolResult(
      modelResult: {
        'rules': [for (final rule in rules) rule.name],
        if (!rules.contains(SplitRule.income))
          'incomeNeeds': "each person's monthly income",
        if (!rules.contains(SplitRule.room))
          'roomNeeds': "each person's room size in square metres",
        'rent': rent.stated
            ? 'as the buyer stated'
            : {'estimate': true, 'source': rent.source},
        'chosen': ?chosen?.name,
        'draw': [
          block('rent-split', 'RentSplit', {
            'split': boundTo('/rentSplit'),
            'choose': sends('take_split'),
          }),
        ],
        'note':
            'The split is in /rentSplit; never write the amounts in your '
            'text. $drawNote When the buyer takes a rule, call split_rent '
            'again with it as rule.',
      },
      seeds: {rentSplitSlice.name: jsonDecode(jsonEncode(slice.toJson()))},
      logFields: {'people': people.length, 'rules': rules.length},
    );
  }

  static Money? _money(Object? argument, Currency? currency) =>
      argument == null ? null : moneyFromArgument(argument, currency);

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
