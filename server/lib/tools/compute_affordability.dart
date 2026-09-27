import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'amount_arguments.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class ComputeAffordability extends AgentTool {
  const ComputeAffordability(this.markets);

  final MarketDirectory markets;

  static const _lists = [
    'grossIncomes',
    'netIncomes',
    'debtPayments',
    'savings',
  ];

  static const _homeAmounts = ['price', 'downPayment', 'homeFee'];

  static const _argumentFor = {
    'netMonthlyIncome': 'netIncomes',
    'grossMonthlyIncome': 'grossIncomes',
    'monthlyDebtPayments': 'debtPayments',
  };

  @override
  String get name => 'compute_affordability';

  @override
  String get description =>
      'Works out what this household can borrow and the highest price its '
      'savings and the lending rules allow, from sample rules for a covered '
      'market: ${[for (final MapEntry(:key, :value) in markets.covered.entries) '$value ($key)'].join(', ')}. '
      'Pass only figures the buyer stated, as they stated them; a figure not '
      'in their words is refused. It answers with the facts it still needs '
      'and why, or seeds /affordability for AffordabilitySummary, RuleNote, '
      'MonthlyCostBreakdown, StressTestChart, and PurchaseCostsTable, and '
      'lists what it assumed that is the '
      "buyer's to decide. For a home anywhere else, tell the buyer the "
      'sample does not cover it.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'market': {
        'type': 'string',
        'enum': [...markets.covered.keys],
      },
      for (final name in _lists)
        name: {
          'type': 'array',
          'items': _perPeriod,
          'description': name == 'savings'
              ? 'Each amount saved, in the currency it is held in.'
              : 'Each amount as the buyer stated it, per person or '
                    'combined, in its own currency; never split or add '
                    'them.',
        },
      'price': {
        ...amountParameter,
        'description': 'Optional. The price of a home the buyer named.',
      },
      'downPayment': {
        ...amountParameter,
        'description':
            'Optional. The down payment the buyer wants to make; without it '
            'the minimum the rules allow is assumed.',
      },
      'homeFee': {
        ..._perPeriod,
        'description':
            "Optional. The home's own recurring fee the buyer stated, such "
            'as a Swedish association fee or a Portuguese condominium fee.',
      },
      'age': {
        'type': 'integer',
        'description': 'Age of the oldest borrower.',
      },
      'adults': {'type': 'integer'},
      'childAges': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
      'borrowers': {'type': 'integer'},
      'taxResidence': {
        'type': 'string',
        'description': 'ISO 3166 country code of tax residence.',
      },
      'use': {
        'type': 'string',
        'enum': [for (final use in PropertyUse.values) use.name],
      },
      'employment': {
        'type': 'string',
        'enum': [for (final employment in Employment.values) employment.name],
      },
      'residencyIntent': {
        'type': 'string',
        'enum': [for (final intent in ResidencyIntent.values) intent.name],
      },
      'formerResident': {'type': 'boolean'},
      'termYears': {
        'type': 'integer',
        'description':
            'Optional. The term the buyer chose; without it the longest the '
            'rules allow is assumed.',
      },
    },
    'required': ['market'],
  };

  static const _perPeriod = {
    'type': 'object',
    'properties': {
      'amount': {
        'type': 'number',
        'description': 'The amount in major units as the buyer said it.',
      },
      'currency': {
        'type': 'string',
        'description': 'ISO 4217 code; omit for the market currency.',
      },
      'per': {
        'type': 'string',
        'enum': ['month', 'year'],
      },
    },
    'required': ['amount'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final id = MarketId.parse('${arguments['market']}');
    final currency = markets.packFor(id)?.currency;
    if (currency == null) {
      return ToolResult(
        modelResult: {
          'error':
              'Not a covered market; covered: ${markets.covered.keys.join(', ')}',
        },
      );
    }
    final said = numbersIn(context.buyerWords.join('\n'));
    final unsaid = {
      for (final name in [..._lists, ..._homeAmounts])
        for (final argument in _argumentsOf(arguments[name]))
          if (argument case {'amount': final num amount}
              when amount != 0 && !said.contains(_plain(amount)))
            name,
    };
    if (unsaid.isNotEmpty) {
      return ToolResult(
        modelResult: {
          'error':
              '${unsaid.join(', ')} not in the buyer\'s words; pass only '
              'figures they stated, or ask them.',
        },
      );
    }
    final amounts = {
      for (final name in _lists)
        if (arguments[name] != null)
          name: [
            for (final argument in _argumentsOf(arguments[name]))
              _monthlyOf(moneyFromArgument(argument, currency), argument),
          ],
    };
    final home = {
      for (final name in _homeAmounts)
        if (arguments[name] case final argument?)
          name: _monthlyOf(moneyFromArgument(argument, currency), argument),
    };
    final base = BuyerProfile(
      age: arguments['age'] as int?,
      adults: arguments['adults'] as int?,
      childAges: switch (arguments['childAges']) {
        final List<Object?> ages => [
          for (final age in ages)
            if (age is int) age,
        ],
        _ => null,
      },
      borrowers: arguments['borrowers'] as int?,
      taxResidence: switch (arguments['taxResidence']) {
        final String code => CountryCode.parse(code.toUpperCase()),
        _ => null,
      },
      use: _enum(PropertyUse.values, arguments['use']),
      employment: _enum(Employment.values, arguments['employment']),
      residencyIntent: _enum(
        ResidencyIntent.values,
        arguments['residencyIntent'],
      ),
      formerResident: arguments['formerResident'] as bool?,
    );
    final currencies = {
      for (final list in amounts.values)
        for (final money in list) money.currency,
      for (final money in home.values) money.currency,
    };
    final rates = markets.resolveFor(id, base, currencies: currencies)!;
    final totals = {
      for (final MapEntry(key: name, value: list) in amounts.entries)
        name: totalInMarket(rates, list),
    };
    final inMarket = {
      for (final MapEntry(key: name, value: money) in home.entries)
        name: rates.converted(money)!,
    };
    final unconverted = {
      for (final MapEntry(key: name, value: list) in amounts.entries)
        if (totals[name] == null)
          for (final money in list)
            if (money.currency != currency) money.currency.code,
      for (final money in inMarket.values)
        if (money.currency != currency) money.currency.code,
    };
    if (unconverted.isNotEmpty) {
      return ToolResult(
        modelResult: {
          'noExchangeRateFor': [...unconverted],
        },
        logFields: {
          'noExchangeRateFor': [...unconverted],
        },
      );
    }
    final profile = base.copyWith(
      grossMonthlyIncome: totals['grossIncomes'],
      netMonthlyIncome: totals['netIncomes'],
      monthlyDebtPayments: totals['debtPayments'],
      savings: totals['savings'],
    );
    final market = markets.resolveFor(id, profile, currencies: currencies)!;
    return switch (answerAffordability(
      market: market,
      profile: profile,
      price: inMarket['price'],
      downPayment: inMarket['downPayment'],
      monthlyFee: inMarket['homeFee'],
      termYears: arguments['termYears'] as int?,
    )) {
      AffordabilityNeeds(:final missing, :final unconverted) => ToolResult(
        logFields: {
          'needs': [for (final field in missing) field.name],
        },
        modelResult: {
          'needs': [
            for (final field in missing)
              {
                'arguments': {
                  for (final key in field.profileKeys) _argumentFor[key] ?? key,
                }.toList(),
                'why': ?market.profileFields
                    .where((requirement) => requirement.field == field)
                    .firstOrNull
                    ?.reason,
              },
          ],
          if (unconverted.isNotEmpty)
            'noExchangeRateFor': [for (final c in unconverted) c.code],
        },
      ),
      AffordabilityAnswered(:final assessed, :final slice) => ToolResult(
        logFields: {'answered': true},
        modelResult: {
          'answered': true,
          'limitingRule': assessed.binding?.kind.name,
          'withinSavings': switch ((slice.cashNeeded, slice.savings)) {
            (final cash?, final saved?) => cash <= saved,
            _ => null,
          },
          'withinRules': slice.loan <= slice.maxLoan,
          'passesStressTest': switch (slice.stress) {
            StressCurve(:final limit?, :final stressRate, :final points) =>
              points
                  .where((point) => point.annualRate == stressRate)
                  .every((point) => point.cost <= limit),
            _ => null,
          },
          'purchaseCosts': slice.purchaseCosts.length,
          'assumed': {
            if (inMarket['price'] == null)
              'price': 'the highest price the savings reach',
            if (inMarket['downPayment'] == null)
              'downPayment': 'the minimum the rules allow',
            if (termMovesPayment(market) && arguments['termYears'] == null)
              'termYears': slice.termYears,
            if (inMarket['homeFee'] == null) 'homeFee': 'none',
          },
          'note':
              'The figures are in /affordability. Show them with '
              'AffordabilitySummary, the limiting rule with RuleNote, what a '
              'month costs with MonthlyCostBreakdown, rising rates with '
              'StressTestChart, and the costs on the day with '
              'PurchaseCostsTable; never write them in your text. What was '
              "assumed is the buyer's to decide; nothing else can be "
              'computed yet, so offer no other choice, such as another kind '
              'of rate.',
        },
        seeds: {'affordability': jsonDecode(jsonEncode(slice.toJson()))},
      ),
    };
  }

  static List<Object?> _argumentsOf(Object? value) => switch (value) {
    final List<Object?> list => list,
    null => const [],
    final single => [single],
  };

  static String _plain(num amount) =>
      amount == amount.roundToDouble() ? '${amount.round()}' : '$amount';

  static Money _monthlyOf(Money money, Object? argument) =>
      argument is Map<String, Object?> && argument['per'] == 'year'
      ? money.copyWith(
          minorUnits: Rounding.halfUp.divide(money.minorUnits, monthsPerYear),
        )
      : money;

  static T? _enum<T extends Enum>(List<T> values, Object? name) =>
      values.where((value) => value.name == name).firstOrNull;
}
