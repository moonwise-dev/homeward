import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import 'agent_tool.dart';
import 'draw.dart';
import 'household_in.dart';
import 'amount_arguments.dart';
import 'kept_homes.dart';
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
      'Until it has answered, pass everything the buyer has told you each '
      'time; once it has answered, it keeps that household and its '
      'figures, so pass again only what is new or changed, such as home. '
      'Call it as soon as the buyer gives any money figure, and before you '
      'ask for money facts, with what you have, even the market alone: its '
      'needs are what one Questions card should ask. Pass only figures the '
      'buyer stated, as they '
      'stated them; a figure not in their words is refused. It answers with '
      'doubts, figures that do not make sense and must be checked with the '
      'buyer before they are used; or with needs, every fact still missing '
      'and why, to ask for together; or it seeds /affordability for '
      'AffordabilitySummary, RuleNote, '
      'MonthlyCostBreakdown, StressTestChart, PurchaseCostsTable, '
      'DownPaymentSlider, MortgageOptions, and LoanBalanceChart, and lists '
      "what it assumed that is the buyer's to decide. For a home anywhere "
      'else, tell the buyer the sample does not cover it.';

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
                  'they have none.',
            _ =>
              'Each amount as the buyer stated it, per person or combined, '
                  'in its own currency; never split or add them.',
          },
        },
      'home': {
        'type': 'string',
        'description':
            'Optional. The ID of a sample home from search_homes the buyer '
            'picked; its price and fee come from the listing, so pass no '
            'price or homeFee with it.',
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
        'description': 'Age of the oldest borrower.',
      },
      'adults': {
        'type': 'integer',
        'description':
            'How many adults will live in the home, borrowers or not; a '
            'small count you may deduce from their words.',
      },
      'childAges': {
        'type': 'array',
        'items': {'type': 'integer'},
        'description':
            'The age of each child who will live in the home; [] when there '
            'are none.',
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
          'error': 'No sample home $homeId; take the ID from search_homes.',
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
              monthlyOf(moneyFromArgument(argument, currency), argument),
          ],
    };
    final home = {
      for (final name in _homeAmounts)
        if (arguments[name] case final argument?)
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
    final base = BuyerProfile(
      age:
          arguments['age'] as int? ??
          (earlier?.ageAssumed ?? false ? null : kept?.age),
      adults: arguments['adults'] as int? ?? kept?.adults,
      childAges: switch (arguments['childAges']) {
        final List<Object?> ages => [
          for (final age in ages)
            if (age is int) age,
        ],
        _ => kept?.childAges,
      },
      borrowers:
          arguments['borrowers'] as int? ??
          arguments['adults'] as int? ??
          kept?.borrowers,
      taxResidence: switch (arguments['taxResidence']) {
        final String code => CountryCode.parse(code.toUpperCase()),
        _ => kept?.taxResidence,
      },
      use: _enum(PropertyUse.values, arguments['use']) ?? kept?.use,
      employment:
          _enum(Employment.values, arguments['employment']) ?? kept?.employment,
      residencyIntent:
          _enum(ResidencyIntent.values, arguments['residencyIntent']) ??
          kept?.residencyIntent,
      formerResident:
          arguments['formerResident'] as bool? ?? kept?.formerResident,
    );
    final currencies = {
      for (final list in amounts.values)
        for (final money in list) money.currency,
      for (final money in home.values) money.currency,
    };
    final rates = markets.resolveFor(id, base, currencies: currencies)!;
    final ageAssumed =
        base.age == null &&
        !rates.missingFor(RuleSection.lending).contains(ProfileField.age) &&
        rates.lending.incomeAdjustments.isEmpty &&
        rates.lending.maxAgeAtMaturity.isEmpty;
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
      age: ageAssumed ? assumedAdultAge : base.age,
      grossMonthlyIncome: totals['grossIncomes'] ?? kept?.grossMonthlyIncome,
      netMonthlyIncome: totals['netIncomes'] ?? kept?.netMonthlyIncome,
      monthlyDebtPayments: totals['debtPayments'] ?? kept?.monthlyDebtPayments,
      savings: totals['savings'] ?? kept?.savings,
    );
    final market = markets.resolveFor(id, profile, currencies: currencies)!;
    final confirmed = {...?arguments['confirmed'] as List<Object?>?};
    final doubts = [
      for (final doubted in figureDoubts(market: market, profile: profile))
        if (arguments[_doubted(doubted.doubt)] != null &&
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
    return switch (answerAffordability(
      market: market,
      profile: profile,
      price: inMarket['price'],
      downPayment: inMarket['downPayment'],
      monthlyFee: inMarket['homeFee'],
      termYears: arguments['termYears'] as int?,
      loanTypeId: arguments['loanType'] as String?,
    )) {
      AffordabilityNeeds(:final missing, :final unconverted) => ToolResult(
        logFields: {
          'needs': [for (final field in missing) field.name],
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
          if (unconverted.isNotEmpty)
            'noExchangeRateFor': [for (final c in unconverted) c.code],
          'note':
              'Nothing was worked out yet. Pass what the buyer said or '
              'the brief holds, and call again in this turn; never guess '
              'that there are no children or no loans. Ask for everything '
              'still missing together, in one Questions card in this '
              'reply: ask holds the fields for each fact, to use as they '
              'are with an id of your own. A card holds six fields at '
              'most; ask what is left over in the next turn. Never ask for '
              'one fact a turn.',
        },
      ),
      AffordabilityAnswered(:final assessed, slice: final answered) =>
        _answered(
          assessed,
          _withHome(
            answered.copyWith(ageAssumed: ageAssumed),
            sample?.listing,
          ),
          arguments,
          inMarket,
          market,
          context,
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
  ) => ToolResult(
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
        if (slice.ageAssumed)
          'age':
              'adults of $assumedAdultAge, which only moves the sample '
              'everyday costs a little',
      },
      'limit': _limit(assessed.binding?.kind),
      'draw': [
        block('summary', 'AffordabilitySummary', _affordability),
        if (slice.binding != null)
          block('limit', 'RuleNote', {
            'rule': boundTo('/affordability/binding'),
          }),
        block('monthly', 'MonthlyCostBreakdown', _affordability),
      ],
      'drawWhenAsked': [
        block('stress', 'StressTestChart', _affordability),
        block('costs', 'PurchaseCostsTable', _affordability),
        block('down-payment', 'DownPaymentSlider', {
          ..._affordability,
          'apply': sends('use_down_payment'),
        }),
        block('rates', 'MortgageOptions', {
          ..._affordability,
          'choose': sends('take_rate'),
        }),
        block('loan', 'LoanBalanceChart', _affordability),
        block('household', 'HouseholdSummary', _affordability),
      ],
      'note':
          'The figures are in /affordability; never write them in your '
          'text. $drawNote Add one from drawWhenAsked when the buyer asks '
          'for it or picks it as the next thing to look at: rising rates, '
          'the costs on the day, other down payments, the rates side by '
          'side, the loan year by year, or who the household is. In your '
          'reply say in your own plain words what limit says, and what it '
          'means for the home they can look at. What was assumed is the '
          "buyer's to decide; nothing else can be computed yet, so offer "
          'no other choice. When they apply a down payment or take a '
          'rate, call this tool again with it as downPayment or loanType.',
    },
    seeds: {
      'affordability': jsonDecode(jsonEncode(slice.toJson())),
      if (context.slices[homesSlice.name] case final Map<String, Object?> homes)
        homesSlice.name: {
          for (final MapEntry(:key, :value)
              in markets
                  .pricedHomes(homes.keys, slice, kept: keptHomesIn(homes))
                  .entries)
            key: jsonDecode(jsonEncode(value.toJson())),
        },
    },
  );

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
