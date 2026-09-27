import '../money/money.dart';
import 'resolved_market.dart';

Money? totalInMarket(ResolvedMarket market, Iterable<Money> amounts) {
  var total = Money.zero(market.currency);
  for (final amount in amounts) {
    final converted = market.converted(amount);
    if (converted == null || converted.currency != market.currency) {
      return null;
    }
    total += converted;
  }
  return total;
}
