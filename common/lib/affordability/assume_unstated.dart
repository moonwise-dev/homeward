import 'dart:math';

import '../markets/market_rule_pack.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../profile/buyer_profile.dart';
import '../profile/employment.dart';
import '../profile/profile_assumption.dart';
import '../profile/profile_field.dart';
import '../profile/property_use.dart';
import 'figure_doubts.dart';

typedef AssumedProfile = ({
  BuyerProfile profile,
  Set<ProfileAssumption> assumed,
});

AssumedProfile assumeUnstated({
  required BuyerProfile profile,
  required MarketRulePack pack,
  int incomes = 0,
}) {
  final uses = {
    for (final requirement in pack.profileFields) requirement.field,
  };
  final household = uses.contains(ProfileField.household);
  final adults = profile.adults ?? (household ? max(1, incomes) : null);
  final assumed = {
    if (household && profile.adults == null) ProfileAssumption.adults,
    if (household && profile.childAges == null) ProfileAssumption.children,
    if (uses.contains(ProfileField.age) && profile.age == null)
      ProfileAssumption.age,
    if (uses.contains(ProfileField.monthlyDebtPayments) &&
        profile.monthlyDebtPayments == null)
      ProfileAssumption.debts,
    if (uses.contains(ProfileField.residency) && profile.taxResidence == null)
      ProfileAssumption.residency,
    if (uses.contains(ProfileField.use) && profile.use == null)
      ProfileAssumption.use,
    if (uses.contains(ProfileField.employment) && profile.employment == null)
      ProfileAssumption.employment,
  };
  return (
    profile: profile.copyWith(
      adults: adults,
      childAges: assumed.contains(ProfileAssumption.children)
          ? const []
          : profile.childAges,
      borrowers: profile.borrowers ?? adults,
      age: assumed.contains(ProfileAssumption.age)
          ? assumedAdultAge
          : profile.age,
      monthlyDebtPayments: assumed.contains(ProfileAssumption.debts)
          ? Money.zero(pack.currency!)
          : profile.monthlyDebtPayments,
      taxResidence: assumed.contains(ProfileAssumption.residency)
          ? pack.id.countryCode
          : profile.taxResidence,
      use: assumed.contains(ProfileAssumption.use)
          ? PropertyUse.primary
          : profile.use,
      employment: assumed.contains(ProfileAssumption.employment)
          ? Employment.employed
          : profile.employment,
    ),
    assumed: assumed,
  );
}

Money? estimatedTakeHome(ResolvedMarket market, Iterable<Money> payBeforeTax) {
  final table = market.incomeTax;
  if (table == null || payBeforeTax.isEmpty) {
    return null;
  }
  var total = Money.zero(market.currency);
  for (final pay in payBeforeTax) {
    final converted = market.converted(pay);
    if (converted == null || converted.currency != market.currency) {
      return null;
    }
    total += table.takeHome(converted);
  }
  return total;
}
