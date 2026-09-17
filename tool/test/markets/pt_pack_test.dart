import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_server/markets/load_markets.dart';
import 'package:test/test.dart';

void main() {
  final markets = loadMarkets(Directory('../markets'));
  final packs = {for (final pack in markets.packsByFile.values) pack.id: pack};
  final madeira = resolvePackChain(MarketId.parse('PT-30'), packs);
  final currency = Currency.parse('EUR');
  Money euro(int units, [int cents = 0]) =>
      Money(minorUnits: units * 100 + cents, currency: currency);

  final scenario = Scenario(
    price: euro(350000),
    downPayment: euro(105000),
    termYears: 30,
    loanTypeId: 'euribor-6m',
    rateSpread: madeira.loanTypes.single.defaultSpread,
  );

  BuyerProfile buyer({
    required String taxResidence,
    bool formerResident = false,
    PropertyUse use = PropertyUse.secondary,
    int age = 42,
  }) => BuyerProfile(
    citizenship: CountryCode.parse('SE'),
    taxResidence: CountryCode.parse(taxResidence),
    formerResident: formerResident,
    residencyIntent: ResidencyIntent.becomeResident,
    use: use,
    age: age,
    employment: Employment.employed,
    netMonthlyIncome: euro(9000),
    monthlyDebtPayments: euro(0),
    savings: euro(150000),
  );

  ResolvedMarket resolve(BuyerProfile profile) =>
      resolveForBuyer(madeira, profile, referenceRates: markets.rates);

  CostRule transferTax(ResolvedMarket market) =>
      market.purchaseCosts.singleWhere((rule) => rule.group == 'imt');

  Money charge(CostRule rule) => switch (rule.calculation) {
    FlatRateCalculation(:final rate) => scenario.price.applyRate(
      rate,
      rounding: rule.rounding,
    ),
    BracketsCalculation(:final brackets) => deductionCharge(
      base: scenario.price,
      brackets: [for (final bracket in brackets) bracket.toBracket(currency)],
      rounding: rule.rounding,
    ),
    _ => fail('${rule.id} is neither a flat rate nor a table'),
  };

  test('a non-resident who was never resident pays the flat rate', () {
    final market = resolve(buyer(taxResidence: 'SE'));

    expect(transferTax(market).id, 'imt-nonresident');
    expect(charge(transferTax(market)), euro(26250));
    expect(market.purchaseCosts.map((rule) => rule.id), [
      'imt-nonresident',
      'stamp-duty-purchase',
      'stamp-duty-loan',
    ]);
  });

  test('a resident buying a permanent home pays the regional table', () {
    final market = resolve(buyer(taxResidence: 'PT', use: PropertyUse.primary));

    expect(transferTax(market).id, 'imt-own-permanent-residence');
    expect(charge(transferTax(market)), euro(11427, 52));
  });

  test('a non-resident who was once resident pays the normal tables', () {
    final market = resolve(
      buyer(taxResidence: 'SE', formerResident: true, use: PropertyUse.primary),
    );

    expect(transferTax(market).id, 'imt-own-permanent-residence');
  });

  test('the refund is the difference a resident would have paid', () {
    final nonResident = resolve(buyer(taxResidence: 'SE'));
    final refund = transferTax(nonResident).refund!;
    final resident = resolve(
      buyer(taxResidence: 'PT', use: PropertyUse.primary),
    );

    expect(refund.recomputeAs.residency, Residency.resident);
    expect(refund.recomputeAs.use, PropertyUse.primary);
    expect(refund.deadline, Period.parse('P2Y'));
    expect(refund.claimWindow, Period.parse('P6M'));
    expect(
      charge(transferTax(nonResident)) - charge(transferTax(resident)),
      euro(14822, 48),
    );
  });

  test('the lender norm binds a non-resident under the legal cap', () {
    final market = resolve(buyer(taxResidence: 'SE'));

    final affordability = assessAffordability(
      scenario: scenario,
      market: market,
      profile: buyer(taxResidence: 'SE'),
    ) as AssessedAffordability;

    expect(affordability.binding?.ruleId, 'ltv-nonresident-lender-norm');
    expect(affordability.maxLoan, euro(245000));
    expect(affordability.downPaymentBounds.min, euro(105000));
    expect(
      market.lending.maxLtv.map((rule) => rule.id),
      ['ltv-secondary-home', 'ltv-nonresident-lender-norm'],
    );
  });

  test('the cash the buyer needs includes every charge', () {
    final market = resolve(buyer(taxResidence: 'SE'));

    final costs = estimatePurchaseCosts(
      scenario: scenario,
      market: market,
    ) as EstimatedPurchaseCosts;

    expect(costs.charges.map((charge) => charge.amount), [
      euro(26250),
      euro(2800),
      euro(1470),
    ]);
    expect(costs.total, euro(30520));
    expect(costs.refundable, euro(14822, 48));
    expect(costs.cashNeeded, euro(135520));
  });

  test('a resident pays no refundable part', () {
    final costs = estimatePurchaseCosts(
      scenario: scenario,
      market: resolve(
        buyer(taxResidence: 'PT', use: PropertyUse.primary),
      ),
    ) as EstimatedPurchaseCosts;

    expect(costs.charges.first.refundable, isNull);
    expect(costs.total, euro(15697, 52));
  });

  test('costs wait for the facts that pick the table', () {
    final market = resolve(
      buyer(taxResidence: 'SE').copyWith(use: null),
    );

    expect(
      estimatePurchaseCosts(scenario: scenario, market: market),
      isA<IncompletePurchaseCosts>().having(
        (costs) => costs.missing,
        'missing',
        {ProfileField.use},
      ),
    );
  });

  test('a borrower over 35 is held to a 35 year term', () {
    expect(
      resolve(buyer(taxResidence: 'SE')).lending.maxTermYears.single.years,
      35,
    );
    expect(
      resolve(
        buyer(taxResidence: 'SE', age: 30),
      ).lending.maxTermYears.single.years,
      40,
    );
  });
}
