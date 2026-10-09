const planSectionHeadings = {
  'PlanOverview': 'Your plan',
  'Brief': 'What Homeward knows',
  'AffordabilitySummary': 'What you can borrow',
  'MonthlyCostBreakdown': 'What a month costs',
  'MortgageOptions': 'Your rate options',
  'StressTestChart': 'If rates rise',
  'PurchaseCostsTable': 'Costs on the day',
  'BuyVsRent': 'Buying against renting',
  'DownPaymentSlider': 'Try a down payment',
  'LoanBalanceChart': 'Your loan year by year',
  'SavingsPlan': 'Saving for it',
  'RentSplit': 'Splitting the rent',
  'Shortlist': 'Your shortlist',
  'HomeComparison': 'Side by side',
  'HomeCard': 'Homes',
  'HouseholdSummary': 'Your household',
  'ListingQuote': 'What the listing says',
  'MarketSnapshotCard': 'The city at a glance',
  'WeekMap': 'Your week on the map',
  'WeeklyTravel': 'Your week of travel',
  'RouteSummary': 'A route',
  'RuleNote': 'The lending rule',
};

final _wordStart = RegExp('(?<=[a-z])[A-Z]');

String planSectionLabel(String type) =>
    planSectionHeadings[type] ??
    type.replaceAllMapped(
      _wordStart,
      (match) => ' ${match[0]!.toLowerCase()}',
    );
