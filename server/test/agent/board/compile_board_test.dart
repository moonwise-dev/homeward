import 'package:common/common.dart';
import 'package:homeward_server/agent/board/compile_board.dart';
import 'package:test/test.dart';

import '../../tools/tool_fixtures.dart';

void main() {
  final euro = Currency.parse('EUR');
  final krona = Currency.parse('SEK');
  Money amount(int units, Currency currency) =>
      Money(minorUnits: units * 100, currency: currency);

  final scenario = Scenario(
    price: amount(350000, euro),
    downPayment: amount(105000, euro),
    termYears: 30,
    loanTypeId: 'euribor-6m',
    rateSpread: const Rate.ppm(16000),
  );
  final buyer = BuyerProfile(
    citizenship: CountryCode.parse('SE'),
    taxResidence: CountryCode.parse('SE'),
    formerResident: false,
    residencyIntent: ResidencyIntent.becomeResident,
    use: PropertyUse.secondary,
    age: 42,
    employment: Employment.employed,
    netMonthlyIncome: amount(60000, krona),
    monthlyDebtPayments: amount(0, krona),
    savings: amount(1700000, krona),
  );
  final planned = Plan(
    marketId: MarketId.parse('PT-30'),
    profile: buyer,
    scenario: scenario,
  );

  List<Map<String, Object?>> boardFor(Plan plan) =>
      compileBoard(plan: plan, markets: realMarkets);

  List<Map<String, Object?>> componentsOf(List<Map<String, Object?>> board) =>
      ((board.last['updateComponents']! as Map<String, Object?>)['components']!
              as List<Object?>)
          .cast<Map<String, Object?>>();

  List<String> idsOf(List<Map<String, Object?>> board) => [
    for (final component in componentsOf(board)) component['id']! as String,
  ];

  test('a plan without a market has no board', () {
    expect(boardFor(const Plan()), isEmpty);
  });

  test('a market alone draws the market section', () {
    final board = boardFor(Plan(marketId: MarketId.parse('PT-30')));

    expect(board.first.keys, ['version', 'createSurface']);
    expect(idsOf(board), [
      'root',
      'market-card',
      'market-body',
      'market',
      'market-change',
      'market-change-label',
    ]);
  });

  test('a committed scenario draws the whole plan', () {
    final ids = idsOf(boardFor(planned));

    expect(ids.where((id) => !id.contains('-')), [
      'root',
      'market',
      'affordability',
      'payment',
      'costs',
      'eligibility',
      'obstacles',
    ]);
    expect(ids.where((id) => id.endsWith('-change')), [
      'market-change',
      'affordability-change',
    ]);
  });

  test('the board seeds the slices its components read', () {
    expect(
      [
        for (final message in boardFor(planned))
          if (message['updateDataModel'] case final Map<String, Object?> update)
            update['path'],
      ],
      ['/market', '/profile', '/scenario', '/selection'],
    );
  });

  test('every section binds the slices and nothing else', () {
    for (final component in componentsOf(boardFor(planned))) {
      if (component['component'] case final String name
          when homewardCatalog.components.containsKey(name)) {
        expect(component['market'], {'path': '/market'});
        expect(component['profile'], {'path': '/profile'});
      }
    }
  });

  test('every component the board draws passes catalog validation', () {
    final catalog = CatalogValidator(homewardCatalogDocument());

    for (final component in componentsOf(boardFor(planned))) {
      expect(
        catalog.validateComponent(component),
        isEmpty,
        reason: '${component['id']} is not a valid ${component['component']}',
      );
    }
  });

  test('a change asks the buyer to reopen a decision by name', () {
    final change = componentsOf(
      boardFor(planned),
    ).firstWhere((component) => component['id'] == 'affordability-change');

    expect(change['action'], {
      'event': {
        'name': 'change',
        'context': {'section': 'scenario'},
      },
    });
  });
}
