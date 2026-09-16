import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final madeira = MarketId.parse('PT-30');
  final sweden = CountryCode.parse('SE');
  final portugal = CountryCode.parse('PT');
  final unitedStates = CountryCode.parse('US');

  final cases = <(String, BuyerPredicate?, BuyerProfile, Applicability)>[
    (
      'no predicate',
      null,
      const BuyerProfile(),
      const Applicability.applies(),
    ),
    (
      'a Stockholm resident is non-resident in Madeira',
      const BuyerPredicate(residency: Residency.nonResident),
      BuyerProfile(taxResidence: sweden),
      const Applicability.applies(),
    ),
    (
      'a Portuguese resident is resident in Madeira',
      const BuyerPredicate(residency: Residency.nonResident),
      BuyerProfile(taxResidence: portugal),
      const Applicability.doesNotApply(),
    ),
    (
      'an unknown tax residence is pending',
      const BuyerPredicate(residency: Residency.nonResident),
      const BuyerProfile(),
      const Applicability.pending({ProfileField.residency}),
    ),
    (
      'every unknown fact is listed',
      const BuyerPredicate(
        residency: Residency.nonResident,
        formerResident: false,
      ),
      const BuyerProfile(),
      const Applicability.pending({
        ProfileField.residency,
        ProfileField.formerResident,
      }),
    ),
    (
      'a known mismatch wins over unknown facts',
      const BuyerPredicate(
        residency: Residency.resident,
        use: PropertyUse.primary,
      ),
      BuyerProfile(taxResidence: sweden),
      const Applicability.doesNotApply(),
    ),
    (
      'known facts leave only the unknown ones pending',
      const BuyerPredicate(
        residency: Residency.nonResident,
        formerResident: false,
      ),
      BuyerProfile(taxResidence: sweden),
      const Applicability.pending({ProfileField.formerResident}),
    ),
    (
      'an EEA citizen is regional in an EEA market',
      const BuyerPredicate(citizenship: Citizenship.regional),
      BuyerProfile(citizenship: sweden),
      const Applicability.applies(),
    ),
    (
      'a US citizen is foreign in an EEA market',
      const BuyerPredicate(citizenship: Citizenship.foreign),
      BuyerProfile(citizenship: unitedStates),
      const Applicability.applies(),
    ),
    (
      'a Portuguese citizen is domestic',
      const BuyerPredicate(citizenship: Citizenship.domestic),
      BuyerProfile(citizenship: portugal),
      const Applicability.applies(),
    ),
    (
      'an age inside the range applies',
      const BuyerPredicate(age: YearRange(max: 35)),
      const BuyerProfile(age: 35),
      const Applicability.applies(),
    ),
    (
      'an age outside the range does not',
      const BuyerPredicate(age: YearRange(max: 35)),
      const BuyerProfile(age: 36),
      const Applicability.doesNotApply(),
    ),
    (
      'an unknown age is pending',
      const BuyerPredicate(age: YearRange(min: 18)),
      const BuyerProfile(),
      const Applicability.pending({ProfileField.age}),
    ),
    (
      'enum and boolean facts compare directly',
      const BuyerPredicate(
        residencyIntent: ResidencyIntent.becomeResident,
        employment: Employment.selfEmployed,
        firstTime: true,
      ),
      const BuyerProfile(
        residencyIntent: ResidencyIntent.becomeResident,
        employment: Employment.selfEmployed,
        firstTime: true,
      ),
      const Applicability.applies(),
    ),
  ];

  for (final (name, predicate, profile, expected) in cases) {
    test(name, () {
      expect(
        applicabilityOf(predicate, profile: profile, market: madeira),
        expected,
      );
    });
  }

  group('matchesLoan', () {
    const predicate = LoanPredicate(
      rateType: RateType.variable,
      termYears: YearRange(min: 11),
    );

    test('matches rate type and term', () {
      expect(
        matchesLoan(predicate, rateType: RateType.variable, termYears: 30),
        isTrue,
      );
      expect(
        matchesLoan(predicate, rateType: RateType.fixed, termYears: 30),
        isFalse,
      );
      expect(
        matchesLoan(predicate, rateType: RateType.variable, termYears: 10),
        isFalse,
      );
      expect(
        matchesLoan(null, rateType: RateType.fixed, termYears: 1),
        isTrue,
      );
    });
  });
}
