import 'dart:convert';

import 'package:common/common.dart';
import 'package:test/test.dart';

import '../markets/pack_fixtures.dart';
import '../support/money_helpers.dart';

void main() {
  final source = Source.fromJson(
    jsonDecode(fixtureSourceJson) as Map<String, Object?>,
  );
  final livingCosts = LivingCosts.fromJson(
    jsonDecode(livingCostsFixtureJson) as Map<String, Object?>,
  );

  group('Sweden', () {
    final pack = MarketRulePack(
      id: MarketId.parse('SE'),
      name: 'Sweden',
      currency: Currency.parse('SEK'),
      locale: LocaleTag.parse('sv-SE'),
      version: 1,
      effectiveFrom: CalendarDate.parse('2026-04-01'),
      lending: LendingRules.fromJson(
        jsonDecode(swedenLendingJson) as Map<String, Object?>,
      ),
      loanTypes: [
        LoanType(
          id: 'variable-3m',
          label: 'Variable, 3 months',
          rateType: RateType.variable,
          referenceRateId: 'SE.AVG_VARIABLE_3M',
          typicalSpread: const RateRange(min: Rate.zero, max: Rate.zero),
          defaultSpread: Rate.zero,
          sourceId: source.id,
        ),
      ],
    );
    final rates = {
      'SE.AVG_VARIABLE_3M': ReferenceRate(
        id: 'SE.AVG_VARIABLE_3M',
        rate: const Rate.ppm(30000),
        asOf: CalendarDate.parse('2026-08-31'),
        source: source,
      ),
    };
    final scenario = Scenario(
      price: sek(450000000),
      downPayment: sek(45000000),
      termYears: 50,
      loanTypeId: 'variable-3m',
      rateSpread: Rate.zero,
      associationFee: sek(350000),
    );
    BuyerProfile couple({required int netMonthly}) => BuyerProfile(
      taxResidence: CountryCode.parse('SE'),
      age: 34,
      netMonthlyIncome: sek(netMonthly * 100),
      grossMonthlyIncome: sek(8500000),
      monthlyDebtPayments: sek(0),
      borrowers: 2,
      adults: 2,
      childAges: const [],
    );
    ResolvedMarket marketFor(BuyerProfile profile) => resolveForBuyer(
      pack,
      profile,
      referenceRates: rates,
      livingCosts: livingCosts,
    );
    Affordability assess(BuyerProfile profile) => assessAffordability(
      scenario: scenario,
      market: marketFor(profile),
      profile: profile,
    );

    test('a well-paid couple is bound by the loan-to-value cap', () {
      final result = assess(couple(netMonthly: 62000)) as AssessedAffordability;

      expect(result.annualRate, const Rate.ppm(30000));
      expect(result.payment.interest, sek(1012500));
      expect(result.payment.amortization, sek(675000));
      expect(result.paymentAfterDeduction, sek(1383750));
      expect(
        {for (final check in result.checks) check.ruleId: check.maxLoan},
        {
          'ltv-new-loan': sek(405000000),
          'lti-lender-norm': sek(561000000),
          'kalp': sek(450000000),
        },
      );
      expect(result.binding?.kind, ConstraintKind.loanToValue);
      expect(result.maxLoan, sek(405000000));
      expect(
        result.downPaymentBounds,
        DownPaymentBounds(
          min: sek(45000000),
          max: sek(450000000),
          step: sek(2000000),
        ),
      );
    });

    test('a tighter budget is bound by left to live on', () {
      final result = assess(couple(netMonthly: 35000)) as AssessedAffordability;

      expect(result.binding?.kind, ConstraintKind.leftToLiveOn);
      expect(result.maxLoan, sek(335458199));
      expect(
        result.checks
            .singleWhere((check) => check.ruleId == 'kalp')
            .allows(result.loan),
        isFalse,
      );
      expect(result.downPaymentBounds.min, sek(114541801));
    });

    test('lists the facts it still needs', () {
      final profile = BuyerProfile(taxResidence: CountryCode.parse('SE'));

      expect(
        assess(profile),
        const Affordability.incomplete(
          missing: {
            ProfileField.netMonthlyIncome,
            ProfileField.grossMonthlyIncome,
            ProfileField.monthlyDebtPayments,
            ProfileField.age,
            ProfileField.household,
            ProfileField.borrowers,
          },
          unconvertedCurrencies: {},
        ),
      );
    });

    test('waits for an exchange rate when income is in another currency', () {
      final profile = couple(
        netMonthly: 62000,
      ).copyWith(netMonthlyIncome: eur(500000));

      expect(
        assess(profile),
        Affordability.incomplete(
          missing: const {},
          unconvertedCurrencies: {Currency.parse('EUR')},
        ),
      );
    });

    test('rejects an unknown loan type, a missing rate, and missing costs', () {
      final profile = couple(netMonthly: 62000);
      final market = marketFor(profile);

      expect(
        () => assessAffordability(
          scenario: scenario.copyWith(loanTypeId: 'fixed-5y'),
          market: market,
          profile: profile,
        ),
        throwsArgumentError,
      );
      expect(
        () => assessAffordability(
          scenario: scenario,
          market: market.copyWith(referenceRates: const {}),
          profile: profile,
        ),
        throwsArgumentError,
      );
      expect(
        () => assessAffordability(
          scenario: scenario,
          market: market.copyWith(livingCosts: null),
          profile: profile,
        ),
        throwsArgumentError,
      );
    });
  });

  group('Madeira', () {
    final portugal = MarketRulePack.fromJson(
      jsonDecode(portugalPackJson) as Map<String, Object?>,
    );
    final madeira = MarketRulePack.fromJson(
      jsonDecode(madeiraPackJson) as Map<String, Object?>,
    );
    final stress = StressRule(
      id: 'stress-over-10-years',
      appliesToLoan: const LoanPredicate(
        rateType: RateType.variable,
        termYears: YearRange(min: 11),
      ),
      kind: StressKind.shock,
      rate: const Rate.ppm(15000),
      sourceId: source.id,
    );
    final ageAdjustment = IncomeAdjustment(
      id: 'income-after-70',
      whenAgeAtMaturityAbove: 70,
      reduction: const Rate.ppm(200000),
      weightedByTermShare: true,
      exceptRetired: true,
      sourceId: source.id,
    );
    final merged = resolvePackChain(madeira.id, {
      portugal.id: portugal.copyWith(
        lending: portugal.lending.copyWith(
          stress: [stress],
          incomeAdjustments: [ageAdjustment],
        ),
      ),
      madeira.id: madeira,
    });
    final rates = {
      'EUR.EURIBOR12M': ReferenceRate(
        id: 'EUR.EURIBOR12M',
        rate: const Rate.ppm(25000),
        asOf: CalendarDate.parse('2026-08-31'),
        source: source,
      ),
    };
    final scenario = Scenario(
      price: eur(35000000),
      downPayment: eur(10500000),
      termYears: 30,
      loanTypeId: 'euribor12m',
      rateSpread: const Rate.ppm(16000),
    );
    BuyerProfile stockholmBuyer({required int netMonthly, int age = 40}) =>
        BuyerProfile(
          taxResidence: CountryCode.parse('SE'),
          formerResident: false,
          use: PropertyUse.secondary,
          employment: Employment.employed,
          age: age,
          netMonthlyIncome: eur(netMonthly * 100),
          monthlyDebtPayments: eur(0),
        );
    AssessedAffordability assess(BuyerProfile profile) => assessAffordability(
      scenario: scenario,
      market: resolveForBuyer(merged, profile, referenceRates: rates),
      profile: profile,
    ) as AssessedAffordability;

    test('pays an annuity at Euribor plus spread', () {
      final result = assess(stockholmBuyer(netMonthly: 4000));

      expect(result.annualRate, const Rate.ppm(41000));
      expect(result.payment.total, eur(118384));
      expect(result.payment.interest, eur(83708));
      expect(result.paymentAfterDeduction, isNull);
      expect(result.downPaymentBounds.step, eur(200000));
    });

    test('the secondary-home cap binds a comfortable income', () {
      final result = assess(stockholmBuyer(netMonthly: 4000));

      expect(
        {for (final check in result.checks) check.ruleId: check.maxLoan},
        {'ltv-secondary': eur(28000000), 'dsti': eur(31354657)},
      );
      expect(result.binding?.kind, ConstraintKind.loanToValue);
    });

    test('DSTI at the stressed rate binds a lower income', () {
      final result = assess(stockholmBuyer(netMonthly: 3000));

      expect(result.binding?.kind, ConstraintKind.debtServiceToIncome);
      expect(result.maxLoan, eur(23516015));
      expect(result.binding?.allows(result.loan), isFalse);
    });

    test('income is reduced for years past 70 at maturity', () {
      final result = assess(stockholmBuyer(netMonthly: 4000, age: 50));

      expect(
        result.checks.singleWhere((check) => check.ruleId == 'dsti').maxLoan,
        eur(29264353),
      );
    });

    test('waits for pending lending rules', () {
      final profile = stockholmBuyer(netMonthly: 4000).copyWith(use: null);
      final result = assessAffordability(
        scenario: scenario,
        market: resolveForBuyer(merged, profile, referenceRates: rates),
        profile: profile,
      );

      expect(
        result,
        const Affordability.incomplete(
          missing: {ProfileField.use},
          unconvertedCurrencies: {},
        ),
      );
    });
  });
}
