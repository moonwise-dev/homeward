import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final euro = Currency.parse('EUR');
  Money amount(int units) => Money(minorUnits: units * 100, currency: euro);

  Eligibility check(Scenario scenario, {BuyerProfile? profile}) =>
      eligibilityFor(
        scenario: scenario,
        market: funchalMarket,
        profile: profile ?? funchalProfile,
      );

  EligibilityItem itemFor(Eligibility eligibility, String ruleId) =>
      eligibility.items.firstWhere((item) => item.ruleId == ruleId);

  test('the hero scenario passes every rule', () {
    final eligibility = check(funchalScenario);

    expect(eligibility.passes, isTrue);
    expect(eligibility.missing, isEmpty);
    expect(eligibility.items.map((item) => item.ruleId), [
      'ltv-secondary-home',
      'ltv-nonresident-lender-norm',
      'dsti-45',
      'term-35-years-over-35',
    ]);
  });

  test('a lender norm only warns, the law fails', () {
    final eligibility = check(
      funchalScenario.copyWith(downPayment: amount(35000)),
    );

    expect(
      itemFor(eligibility, 'ltv-nonresident-lender-norm').status,
      EligibilityStatus.warn,
    );
    expect(
      itemFor(eligibility, 'ltv-secondary-home').status,
      EligibilityStatus.fail,
    );
    expect(eligibility.passes, isFalse);
  });

  test('a broken rule says the down payment that would settle it', () {
    final eligibility = check(
      funchalScenario.copyWith(downPayment: amount(35000)),
    );

    expect(
      itemFor(eligibility, 'ltv-nonresident-lender-norm'),
      isA<LoanEligibility>()
          .having((item) => item.maxLoan, 'maxLoan', amount(245000))
          .having(
            (item) => item.leastDownPayment,
            'leastDownPayment',
            amount(105000),
          ),
    );
  });

  test('a term past the buyer\'s age limit fails', () {
    final eligibility = check(funchalScenario.copyWith(termYears: 36));

    expect(
      itemFor(eligibility, 'term-35-years-over-35'),
      isA<TermEligibility>()
          .having((item) => item.status, 'status', EligibilityStatus.fail)
          .having((item) => item.allowedYears, 'allowedYears', 35)
          .having((item) => item.limit, 'limit', TermLimit.marketMaximum),
    );
  });

  test(
    'facts the rules still need are named, and the term is still checked',
    () {
      final eligibility = check(
        funchalScenario,
        profile: funchalProfile.copyWith(netMonthlyIncome: null),
      );

      expect(eligibility.missing, {ProfileField.netMonthlyIncome});
      expect(eligibility.items.map((item) => item.ruleId), [
        'term-35-years-over-35',
      ]);
      expect(eligibility.passes, isFalse);
    },
  );
}
