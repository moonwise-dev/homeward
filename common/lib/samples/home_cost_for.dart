import '../affordability/affordability_answer.dart';
import '../affordability/affordability_slice.dart';
import '../markets/resolved_market.dart';
import 'listing.dart';
import 'priced_home.dart';

HomeCost? homeCostFor(
  Listing listing, {
  required ResolvedMarket market,
  required AffordabilitySlice household,
}) {
  final profile = household.profile;
  if (profile == null) {
    return null;
  }
  return switch (answerAffordability(
    market: market,
    profile: profile,
    price: listing.price,
    downPayment: household.downPaymentStated ? household.downPayment : null,
    monthlyFee: listing.monthlyFee,
    termYears: household.termYears,
    loanTypeId: household.loanTypeId,
  )) {
    AffordabilityAnswered(:final slice) => HomeCost.of(slice),
    AffordabilityNeeds() => null,
  };
}
