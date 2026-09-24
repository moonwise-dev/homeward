import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

List<String> homesFallback(String surfaceId, {required bool create}) {
  Map<String, String> bound(String path) => {'path': '/assessment/$path'};
  return [
    if (create)
      jsonEncode(
        CreateSurfaceMessage(
          surfaceId: surfaceId,
          catalogId: homewardCatalogId,
          sendDataModel: true,
        ).toJson(),
      ),
    jsonEncode(
      UpdateComponentsMessage(
        surfaceId: surfaceId,
        components: [
          {
            'id': 'root',
            'component': 'Column',
            'children': ['map', 'homes', 'table'],
          },
          {
            'id': 'map',
            'component': 'LifestyleCommuteMap',
            'markers': bound('markers'),
            'routes': bound('routes'),
          },
          {
            'id': 'homes',
            'component': 'DynamicRecommendationStack',
            'homes': bound('candidates'),
            'choose': {
              'event': {
                'name': SurfaceAction.chooseHome.wireName,
                'context': <String, Object?>{},
              },
            },
          },
          {
            'id': 'table',
            'component': 'ComparisonTable',
            'rows': bound('rows'),
            'homes': bound('candidates'),
          },
        ],
      ).toJson(),
    ),
  ];
}
