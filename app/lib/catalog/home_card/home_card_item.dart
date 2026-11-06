import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'home_card_view.dart';

final homeCardItem = catalogItemFor(const HomeCard(), (_, node, props, _) {
  final home = jsonModelOf(props.value('home'), PricedHome.fromJson);
  if (home == null) {
    return const SizedBox.shrink();
  }
  return HomeCardView(
    home: home,
    onChoose: props.action('choose') == null
        ? null
        : () => dispatchAction(
            node,
            'choose',
            adding: {
              'home': home.listing.id,
              'label': home.rent == null
                  ? 'Work out ${home.listing.address}'
                  : 'Split the rent of ${home.listing.address}',
            },
          ),
    onKeep: props.action('keep') == null
        ? null
        : (keep) => dispatchAction(
            node,
            'keep',
            adding: {
              'home': home.listing.id,
              'keep': keep,
              'label': '${keep ? 'Keep' : 'Drop'} ${home.listing.address}',
            },
          ),
  );
});
