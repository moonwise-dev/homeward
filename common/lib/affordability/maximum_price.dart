import '../costs/purchase_costs.dart';
import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../plan/scenario.dart';
import '../profile/buyer_profile.dart';
import 'affordability.dart';
import 'assess_affordability.dart';
import 'largest_loan.dart';

const maximumPriceReach = 50;

typedef _Search = ({
  Scenario scenario,
  ResolvedMarket market,
  BuyerProfile profile,
  Money? price,
});

_Search? _lastSearch;

Money? maximumPrice({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final atAnyDownPayment = scenario.copyWith(
    downPayment: Money.zero(market.currency),
  );
  if (_lastSearch case final last?
      when last.scenario == atAnyDownPayment &&
          last.market == market &&
          last.profile == profile) {
    return last.price;
  }
  final price = _highestPrice(
    scenario: atAnyDownPayment,
    market: market,
    profile: profile,
  );
  _lastSearch = (
    scenario: atAnyDownPayment,
    market: market,
    profile: profile,
    price: price,
  );
  return price;
}

Money? _highestPrice({
  required Scenario scenario,
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final savings = market.converted(profile.savings);
  if (savings == null || savings.currency != market.currency) {
    return null;
  }
  final zero = Money.zero(market.currency);

  Money? cashNeededAt(Money price) {
    if (price.isZero) {
      return zero;
    }
    final probe = scenario.copyWith(price: price, downPayment: zero);
    if (assessAffordability(
          scenario: probe,
          market: market,
          profile: profile,
        )
        case AssessedAffordability(:final maxLoan)) {
      return switch (estimatePurchaseCosts(
        scenario: probe.copyWith(downPayment: price - maxLoan),
        market: market,
      )) {
        EstimatedPurchaseCosts(:final cashNeeded) => cashNeeded,
        IncompletePurchaseCosts() => null,
      };
    }
    return null;
  }

  if (cashNeededAt(scenario.price) == null) {
    return null;
  }
  return largestLoanWhere(
    upper: savings * maximumPriceReach,
    allows: (price) => switch (cashNeededAt(price)) {
      final cash? => cash <= savings,
      null => false,
    },
  );
}
