import 'package:common/common.dart';
import 'package:homeward_server/tools/resolve_market_tool.dart';
import 'package:test/test.dart';

import 'tool_fixtures.dart';

void main() {
  const tool = ResolveMarketTool();

  final cases = <(String, Map<String, Object?>, List<(String, String)>, bool)>[
    (
      'Funchal from its country',
      {'placeName': 'Funchal', 'countryCode': 'PT'},
      [('PT-30', 'uncovered')],
      true,
    ),
    (
      'Funchal from its region',
      {'placeName': 'Funchal', 'countryCode': 'PT', 'subdivisionCode': 'PT-30'},
      [('PT-30', 'uncovered')],
      true,
    ),
    (
      'a place written without accents',
      {'placeName': 'camara de lobos', 'countryCode': 'PT'},
      [('PT-30', 'uncovered')],
      true,
    ),
    (
      'an Azores town proposed as mainland',
      {'placeName': 'Ponta Delgada', 'countryCode': 'PT'},
      [('PT-20', 'uncovered')],
      true,
    ),
    (
      'Lagoa, in the Azores and the Algarve',
      {'placeName': 'Lagoa', 'countryCode': 'PT', 'subdivisionCode': 'PT-08'},
      [('PT-20', 'uncovered'), ('PT', 'uncovered')],
      false,
    ),
    (
      'Calheta, in Madeira and the Azores',
      {'placeName': 'Calheta', 'countryCode': 'PT'},
      [('PT-30', 'uncovered'), ('PT-20', 'uncovered')],
      false,
    ),
    (
      'Södermalm, in a region without its own rules',
      {
        'placeName': 'Södermalm',
        'countryCode': 'SE',
        'subdivisionCode': 'SE-AB',
      },
      [('SE', 'curated')],
      true,
    ),
    (
      'Dubai, known but uncovered',
      {'placeName': 'Dubai', 'countryCode': 'AE', 'subdivisionCode': 'AE-DU'},
      [('AE', 'uncovered')],
      true,
    ),
    (
      'Funchal proposed in another country',
      {'placeName': 'Funchal', 'countryCode': 'ES'},
      [('PT-30', 'uncovered'), ('ES', 'uncovered')],
      false,
    ),
    (
      'a subdivision without a country',
      {'placeName': 'Somewhere', 'subdivisionCode': 'se-ab'},
      [('SE', 'curated')],
      true,
    ),
  ];

  for (final (name, arguments, expected, selected) in cases) {
    test('resolves $name', () {
      final result = tool.run(arguments, contextWith());
      final candidates = (result.modelResult['candidates']! as List<Object?>)
          .cast<Map<String, Object?>>();

      expect(
        [
          for (final candidate in candidates)
            (candidate['marketId'], candidate['coverage']),
        ],
        expected,
      );
      expect(result.modelResult['selected'], selected);
      expect(
        result.plan?.marketId?.code,
        selected ? expected.single.$1 : isNull,
      );
      expect(
        (result.seeds['selection']! as Map<String, Object?>)['marketId'],
        expected.first.$1,
      );
    });
  }

  test('selecting another market releases the scenario and keeps the '
      'profile', () {
    final sek = Money(minorUnits: 100, currency: Currency.parse('SEK'));
    final scenario = Scenario(
      price: sek,
      downPayment: sek,
      termYears: 30,
      loanTypeId: 'variable-3m',
      rateSpread: Rate.zero,
    );
    final plan = Plan(
      marketId: MarketId.parse('PT-30'),
      profile: const BuyerProfile(age: 40),
      scenario: scenario,
      scenarioDraft: scenario,
    );

    final moved = tool.run({
      'placeName': 'Stockholm',
      'countryCode': 'SE',
    }, contextWith(plan: plan)).plan!;
    final unchanged = tool.run({
      'placeName': 'Funchal',
    }, contextWith(plan: plan));

    expect(moved.marketId, MarketId.parse('SE'));
    expect(moved.profile, plan.profile);
    expect(moved.scenario, isNull);
    expect(moved.scenarioDraft, isNull);
    expect(unchanged.plan, isNull);
  });

  test('names regions with their country', () {
    final result = tool.run({'placeName': 'Funchal'}, contextWith());
    final candidate =
        (result.modelResult['candidates']! as List<Object?>).single;

    expect((candidate! as Map<String, Object?>)['name'], 'Madeira, Portugal');
  });

  test('offers the curated markets when nothing resolves', () {
    final result = tool.run(
      {'placeName': 'Atlantis', 'countryCode': 'ZZ'},
      contextWith(),
    );

    expect(result.modelResult['candidates'], isEmpty);
    expect(result.modelResult['curatedMarkets'], ['Sweden']);
    expect(result.seeds, isEmpty);
  });

  test('is declared for the model and never pre-run', () {
    expect(tool.declaration.toJson()['name'], 'resolve_market');
    expect(tool.preRunnable, isFalse);
  });
}
