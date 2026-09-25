import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'listing_card_view.dart';

final listingCardItem = catalogItemFor(const ListingCard(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final id = data['home'] as String?;
  return BoundParsed<List<AssessedCandidate>>(
    dataContext: itemContext.dataContext,
    value: data['homes'],
    parse: (value) => jsonModelsOf(value, AssessedCandidate.fromJson),
    builder: (context, homes) {
      final home = homes?.where((home) => home.id == id).firstOrNull;
      final listing = home?.listing;
      return home == null || listing == null
          ? const WaitingForDetails()
          : ListingCardView(
              home: home,
              listing: listing,
              onChoose: data['choose'] == null
                  ? null
                  : () => dispatchAction(
                      itemContext,
                      data['choose'],
                      adding: {'candidateId': home.id},
                    ),
            );
    },
  );
});
