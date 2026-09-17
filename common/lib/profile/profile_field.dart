enum ProfileField {
  citizenship(['citizenship']),
  residency(['taxResidence']),
  formerResident(['formerResident']),
  residencyIntent(['residencyIntent']),
  use(['use']),
  firstTime(['firstTime']),
  employment(['employment']),
  netMonthlyIncome(['netMonthlyIncome']),
  grossMonthlyIncome(['grossMonthlyIncome']),
  incomeCurrency(['netMonthlyIncome']),
  savings(['savings']),
  monthlyDebtPayments(['monthlyDebtPayments']),
  age(['age']),
  household(['adults', 'childAges']),
  borrowers(['borrowers']);

  const ProfileField(this.profileKeys);

  final List<String> profileKeys;
}
