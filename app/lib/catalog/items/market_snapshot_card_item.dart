import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../views/market_snapshot_card_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final marketSnapshotCardItem = catalogItemFor(const MarketSnapshotCard(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundParsed<MarketSnapshot>(
    dataContext: dataContext,
    value: data['market'],
    parse: marketSnapshotOf,
    builder: (context, snapshot) => BoundParsed<ResolvedMarket>(
      dataContext: dataContext,
      value: data['market'],
      parse: (value) => jsonModelOf(value, ResolvedMarket.fromJson),
      builder: (context, market) => BoundParsed<List<String>>(
        dataContext: dataContext,
        value: {'path': selectionSlice.pathOf('candidates')},
        parse: _curatedMarkets,
        builder: (context, curatedMarkets) => snapshot == null
            ? const WaitingForDetails()
            : MarketSnapshotCardView(
                snapshot: snapshot,
                market: market,
                curatedMarkets: curatedMarkets ?? const [],
                onExplain: data['explain'] == null
                    ? null
                    : () => dispatchAction(itemContext, data['explain']),
              ),
      ),
    ),
  );
});

List<String> _curatedMarkets(Object? candidates) => [
  if (candidates case final List<Object?> list)
    for (final candidate in list)
      if (candidate case {
        'name': final String name,
        'coverage': final String coverage,
      })
        if (coverage == Coverage.curated.name) name,
];
