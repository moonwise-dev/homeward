import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../markets/pack_fixtures.dart';

void main() {
  final currency = Currency.parse('EUR');
  Money euro(int units, [int cents = 0]) =>
      Money(minorUnits: units * 100 + cents, currency: currency);

  CostRule ruleWith({
    required CostBase base,
    required CostCalculation calculation,
    Rounding rounding = Rounding.halfUp,
  }) => CostRule(
    id: 'charge',
    label: 'Charge',
    base: base,
    calculation: calculation,
    rounding: rounding,
    recurrence: Recurrence.once,
    sourceId: 'fixture',
  );

  group('chargeFor', () {
    test('takes a rate of the price, the loan, or a fixed amount', () {
      Money charge(CostBase base) => chargeFor(
        ruleWith(
          base: base,
          calculation: const CostCalculation.flatRate(
            rate: Rate.ppm(10000),
          ),
        ),
        price: euro(300000),
        loan: euro(200000),
      );

      expect(charge(CostBase.price), euro(3000));
      expect(charge(CostBase.loan), euro(2000));
      expect(charge(CostBase.pledgedAmount), euro(2000));
      expect(charge(CostBase.fixed), euro(0));
      expect(
        chargeFor(
          ruleWith(
            base: CostBase.fixed,
            calculation: CostCalculation.fixed(
              amount: ExactDecimal.parse('249.90'),
            ),
          ),
          price: euro(300000),
          loan: euro(200000),
        ),
        euro(249, 90),
      );
    });

    test('takes the higher of a rate and its minimum', () {
      Money charge(Money price) => chargeFor(
        ruleWith(
          base: CostBase.price,
          calculation: CostCalculation.percentWithMin(
            rate: const Rate.ppm(1000),
            min: ExactDecimal.parse('500'),
          ),
        ),
        price: price,
        loan: price,
      );

      expect(charge(euro(1000000)), euro(1000));
      expect(charge(euro(100000)), euro(500));
    });

    test('charges bracket tables both ways', () {
      Money charge({required bool marginal}) => chargeFor(
        ruleWith(
          base: CostBase.price,
          calculation: CostCalculation.brackets(
            marginal: marginal,
            brackets: [
              BracketRule(
                upTo: ExactDecimal.parse('100000'),
                rate: const Rate.ppm(0),
              ),
              BracketRule(
                rate: const Rate.ppm(100000),
                deduction: marginal ? null : ExactDecimal.parse('10000'),
              ),
            ],
          ),
        ),
        price: euro(200000),
        loan: euro(200000),
      );

      expect(charge(marginal: true), euro(10000));
      expect(charge(marginal: false), euro(10000));
    });
  });

  group('estimatePurchaseCosts', () {
    final portugal = MarketRulePack.fromJson(
      jsonDecode(portugalPackJson) as Map<String, Object?>,
    );
    final scenario = Scenario(
      price: euro(350000),
      downPayment: euro(105000),
      termYears: 30,
      loanTypeId: 'euribor12m',
      rateSpread: Rate.zero,
    );

    PurchaseCosts costsFor(BuyerProfile profile) => estimatePurchaseCosts(
      scenario: scenario,
      market: resolveForBuyer(portugal, profile),
    );

    test('waits for the facts that pick the charge', () {
      expect(
        costsFor(BuyerProfile(taxResidence: CountryCode.parse('PT'))),
        isA<IncompletePurchaseCosts>().having(
          (costs) => costs.missing,
          'missing',
          {ProfileField.use},
        ),
      );
    });

    test('shows what a refund would return and on what terms', () {
      final costs = costsFor(
        BuyerProfile(
          taxResidence: CountryCode.parse('SE'),
          formerResident: false,
          residencyIntent: ResidencyIntent.becomeResident,
          use: PropertyUse.primary,
        ),
      ) as EstimatedPurchaseCosts;

      expect(costs.charges.single.ruleId, 'imt-nonresident');
      expect(costs.total, euro(26250));
      expect(costs.refundable, euro(12013, 35));
      expect(costs.charges.single.refund?.claimWindow, Period.parse('P6M'));
      expect(costs.cashNeeded, euro(131250));
    });

    test('leaves the refund out when the buyer is not claiming it', () {
      final costs = costsFor(
        BuyerProfile(
          taxResidence: CountryCode.parse('SE'),
          formerResident: false,
          residencyIntent: ResidencyIntent.stay,
          use: PropertyUse.primary,
        ),
      ) as EstimatedPurchaseCosts;

      expect(costs.charges.single.refundable, isNull);
      expect(costs.refundable, euro(0));
    });
  });
}
