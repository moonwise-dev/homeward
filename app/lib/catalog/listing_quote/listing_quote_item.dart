import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'listing_quote_view.dart';

final listingQuoteItem = catalogItemFor(const ListingQuote(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<ListingReading>(
    dataContext: itemContext.dataContext,
    value: data['reading'],
    parse: (value) => jsonModelOf(value, ListingReading.fromJson),
    builder: (context, reading) => reading == null
        ? const SizedBox.shrink()
        : ListingQuoteView(reading: reading),
  );
});
