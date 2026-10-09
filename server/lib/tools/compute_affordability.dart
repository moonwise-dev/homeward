import 'dart:convert';
import 'dart:math';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'household_in.dart';
import 'amount_arguments.dart';
import 'kept_homes.dart';
import 'numbers_in.dart';
import 'their_words.dart';
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

  static const _assumedArgument = {
    ProfileAssumption.adults: 'adults',
    ProfileAssumption.children: 'childAges',
    ProfileAssumption.age: 'age',
    ProfileAssumption.debts: 'debtPayments',
    ProfileAssumption.takeHomePay: 'netIncomes',
    ProfileAssumption.residency: 'taxResidence',
    ProfileAssumption.use: 'use',
    ProfileAssumption.employment: 'employment',
  };

  @override
  String get name => 'compute_affordability';

  @override
  String get description =>
      'Works out what this household can borrow and the highest price its '
      'savings and the lending rules allow, from sample rules for a covered '
      'market: ${[for (final MapEntry(:key, :value) in markets.covered.entries) '$value ($key)'].join(', ')}. '
      'It needs only what they earn and what they have saved, or a price. '
      'Everything else you do not pass it assumes or estimates, and names '
      'under assumedAboutThem: who lives in the home, no children, no '
      'other loans, and their take-home pay from their pay before tax. So '
      'never ask for those before calling it. Only when their words say '
      'they have none, pass debtPayments [] for no debts or childAges [] '
      'for no children; when they have not said, leave both out, never '
      '[] as a guess. Until it has answered, pass '
      'everything the buyer has told you each time; once it has answered, '
      'it keeps that household and its figures, so pass again only what is '
      'new or changed, such as home. Call it as soon as the buyer gives '
      'any money figure, and before you ask for money facts, with what you '
      'have, even the market alone. Pass only figures the buyer stated, as '
      'they stated them; a figure not in their words is left out. It '
      'answers with doubts, figures that do not make sense and must be '
      'checked with the buyer before they are used; or with needs, the '
      'facts only the buyer has, to ask for together; or with the answer: '
      'what they can borrow goes on the plan, with what a month costs '
      'when there is a home or a price, who the figures rest on when '
      'something was assumed, and the lending rule when the loan is over '
      'it. Its other cards wait until the buyer asks, or go on at once '
      'when you pass them under show. It also lists what it assumed that '
      "is the buyer's to decide. For a home anywhere else, tell the buyer "
      'the sample does not cover it.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'market': {
        'type': 'string',
        'enum': [...markets.covered.keys],
        'description':
            'The country code of the market the home is in: '
            '${[for (final city in markets.cities.values) '${city.marketId} for ${city.name}'].join(', ')}.',
      },
      for (final name in _lists)
        name: {
          'type': 'array',
          'items': perPeriodParameter,
          'description': switch (name) {
            'savings' => 'Each amount saved, in the currency it is held in.',
            'debtPayments' =>
              'Each debt payment as the buyer stated it; [] when they said '
                  'they have none. Leave it out when they have not said: '
                  'none is assumed.',
            'netIncomes' =>
              'Take-home pay, each amount as the buyer stated it, per '
                  'person or combined, in its own currency; never split or '
                  'add them. Leave it out when they gave only pay before '
                  'tax: it is estimated from that.',
            _ =>
              'Pay before tax, each amount as the buyer stated it, per '
                  'person or combined, in its own currency; never split or '
                  'add them. An income they gave without saying which it '
                  'is goes here.',
          },
        },
      'home': {
        'type': 'string',
        'description':
            'Optional. A sample home the buyer picked: its ID from '
            'search_homes, or the words they named it by, such as its '
            'street or what it is, which needs no search first. Its price and fee come '
            'from the listing, so pass no price or homeFee with it.',
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
        ...perPeriodParameter,
        'description':
            "Optional. The home's own recurring fee the buyer stated, such "
            'as a Swedish association fee or a Portuguese condominium fee.',
      },
      'age': {
        'type': 'integer',
        'description':
            'Age of the oldest borrower; without it $assumedAdultAge is '
            'assumed.',
      },
      'adults': {
        'type': 'integer',
        'description':
            'How many adults will live in the home, borrowers or not; '
            'deduce it from their words, such as two for a couple. Without '
            'it, one adult for each income is assumed.',
      },
      'childAges': {
        'type': 'array',
        'items': {'type': 'integer'},
        'description':
            'The age of each child who will live in the home; [] when they '
            'said there are none. Leave it out when they have not said: '
            'none is assumed.',
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
      'loanType': {
        'type': 'string',
        'enum': [
          ...{for (final ids in _ratesByMarket.values) ...ids},
        ],
        'description':
            'Optional. The rate the buyer took from MortgageOptions; without '
            'it the variable rate is assumed. Rates by market: '
            '$_ratesText.',
      },
      'termYears': {
        'type': 'integer',
        'description':
            'Optional. The term the buyer chose; without it the longest the '
            'rules allow is assumed.',
      },
      'show': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'card': {
              'type': 'string',
              'enum': [..._askedFor.keys],
            },
            'theirWords': {
              'type': 'string',
              'description':
                  "The words of the buyer's message that ask for this "
                  'card, copied exactly.',
            },
          },
          'required': ['card', 'theirWords'],
        },
        'description':
            "Optional. Cards the buyer's message asks for in so many "
            'words, to put on the plan with the answer: '
            '${_waitingText()}. Leave it out when their message asks for '
            'none of these, as a message that only gives their pay and '
            'savings does; a card whose words are not theirs waits.',
      },
      'assumedRight': {
        'type': 'boolean',
        'description':
            'True when the buyer said, or tapped on the household card, '
            'that what this tool assumed about them is right; the assumed '
            'lines are then no longer marked. Never as a guess.',
      },
      'confirmed': {
        'type': 'array',
        'items': {
          'type': 'string',
          'enum': ['grossIncomes', 'netIncomes'],
        },
        'description':
            'Optional. Arguments this tool doubted that the buyer has since '
            'told you are right as they stand.',
      },
    },
  };

  Map<String, List<String>> get _ratesByMarket => {
    for (final id in markets.covered.keys)
      id: [
        for (final type in markets.packFor(MarketId.parse(id))!.loanTypes)
          type.id,
      ],
  };

  String get _ratesText => [
    for (final MapEntry(:key, :value) in _ratesByMarket.entries)
      '$key: ${value.join(', ')}',
  ].join('; ');

  @override
  Map<String, Object?>? argumentsForTap(
    String action,
    Map<String, Object?> context,
  ) => switch ((action, context)) {
    ('confirm_household', _) => const {'assumedRight': true},
    ('work_out_home', {'home': final String home}) => {'home': home},
    ('take_rate', {'loanType': final String rate}) => {'loanType': rate},
    ('use_down_payment', {'downPayment': final String amount}) =>
      switch (numbersIn(amount).map(num.tryParse).nonNulls.toList()) {
        [final amount] => {
          'downPayment': {'amount': amount},
        },
        _ => null,
      },
    _ => null,
  };

  @override
  ToolResult run(Map<String, Object?> arguments, ToolContext context) {
    final code = switch (arguments['market']) {
      final String named => markets.coveredCode(named),
      _ => _marketInUse(context.slices),
    };
    final id = code == null ? null : MarketId.parse(code);
    final currency = id == null ? null : markets.packFor(id)?.currency;
    if (id == null || currency == null) {
      return ToolResult(
        logFields: {'market': '${arguments['market']}'},
        modelResult: {
          'error':
              'Not a covered market; pass market as one of '
              '${markets.covered.keys.join(', ')}',
        },
      );
    }
    final loanTypes = [
      for (final type in markets.packFor(id)!.loanTypes) type.id,
    ];
    if (arguments['loanType'] case final String loanType
        when !loanTypes.contains(loanType)) {
      return ToolResult(
        modelResult: {
          'error':
              '$loanType is not a rate of this market; its rates: '
              '${loanTypes.join(', ')}',
        },
      );
    }
    final sample = switch (arguments['home']) {
      final String id => markets.home(id),
      _ => null,
    };
    if (arguments['home'] case final String homeId when sample == null) {
      return ToolResult(
        modelResult: {
          'error':
              'No one sample home is named $homeId; take its ID from '
              'search_homes.',
        },
      );
    }
    if (sample != null && sample.city.marketId != id.code) {
      return ToolResult(
        modelResult: {
          'error':
              '${sample.listing.id} is in ${sample.city.name}, market '
              '${sample.city.marketId}.',
        },
      );
    }
    final said = numbersIn(context.buyerWords.join('\n'));
    final unsaid = {
      for (final name in [
        ..._lists,
        ...sample == null ? _homeAmounts : const ['downPayment'],
      ])
        for (final argument in _argumentsOf(arguments[name]))
          if (isUnsaid(argument, said)) name,
    };
    final passed = {
      for (final MapEntry(:key, :value) in arguments.entries)
        if (!unsaid.contains(key)) key: value,
    };
    final amounts = {
      for (final name in _lists)
        if (passed[name] != null)
          name: [
            for (final argument in _argumentsOf(passed[name]))
              monthlyOf(moneyFromArgument(argument, currency), argument),
          ],
    };
    final home = {
      for (final name in _homeAmounts)
        if (passed[name] case final argument?)
          name: monthlyOf(moneyFromArgument(argument, currency), argument),
      if (sample?.listing case final listing?) ...{
        'price': listing.price,
        'homeFee': ?listing.monthlyFee,
      },
    };
    final earlier = switch (householdIn(context.slices)) {
      final earlier? when earlier.marketId == id.code => earlier,
      _ => null,
    };
    final kept = earlier?.profile;
    final assumedEarlier = earlier?.assumed ?? const <ProfileAssumption>{};
    final estimateAgain =
        passed['grossIncomes'] != null &&
        assumedEarlier.contains(ProfileAssumption.takeHomePay);
    final saidRight = passed['assumedRight'] == true;
    final carried = {
      for (final assumption in assumedEarlier)
        if (passed[_assumedArgument[assumption]] == null &&
            (assumption == ProfileAssumption.takeHomePay
                ? !estimateAgain
                : !saidRight))
          assumption,
    };
    final people = BuyerProfile(
      age: passed['age'] as int? ?? kept?.age,
      adults: passed['adults'] as int? ?? kept?.adults,
      childAges: switch (passed['childAges']) {
        final List<Object?> ages => [
          for (final age in ages)
            if (age is int) age,
        ],
        _ => kept?.childAges,
      },
      borrowers:
          passed['borrowers'] as int? ??
          passed['adults'] as int? ??
          kept?.borrowers,
      taxResidence: switch (passed['taxResidence']) {
        final String code => CountryCode.parse(code.toUpperCase()),
        _ => kept?.taxResidence,
      },
      use: _enum(PropertyUse.values, passed['use']) ?? kept?.use,
      employment:
          _enum(Employment.values, passed['employment']) ?? kept?.employment,
      residencyIntent:
          _enum(ResidencyIntent.values, passed['residencyIntent']) ??
          kept?.residencyIntent,
      formerResident: passed['formerResident'] as bool? ?? kept?.formerResident,
    );
    final currencies = {
      for (final list in amounts.values)
        for (final money in list) money.currency,
      for (final money in home.values) money.currency,
    };
    final rates = markets.resolveFor(id, people, currencies: currencies)!;
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
    final (profile: filled, assumed: unstated) = assumeUnstated(
      profile: people.copyWith(
        grossMonthlyIncome: totals['grossIncomes'] ?? kept?.grossMonthlyIncome,
        netMonthlyIncome:
            totals['netIncomes'] ??
            (estimateAgain ? null : kept?.netMonthlyIncome),
        monthlyDebtPayments:
            totals['debtPayments'] ?? kept?.monthlyDebtPayments,
        savings: totals['savings'] ?? kept?.savings,
      ),
      pack: markets.packFor(id)!,
      incomes: max(
        amounts['grossIncomes']?.length ?? 0,
        amounts['netIncomes']?.length ?? 0,
      ),
    );
    final takeHome = filled.netMonthlyIncome == null
        ? estimatedTakeHome(
            rates,
            amounts['grossIncomes'] ?? [?filled.grossMonthlyIncome],
          )
        : null;
    final profile = filled.copyWith(
      netMonthlyIncome: filled.netMonthlyIncome ?? takeHome,
    );
    final assumed = {
      ...carried,
      ...unstated,
      if (takeHome != null) ProfileAssumption.takeHomePay,
    };
    final market = markets.resolveFor(id, profile, currencies: currencies)!;
    final confirmed = {...?passed['confirmed'] as List<Object?>?};
    final doubts = [
      for (final doubted in figureDoubts(market: market, profile: profile))
        if (passed[_doubted(doubted.doubt)] != null &&
            !confirmed.contains(_doubted(doubted.doubt)))
          doubted,
    ];
    if (doubts.isNotEmpty) {
      return ToolResult(
        logFields: {
          'doubts': [for (final doubted in doubts) doubted.doubt.name],
        },
        modelResult: {
          'doubts': [
            for (final doubted in doubts)
              {
                'argument': _doubted(doubted.doubt),
                'why': _why(doubted, profile),
              },
          ],
          'note':
              'Nothing was worked out. A doubted figure is not used until '
              'the buyer has checked it. In this reply say in plain words '
              'what looks off, and ask with a Choice, with no recommended '
              'option, whose options are the figure they gave, as right, '
              'and the figure you think they meant. Ask nothing else this '
              'turn. When they stand by the figure, call again with '
              'confirmed naming the argument.',
        },
      );
    }
    final leftOut = [
      for (final name in unsaid)
        "$name: not in the buyer's words, so it was not used.",
    ];
    return switch (answerAffordability(
      market: market,
      profile: profile,
      price: inMarket['price'],
      downPayment: inMarket['downPayment'],
      monthlyFee: inMarket['homeFee'],
      termYears: passed['termYears'] as int?,
      loanTypeId: passed['loanType'] as String?,
    )) {
      AffordabilityNeeds(:final missing, :final unconverted) => ToolResult(
        logFields: {
          'needs': [for (final field in missing) field.name],
          if (unsaid.isNotEmpty) 'leftOut': [...unsaid],
        },
        modelResult: {
          'needs': [
            for (final field in missing)
              if (field != ProfileField.borrowers ||
                  !missing.contains(ProfileField.household))
                {
                  'arguments': {
                    for (final key in field.profileKeys)
                      _argumentFor[key] ?? key,
                  }.toList(),
                  'why': ?market.profileFields
                      .where((requirement) => requirement.field == field)
                      .firstOrNull
                      ?.reason,
                  'ask': _ask(field, market),
                },
          ],
          if (leftOut.isNotEmpty) 'leftOut': leftOut,
          if (unconverted.isNotEmpty)
            'noExchangeRateFor': [for (final c in unconverted) c.code],
          'note':
              'Nothing was worked out yet: needs holds the facts only the '
              'buyer has, and everything else is assumed until they say '
              'otherwise. When their words or the brief already hold one, '
              'pass it and call again in this turn. Otherwise ask for them '
              'together in this reply, in one Questions card: ask holds '
              'the fields for each fact, to use as they are with an id of '
              'your own.',
        },
      ),
      AffordabilityAnswered(:final assessed, slice: final answered) =>
        _answered(
          assessed,
          _withHome(
            answered.copyWith(
              assumed: assumed,
              takeHomeSource: assumed.contains(ProfileAssumption.takeHomePay)
                  ? market.incomeTax?.source
                  : null,
            ),
            sample?.listing,
          ),
          passed,
          inMarket,
          market,
          context,
          leftOut,
        ),
    };
  }

  ToolResult _answered(
    AssessedAffordability assessed,
    AffordabilitySlice slice,
    Map<String, Object?> arguments,
    Map<String, Money> inMarket,
    ResolvedMarket market,
    ToolContext context,
    List<String> leftOut,
  ) => ToolResult(
    logFields: {
      'answered': true,
      if (slice.assumed.isNotEmpty)
        'assumed': [for (final assumption in slice.assumed) assumption.name],
      if (leftOut.isNotEmpty) 'leftOut': leftOut.length,
      if (_asked(arguments, context).isNotEmpty)
        'show': [..._asked(arguments, context)],
    },
    modelResult: {
      'answered': true,
      if (leftOut.isNotEmpty) 'leftOut': leftOut,
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
          'downPayment': switch (slice.whatIf?.steps.first.downPayment) {
            final minimum? when slice.downPayment < minimum =>
              'the most the savings can put down, less than the rules '
                  'require',
            _ => 'the minimum the rules allow',
          },
        if (termMovesPayment(market) && arguments['termYears'] == null)
          'termYears': slice.termYears,
        if (inMarket['homeFee'] == null) 'homeFee': 'none',
        if (arguments['loanType'] == null) 'loanType': slice.loanTypeId,
        if (arguments['borrowers'] == null) 'borrowers': 'every adult',
      },
      if (slice.assumed.isNotEmpty)
        'assumedAboutThem': {
          for (final assumption in ProfileAssumption.values)
            if (slice.assumed.contains(assumption) &&
                (assumption != ProfileAssumption.age || _ageSetsLoan(market)))
              _assumedArgument[assumption]!: _assumedText(assumption, slice),
        },
      'limit': _limit(assessed.binding?.kind),
      shownOnTopKey: [
        for (final (:card, :shown) in _cards(slice, inMarket))
          if (shown || _asked(arguments, context).contains(card['id'])) card,
      ],
      waitingKey: [
        for (final (:card, :shown) in _cards(slice, inMarket))
          if (!shown && !_asked(arguments, context).contains(card['id'])) card,
      ],
      'note':
          'The figures are in /affordability; never write them in your '
          'text. $drawNote The cards under drawWhenAsked wait: put one on '
          'the plan when the buyer asks for it or picks it as the next '
          'thing to look at, with arrange_plan and its id, or under show '
          'when you call this tool again: ${_waitingText()}. In your '
          'reply say in your own plain words what limit says, and what it '
          'means for the home they can look at. ${slice.assumed.isEmpty ? '' : _assumedNote}'
          "What is under assumed is the buyer's to decide; nothing else "
          'can be computed yet, so offer no other choice. When they apply '
          'a down payment or take a rate, call this tool again with it as '
          'downPayment or loanType.',
    },
    asksOnCard: slice.awaitsConfirmation,
    seeds: {
      'affordability': jsonDecode(jsonEncode(slice.toJson())),
      if (_homesToPrice(context, slice) case final ids when ids.isNotEmpty)
        homesSlice.name: {
          for (final MapEntry(:key, :value)
              in markets
                  .pricedHomes(
                    ids,
                    slice,
                    kept: keptHomesIn(context.slices[homesSlice.name]),
                  )
                  .entries)
            key: jsonDecode(jsonEncode(value.toJson())),
        },
    },
  );

  static const _askedFor = {
    'monthly': 'what a month costs',
    'costs': 'what they pay on the day',
    'stress': 'what happens when rates rise',
    'down-payment': 'other down payments',
    'rates': 'the rates side by side',
    'loan': 'the loan year by year',
    'household': 'who the figures rest on',
    'limit': 'the lending rule that sets the loan',
  };

  static String _waitingText() => [
    for (final MapEntry(:key, :value) in _askedFor.entries) '$key for $value',
  ].join(', ');

  static Set<String> _asked(
    Map<String, Object?> arguments,
    ToolContext context,
  ) => {
    if (arguments['show'] case final List<Object?> cards)
      for (final card in cards)
        if (card
            case {
              'card': final String id,
              'theirWords': final String words,
            }
            when inTheirWords(words, context.buyerWords))
          id,
  };

  static List<({Map<String, Object?> card, bool shown})> _cards(
    AffordabilitySlice slice,
    Map<String, Money> inMarket,
  ) => [
    (
      card: block('summary', 'AffordabilitySummary', _affordability),
      shown: true,
    ),
    (
      card: block('household', 'HouseholdSummary', {
        ..._affordability,
        'confirm': sends('confirm_household'),
      }),
      shown: slice.assumed.isNotEmpty,
    ),
    if (slice.binding != null)
      (
        card: block('limit', 'RuleNote', {
          'rule': boundTo('/affordability/binding'),
        }),
        shown: slice.loan > slice.maxLoan,
      ),
    (
      card: block('monthly', 'MonthlyCostBreakdown', _affordability),
      shown: slice.homeId != null || inMarket['price'] != null,
    ),
    (card: block('costs', 'PurchaseCostsTable', _affordability), shown: false),
    if (slice.homeId case final id?) (card: homeCard(id), shown: true),
    (card: block('stress', 'StressTestChart', _affordability), shown: false),
    (
      card: block('down-payment', 'DownPaymentSlider', {
        ..._affordability,
        'apply': sends('use_down_payment'),
      }),
      shown: false,
    ),
    (
      card: block('rates', 'MortgageOptions', {
        ..._affordability,
        'choose': sends('take_rate'),
      }),
      shown: false,
    ),
    (card: block('loan', 'LoanBalanceChart', _affordability), shown: false),
  ];

  static const _assumedNote =
      'assumedAboutThem holds, the one that moves the answer most first, '
      'what their words did not say and this tool assumed or estimated; '
      'the household card under draw shows each one marked, with its '
      'figure, and a button that says they are right. If their words '
      'already said one of these, such as no debts or no children, call '
      'again with it now, before you reply. Otherwise say in your text '
      'what you assumed about them, in plain words and without figures, '
      'and that they can confirm it on the card or tell you what is '
      'different; the card asks, so draw no ask for it and end with a '
      'statement. When they say it is right, or tap that button, call '
      'again with assumedRight true; when they correct something, call '
      'again with their figure. ';

  static String _assumedText(
    ProfileAssumption assumption,
    AffordabilitySlice slice,
  ) => switch (assumption) {
    ProfileAssumption.adults =>
      '${slice.profile?.adults}, one for each income passed',
    ProfileAssumption.children => 'none',
    ProfileAssumption.age => 'the oldest borrower is $assumedAdultAge',
    ProfileAssumption.debts => 'no other loans',
    ProfileAssumption.takeHomePay =>
      'estimated from their pay before tax with '
          "${slice.takeHomeSource?.publisher ?? 'the market'}'s tax table, "
          "each income taxed as one person's pay; the household card "
          'shows the figure',
    ProfileAssumption.residency => 'they pay tax in ${slice.marketName}',
    ProfileAssumption.use => 'a home to live in',
    ProfileAssumption.employment => 'employed',
  };

  static Set<String> _homesToPrice(
    ToolContext context,
    AffordabilitySlice slice,
  ) => {
    ...switch (context.slices[homesSlice.name]) {
      final Map<String, Object?> homes => homes.keys,
      _ => const <String>[],
    },
    ?slice.homeId,
  };

  static bool _ageSetsLoan(ResolvedMarket market) =>
      market.lending.incomeAdjustments.isNotEmpty ||
      market.lending.maxAgeAtMaturity.isNotEmpty ||
      market.lending.maxTermYears.any((rule) => rule.appliesTo?.age != null);

  String? _marketInUse(Map<String, Object?> slices) {
    if (slices[affordabilityDataSlice.name] case {
      'marketId': final String code,
    }) {
      return markets.coveredCode(code);
    }
    final lookedUp = switch (slices[marketsSlice.name]) {
      final Map<String, Object?> cities => {
        for (final cityId in cities.keys) ?markets.coveredCode(cityId),
      },
      _ => const <String>{},
    };
    return lookedUp.length == 1 ? lookedUp.single : null;
  }

  static List<Map<String, Object?>> _ask(
    ProfileField field,
    ResolvedMarket market,
  ) {
    final currency = market.currency.code;
    Map<String, Object?> money(String label, String period, [String? hint]) => {
      'label': label,
      'kind': 'money',
      'currency': currency,
      'period': period,
      'hint': ?hint,
    };
    Map<String, Object?> pick(String label, List<String> options) => {
      'label': label,
      'kind': 'pick',
      'options': options,
    };
    return switch (field) {
      ProfileField.grossMonthlyIncome => [
        money('What you earn together before tax', 'month'),
      ],
      ProfileField.netMonthlyIncome || ProfileField.incomeCurrency => [
        money('What you take home together', 'month'),
      ],
      ProfileField.monthlyDebtPayments => [
        money('What you pay on other loans', 'month', '0 if none'),
      ],
      ProfileField.savings => [money('What you have saved', 'once')],
      ProfileField.age => [
        {'label': 'Age of the oldest borrower', 'kind': 'number'},
      ],
      ProfileField.household => [
        pick('Adults who will live in the home', const [
          'One',
          'Two',
          'Three or more',
        ]),
        {
          'label': "Children's ages",
          'kind': 'text',
          'hint': 'Such as 6 and 9, or none',
        },
      ],
      ProfileField.borrowers => [
        {'label': 'How many of you take the loan', 'kind': 'number'},
      ],
      ProfileField.residency => [
        pick('Where you pay tax', [market.name, 'Another country']),
      ],
      ProfileField.formerResident => [
        pick('Have you paid tax in ${market.name} before', const ['Yes', 'No']),
      ],
      ProfileField.residencyIntent => [
        pick('Will you start paying tax in ${market.name}', const [
          'Yes, within two years',
          'No',
        ]),
      ],
      ProfileField.use => [
        pick('What the home is for', const [
          'To live in',
          'A second home',
          'To rent out',
        ]),
      ],
      ProfileField.employment => [
        pick('Your work', const ['Employed', 'Self-employed', 'Retired']),
      ],
      ProfileField.firstTime => [
        pick('Is this your first home', const ['Yes', 'No']),
      ],
      ProfileField.citizenship => [
        {'label': 'Your citizenship', 'kind': 'text'},
      ],
    };
  }

  static final _affordability = {'affordability': boundTo('/affordability')};

  static String? _limit(ConstraintKind? kind) => switch (kind) {
    null => null,
    ConstraintKind.loanToValue =>
      'Their savings set the limit, not their income: a loan may cover '
          'only a share of the price, so the down payment they can make '
          'decides the highest price.',
    ConstraintKind.loanToIncome =>
      'Their income sets the limit: lenders cap all loans at a multiple '
          'of yearly pay before tax, so more savings would not raise the '
          'loan.',
    ConstraintKind.debtServiceToIncome =>
      'Their income sets the limit: the monthly payment may take only a '
          'share of it.',
    ConstraintKind.leftToLiveOn =>
      'What is left to live on sets the limit: after everyday costs and '
          'the payment at the rate lenders test, enough must be left each '
          'month.',
  };

  static String _doubted(FigureDoubt doubt) => switch (doubt) {
    FigureDoubt.takeHomeBelowEverydayCosts ||
    FigureDoubt.takeHomeAbovePay => 'netIncomes',
    FigureDoubt.payBelowEverydayCosts => 'grossIncomes',
  };

  static String _why(DoubtedFigure doubted, BuyerProfile profile) {
    final household = [
      switch (profile.adults) {
        null || 1 => 'one adult',
        final adults => '$adults adults',
      },
      switch (profile.childAges?.length) {
        null || 0 => null,
        1 => 'one child',
        final children => '$children children',
      },
    ].nonNulls.join(' and ');
    final slip = doubted.tenfoldWouldPass
        ? 'It reads like a slip: with one more zero it would cover them.'
        : 'It may be a figure for another period, or for one person.';
    return switch (doubted.doubt) {
      FigureDoubt.takeHomeAbovePay =>
        'The take-home pay is more than the pay before tax; one of them is '
            'off, or they are swapped.',
      FigureDoubt.takeHomeBelowEverydayCosts =>
        'The take-home pay does not cover the sample everyday costs of '
            '$household before any housing, so no loan would pass. $slip',
      FigureDoubt.payBelowEverydayCosts =>
        'The pay before tax does not cover the sample everyday costs of '
            '$household before any housing, so no loan would pass. $slip',
    };
  }

  static AffordabilitySlice _withHome(
    AffordabilitySlice slice,
    Listing? listing,
  ) => switch (listing) {
    final listing? => slice.copyWith(
      homeId: listing.id,
      homeName: listing.addressLine,
    ),
    null => slice,
  };

  static List<Object?> _argumentsOf(Object? value) => switch (value) {
    final List<Object?> list => list,
    null => const [],
    final single => [single],
  };

  static T? _enum<T extends Enum>(List<T> values, Object? name) =>
      values.where((value) => value.name == name).firstOrNull;
}
