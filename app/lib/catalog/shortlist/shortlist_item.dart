import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'shortlist_view.dart';

final shortlistItem = catalogItemFor(const Shortlist(), (itemContext) {
  final data = itemContext.data as JsonMap;
  ValueChanged<PricedHome>? send(Object? action, String verb) => action == null
      ? null
      : (home) => dispatchAction(
          itemContext,
          action,
          adding: {
            'home': home.listing.id,
            'label': '$verb ${home.listing.address}',
          },
        );

  return BoundParsed<List<PricedHome>>(
    dataContext: itemContext.dataContext,
    value: data['homes'],
    parse: (value) => value is Map<String, Object?>
        ? [
            for (final json in value.values)
              ?jsonModelOf(json, PricedHome.fromJson),
          ]
        : null,
    builder: (context, homes) => homes == null
        ? const SizedBox.shrink()
        : ShortlistView(
            homes: homes,
            onChoose: send(data['choose'], 'Work out'),
            onDrop: send(data['drop'], 'Drop'),
          ),
  );
});
