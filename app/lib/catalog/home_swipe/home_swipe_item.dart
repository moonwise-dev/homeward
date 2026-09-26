import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'home_swipe_view.dart';

final homeSwipeItem = catalogItemFor(const HomeSwipe(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<List<Listing>>(
    dataContext: itemContext.dataContext,
    value: data['homes'],
    parse: (value) => jsonModelsOf(value, Listing.fromJson),
    builder: (context, homes) => homes == null || homes.isEmpty
        ? const WaitingForDetails()
        : HomeSwipeView(
            homes: homes,
            onDone: (verdict) => dispatchAction(
              itemContext,
              data['answer'],
              adding: {
                'facet': CaseFacet.swipe.name,
                'value': verdict.kept.join(','),
                'label': verdict.kept.isEmpty
                    ? 'Passed on all ${homes.length}'
                    : 'Kept ${verdict.kept.length} of ${homes.length}',
                'kept': verdict.kept,
                'passed': verdict.passed,
              },
            ),
          ),
  );
});
