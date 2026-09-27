import 'dart:convert';

import '../../markets/market_snapshot.dart';
import '../../samples/listing_inventory.dart';
import 'homes_example.dart';
import 'stockholm_example.dart';

final stockholmMarketSnapshotDataModel = {
  'markets': {
    'stockholm': jsonDecode(
      jsonEncode(
        marketSnapshot(
          city: ListingInventory(
            cityId: 'stockholm',
            name: 'Stockholm',
            marketId: 'SE',
            listings: stockholmSampleHomes,
          ),
          market: stockholmMarket,
        ).toJson(),
      ),
    ),
  },
};
