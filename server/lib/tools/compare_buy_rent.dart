import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'amount_arguments.dart';
import 'household_in.dart';
import 'numbers_in.dart';
import 'tool_context.dart';

final class CompareBuyRent extends AgentTool {
  const CompareBuyRent(this.markets);

  final MarketDirectory markets;

  @override
  String get name => 'compare_buy_rent';

  @override
  String get description =>
      'Compares buying a sample home with renting one like it, for the '
      'household compute_affordability kept, so call it after that tool, '
      'in the same step when you can: year by year, the '
      'costs on the day, interest after any deduction, and the fee against '
      "the rent, and the equity built. The rent is the area's estimate unless "
      'the buyer stated one. It seeds /buyVsRent for BuyVsRent and answers '
      'with the year buying comes out cheaper.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'home': {
        'type': 'string',
        'description':
            'A sample home: its ID from search_homes, or the words the '
            'buyer named it by, such as its street or what it is.',
      },
      'rent': {
        ...amountParameter,
        'description':
            'Optional. The rent a month the buyer stated for a home like it.',
      },
      'years': {
        'type': 'integer',
        'description':
            'Optional. How many years the buyer expects to stay, 1 to '
            '$buyVsRentYears; without it $assumedStayYears is assumed.',
      },
    },
    'required': ['home'],
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final id = '${arguments['home']}';
    final sample = markets.home(id);
    if (sample == null) {
      return _error('No sample home $id; take the ID from search_homes.');
    }
    final household = householdIn(context.slices);
    final profile = household?.profile;
    if (household == null ||
        profile == null ||
        household.marketId != sample.city.marketId) {
      return _error(
        'Nothing to price it for yet; call compute_affordability for '
        '${sample.city.name} first.',
      );
    }
    if (isUnsaid(arguments['rent'], numbersIn(context.buyerWords.join('\n')))) {
      return _error(
        "rent not in the buyer's words; pass only a rent they stated, or "
        'leave it out.',
      );
    }
    final years = arguments['years'] as int?;
    if (years != null && (years < 1 || years > buyVsRentYears)) {
      return _error('years is 1 to $buyVsRentYears.');
    }
    final Money? stated;
    try {
      stated = switch (arguments['rent']) {
        final Object argument => moneyFromArgument(
          argument,
          markets.packFor(MarketId.parse(household.marketId))!.currency,
        ),
        null => null,
      };
    } on FormatException catch (error) {
      return _error(error.message);
    }
    final market = markets.resolveFor(
      MarketId.parse(household.marketId),
      profile,
      currencies: {?stated?.currency},
    )!;
    final rent = switch (market.converted(stated)) {
      final amount? when amount.currency != market.currency => null,
      final amount? => RentFigure.stated(amount),
      null => RentFigure.like(sample.listing),
    };
    if (rent == null) {
      return ToolResult(
        modelResult: {
          'noExchangeRateFor': [stated!.currency.code],
        },
      );
    }
    final home = homeAffordability(
      sample.listing,
      market: market,
      household: household,
    );
    if (home == null) {
      return _error(
        'The household is missing figures; call compute_affordability first.',
      );
    }
    final slice = compareBuyAndRent(
      home: home,
      market: market,
      rent: rent,
      years: years,
    );
    final at = slice.at(slice.years);
    return ToolResult(
      modelResult: {
        'home': sample.listing.id,
        'years': slice.years,
        if (slice.yearsAssumed) 'assumed': {'years': slice.years},
        'cheaperOverTheYears': at.buying <= at.renting ? 'buying' : 'renting',
        'breakEvenYear': slice.breakEvenYear,
        'rent': rent.stated
            ? 'as the buyer stated'
            : {'estimate': true, 'source': rent.source},
        'leavesOut': [
          "the home's price changing",
          'what the savings would earn',
          'selling costs',
          "a house's upkeep",
        ],
        'draw': [
          block('buy-vs-rent', 'BuyVsRent', {
            'comparison': boundTo('/buyVsRent'),
          }),
        ],
        'note':
            'The comparison is in /buyVsRent; never write the amounts in '
            'your text. $drawNote The buyer can move the years on the '
            'block.',
      },
      seeds: {buyVsRentSlice.name: jsonDecode(jsonEncode(slice.toJson()))},
      logFields: {
        'yearsAssumed': slice.yearsAssumed,
        'rentStated': rent.stated,
      },
    );
  }

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
