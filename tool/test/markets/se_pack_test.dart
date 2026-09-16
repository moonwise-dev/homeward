import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/markets_check/load_markets.dart';
import 'package:test/test.dart';

void main() {
  final markets = loadMarkets(Directory('../markets'));
  final sweden = markets.packsByFile['SE']!;
  final currency = Currency.parse('SEK');
  Money sek(int kronor, [int ore = 0]) =>
      Money(minorUnits: kronor * 100 + ore, currency: currency);

  final scenario = Scenario(
    price: sek(4500000),
    downPayment: sek(450000),
    termYears: 50,
    loanTypeId: 'variable-3m',
    rateSpread: sweden.loanTypes.single.defaultSpread,
    associationFee: sek(3500),
  );
  BuyerProfile stockholmCouple({required int netMonthly}) => BuyerProfile(
    taxResidence: CountryCode.parse('SE'),
    age: 34,
    netMonthlyIncome: sek(netMonthly),
    grossMonthlyIncome: sek(85000),
    monthlyDebtPayments: sek(0),
    savings: sek(900000),
    borrowers: 2,
    adults: 2,
    childAges: const [],
  );
  AssessedAffordability assess(BuyerProfile profile) => assessAffordability(
    scenario: scenario,
    market: resolveForBuyer(
      sweden,
      profile,
      referenceRates: markets.rates,
      livingCosts: markets.livingCosts[CountryCode.parse('SE')],
    ),
    profile: profile,
  ) as AssessedAffordability;

  test('the default rate is SBAB\'s list rate over the SCB average', () {
    final result = assess(stockholmCouple(netMonthly: 62000));

    expect(result.annualRate, const Rate.ppm(31500));
    expect(result.payment.interest, sek(10631, 25));
    expect(result.payment.amortization, sek(6750));
    expect(result.paymentAfterDeduction, sek(14191, 87));
  });

  test('Konsumentverket costs a couple aged 34 at 14 130 SEK a month', () {
    expect(
      markets.livingCosts[CountryCode.parse('SE')]!.monthlyFor(
        adultAge: 34,
        adults: 2,
        childAges: const [],
      ),
      sek(14130),
    );
  });

  test('a couple on 62 000 SEK net is bound by the 90% cap', () {
    final result = assess(stockholmCouple(netMonthly: 62000));

    expect(result.binding?.ruleId, 'ltv-new-loan');
    expect(result.maxLoan, sek(4050000));
    expect(
      result.checks
          .singleWhere((check) => check.ruleId == 'lti-bank-practice')
          .maxLoan,
      sek(5100000),
    );
  });

  test('a couple on 40 000 SEK net is bound by left to live on', () {
    final result = assess(stockholmCouple(netMonthly: 40000));

    expect(result.binding?.ruleId, 'left-to-live-on');
    expect(result.maxLoan, sek(3413546, 99));
    expect(result.downPaymentBounds.min, sek(1086453, 1));
    expect(result.downPaymentBounds.step, sek(20000));
  });
}
