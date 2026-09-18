import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../views/foreign_buyer_obstacles_view.dart';
import 'catalog_item_for.dart';
import 'waiting_for_details.dart';

final foreignBuyerObstaclesItem = catalogItemFor(
  const ForeignBuyerObstacles(),
  (itemContext) {
    final data = itemContext.data as JsonMap;
    return BoundParsed<ResolvedMarket>(
      dataContext: itemContext.dataContext,
      value: data['market'],
      parse: (value) => jsonModelOf(value, ResolvedMarket.fromJson),
      builder: (context, market) => market == null
          ? const WaitingForDetails()
          : ForeignBuyerObstaclesView(
              obstacles: market.obstacles,
              refundable: [
                for (final rule in market.purchaseCosts)
                  if (rule.refund != null &&
                      market.refundBaselines.containsKey(rule.id))
                    rule,
              ],
              onExplain: data['explain'] == null
                  ? null
                  : () => dispatchAction(itemContext, data['explain']),
            ),
    );
  },
);
