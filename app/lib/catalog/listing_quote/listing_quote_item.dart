import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'listing_quote_view.dart';

final listingQuoteItem = catalogItemFor(const ListingQuote(), (_, _, props, _) {
  final reading = jsonModelOf(props.value('reading'), ListingReading.fromJson);
  return reading == null
      ? const SizedBox.shrink()
      : ListingQuoteView(reading: reading);
});
