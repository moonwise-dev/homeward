import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'home_comparison_view.dart';

final homeComparisonItem = catalogItemFor(const HomeComparison(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final choose = data['choose'];
  return _BoundHomes(
    itemContext: itemContext,
    bindings: data['homes'] as List<Object?>? ?? const [],
    builder: (homes) => homes.length < 2
        ? const SizedBox.shrink()
        : HomeComparisonView(
            homes: homes,
            onChoose: choose == null
                ? null
                : (home) => dispatchAction(
                    itemContext,
                    choose,
                    adding: {
                      'home': home.listing.id,
                      'label': 'Work out ${home.listing.address}',
                    },
                  ),
          ),
  );
});

class _BoundHomes extends StatelessWidget {
  const _BoundHomes({
    required this.itemContext,
    required this.bindings,
    required this.builder,
    this.found = const [],
  });

  final CatalogItemContext itemContext;
  final List<Object?> bindings;
  final List<PricedHome> found;
  final Widget Function(List<PricedHome> homes) builder;

  @override
  Widget build(BuildContext context) => bindings.isEmpty
      ? builder(found)
      : BoundParsed<PricedHome>(
          dataContext: itemContext.dataContext,
          value: bindings.first,
          parse: (value) => jsonModelOf(value, PricedHome.fromJson),
          builder: (context, home) => _BoundHomes(
            itemContext: itemContext,
            bindings: bindings.skip(1).toList(),
            found: [...found, ?home],
            builder: builder,
          ),
        );
}
