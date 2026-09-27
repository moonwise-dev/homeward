import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'home_card_view.dart';

final homeCardItem = catalogItemFor(const HomeCard(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<PricedHome>(
    dataContext: itemContext.dataContext,
    value: data['home'],
    parse: (value) => jsonModelOf(value, PricedHome.fromJson),
    builder: (context, home) => home == null
        ? const SizedBox.shrink()
        : HomeCardView(
            home: home,
            onChoose: data['choose'] == null
                ? null
                : () => dispatchAction(
                    itemContext,
                    data['choose'],
                    adding: {
                      'home': home.listing.id,
                      'label': 'Work out ${home.listing.address}',
                    },
                  ),
            onKeep: data['keep'] == null
                ? null
                : (keep) => dispatchAction(
                    itemContext,
                    data['keep'],
                    adding: {
                      'home': home.listing.id,
                      'keep': keep,
                      'label':
                          '${keep ? 'Keep' : 'Drop'} ${home.listing.address}',
                    },
                  ),
          ),
  );
});
