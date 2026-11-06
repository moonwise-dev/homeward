import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'shortlist_view.dart';

final shortlistItem = catalogItemFor(const Shortlist(), (_, node, props, _) {
  final homes = switch (props.value('homes')) {
    final Map<String, Object?> homes => [
      for (final json in homes.values) ?jsonModelOf(json, PricedHome.fromJson),
    ],
    _ => null,
  };
  if (homes == null) {
    return const SizedBox.shrink();
  }
  ValueChanged<PricedHome>? send(
    String action,
    String Function(PricedHome home) verb,
  ) => props.action(action) == null
      ? null
      : (home) => dispatchAction(
          node,
          action,
          adding: {
            'home': home.listing.id,
            'label': '${verb(home)} ${home.listing.address}',
          },
        );
  return ShortlistView(
    homes: homes,
    onChoose: send(
      'choose',
      (home) => home.rent == null ? 'Work out' : 'Split the rent of',
    ),
    onDrop: send('drop', (_) => 'Drop'),
  );
});
