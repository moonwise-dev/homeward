import '../markets/resolved_market.dart';
import '../money/money.dart';
import '../profile/buyer_profile.dart';
import 'monthly_ceiling.dart';

enum FigureDoubt {
  takeHomeBelowEverydayCosts,
  payBelowEverydayCosts,
  takeHomeAbovePay,
}

const assumedAdultAge = 35;

typedef DoubtedFigure = ({FigureDoubt doubt, bool tenfoldWouldPass});

List<DoubtedFigure> figureDoubts({
  required ResolvedMarket market,
  required BuyerProfile profile,
}) {
  final buyer = market.inMarketCurrency(profile);
  final net = _inMarket(buyer.netMonthlyIncome, market);
  final gross = _inMarket(buyer.grossMonthlyIncome, market);
  final costs = _everydayCosts(market, buyer);
  return [
    if (net != null && gross != null && net > gross)
      (doubt: FigureDoubt.takeHomeAbovePay, tenfoldWouldPass: false),
    if (net != null && costs != null && net <= costs)
      (
        doubt: FigureDoubt.takeHomeBelowEverydayCosts,
        tenfoldWouldPass: net * 10 > costs,
      ),
    if (gross != null && costs != null && gross <= costs)
      (
        doubt: FigureDoubt.payBelowEverydayCosts,
        tenfoldWouldPass: gross * 10 > costs,
      ),
  ];
}

Money? _inMarket(Money? amount, ResolvedMarket market) =>
    amount?.currency == market.currency ? amount : null;

Money? _everydayCosts(ResolvedMarket market, BuyerProfile buyer) {
  final rule = market.lending.leftToLiveOn.firstOrNull;
  final livingCosts = market.livingCosts;
  final adults = buyer.adults ?? 1;
  if (rule == null || livingCosts == null || adults < 1) {
    return null;
  }
  try {
    return everydayCosts(
          rule: rule,
          livingCosts: livingCosts,
          adultAge: buyer.age ?? assumedAdultAge,
          adults: adults,
          childAges: buyer.childAges ?? const [],
        ) +
        (_inMarket(buyer.monthlyDebtPayments, market) ??
            Money.zero(market.currency));
  } on ArgumentError {
    return null;
  }
}
