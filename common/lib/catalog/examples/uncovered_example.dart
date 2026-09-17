import 'dart:convert';

import '../../markets/coverage.dart';
import '../../markets/market_id.dart';
import '../../markets/market_snapshot.dart';

final uncoveredDataModel = jsonDecode(
  jsonEncode({
    'market': MarketSnapshot(
      id: MarketId.parse('AE'),
      name: 'United Arab Emirates',
      coverage: Coverage.uncovered,
    ).toJson(),
    'profile': const <String, Object?>{},
    'selection': {
      'candidates': [
        {'marketId': 'SE', 'name': 'Sweden', 'coverage': 'curated'},
      ],
    },
  }),
) as Map<String, Object?>;
