import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import '../sample_prices.dart';
import 'trade_off_view.dart';

final tradeOffItem = catalogItemFor(const TradeOff(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<List<AreaOption>>(
    dataContext: itemContext.dataContext,
    value: data['options'],
    parse: (value) => jsonModelsOf(value, AreaOption.fromJson),
    builder: (context, options) => options == null || options.isEmpty
        ? const WaitingForDetails()
        : TradeOffView(
            options: options,
            onPick: (option) => dispatchAction(
              itemContext,
              data['pick'],
              adding: {
                'facet': CaseFacet.area.name,
                'value': option.id,
                'label':
                    '${homeLine(option.homeType, option.rooms, option.sizeM2)} '
                    'in ${option.areaName}',
              },
            ),
          ),
  );
});
