import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'amount_arguments.dart';
import 'household_in.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class PlanSavings extends AgentTool {
  PlanSavings(this.markets, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final MarketDirectory markets;
  final DateTime Function() _now;

  @override
  String get name => 'plan_savings';

  @override
  bool get needsTheHousehold => true;

  @override
  String get description =>
      "Works out how long until the household's savings cover the cash the "
      'home in /affordability needs on the day: the down payment the buyer '
      'chose, or the minimum the rules allow, with the costs on the day. '
      'Takes what the household can put aside, as the buyer stated it in '
      'their words or a MoneyInput. It seeds /savingsPlan for SavingsPlan '
      'and answers with the months to go. It leaves out what the savings '
      'earn and prices and incomes changing.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'monthlySaving': {
        ...perPeriodParameter,
        'description':
            'What the household can put aside, as the buyer stated it; a '
            'month unless they said a year.',
      },
    },
    'required': ['monthlySaving'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final household = householdIn(context.slices);
    final profile = household?.profile;
    if (household == null || profile == null) {
      return _error(
        'Nothing to plan for yet; call compute_affordability first.',
      );
    }
    final argument = arguments['monthlySaving'];
    if (isUnsaid(argument, numbersIn(context.buyerWords.join('\n')))) {
      return _error(
        "monthlySaving not in the buyer's words; pass only what they "
        'stated, or ask them.',
      );
    }
    final Money stated;
    try {
      stated = monthlyOf(
        moneyFromArgument(
          argument,
          markets.packFor(MarketId.parse(household.marketId))!.currency,
        ),
        argument,
      );
    } on FormatException catch (error) {
      return _error(error.message);
    }
    final market = markets.resolveFor(
      MarketId.parse(household.marketId),
      profile,
      currencies: {stated.currency},
    )!;
    final monthly = market.converted(stated)!;
    if (monthly.currency != market.currency) {
      return ToolResult(
        modelResult: {
          'noExchangeRateFor': [stated.currency.code],
        },
      );
    }
    final plan = planSavings(
      home: household,
      monthlySaving: monthly,
      today: CalendarDate.ofUtc(_now().toUtc()),
    );
    if (plan == null) {
      return _error(
        household.savings == null
            ? 'The savings are not known; ask the buyer, then call '
                  'compute_affordability with them.'
            : 'Pass a monthly saving above zero.',
      );
    }
    return ToolResult(
      modelResult: {
        'covered': plan.covered,
        'months': plan.months,
        'target': plan.downPaymentChosen
            ? 'the down payment the buyer chose'
            : 'the minimum down payment the rules allow',
        if (!plan.costsIncluded)
          'costsOnTheDay':
              'not included; the rules need more about the household to '
              'work them out',
        'leavesOut': [
          'what the savings earn',
          'prices changing',
          'incomes changing',
        ],
        'draw': [
          block('savings-plan', 'SavingsPlan', {
            'plan': boundTo('/savingsPlan'),
          }),
        ],
        'note':
            'The plan is in /savingsPlan; never write the amounts in your '
            'text. $drawNote',
      },
      seeds: {savingsPlanSlice.name: jsonDecode(jsonEncode(plan.toJson()))},
      logFields: {
        'covered': plan.covered,
        'costsIncluded': plan.costsIncluded,
      },
    );
  }

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
