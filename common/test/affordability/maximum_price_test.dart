import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  Money? priceFor(
    Scenario scenario,
    ResolvedMarket market,
    BuyerProfile profile,
  ) => maximumPrice(scenario: scenario, market: market, profile: profile);

  Money cashAt(
    Money price,
    Scenario scenario,
    ResolvedMarket market,
    BuyerProfile profile,
  ) {
    final assessed = assessAffordability(
      scenario: scenario.copyWith(
        price: price,
        downPayment: Money.zero(market.currency),
      ),
      market: market,
      profile: profile,
    ) as AssessedAffordability;
    return (estimatePurchaseCosts(
      scenario: scenario.copyWith(
        price: price,
        downPayment: price - assessed.maxLoan,
      ),
      market: market,
    ) as EstimatedPurchaseCosts).cashNeeded;
  }

  test('Funchal savings reach 389 521 EUR, transfer tax included', () {
    final price = priceFor(funchalScenario, funchalMarket, funchalProfile)!;

    expect(
      price,
      Money(minorUnits: 38952190, currency: Currency.parse('EUR')),
    );
    expect(
      cashAt(price, funchalScenario, funchalMarket, funchalProfile),
      funchalMarket.converted(funchalProfile.savings),
    );
  });

  test('Stockholm savings reach 6 000 000 SEK, where no charge is due', () {
    final price = priceFor(
      stockholmScenario,
      stockholmMarket,
      stockholmProfile,
    )!;

    expect(
      price,
      Money(minorUnits: 600000000, currency: Currency.parse('SEK')),
    );
    expect(
      cashAt(price, stockholmScenario, stockholmMarket, stockholmProfile),
      stockholmProfile.savings,
    );
  });

  test('savings of one krona buy nothing worth having', () {
    final price = priceFor(
      funchalScenario,
      funchalMarket,
      funchalProfile.copyWith(
        savings: Money(minorUnits: 100, currency: Currency.parse('SEK')),
      ),
    )!;

    expect(
      price < Money(minorUnits: 100, currency: Currency.parse('EUR')),
      isTrue,
    );
  });

  test('it waits for the facts the rules need', () {
    expect(
      priceFor(
        funchalScenario,
        funchalMarket,
        funchalProfile.copyWith(savings: null),
      ),
      isNull,
    );
    expect(
      priceFor(
        funchalScenario,
        funchalMarket,
        funchalProfile.copyWith(netMonthlyIncome: null),
      ),
      isNull,
    );
  });
}
