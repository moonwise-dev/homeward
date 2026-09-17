String? amountPeriodLabel(String? period) => switch (period) {
  'monthly' => 'a month',
  'yearly' => 'a year',
  _ => null,
};
