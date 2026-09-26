import 'dart:convert';

import 'package:common/common.dart';

List<String> exampleMessages(CatalogExample example) {
  return [
    jsonEncode({
      'version': 'v0.9',
      'createSurface': {
        'surfaceId': planSurfaceId,
        'catalogId': homewardCatalogId,
        'sendDataModel': true,
      },
    }),
    jsonEncode({
      'version': 'v0.9',
      'updateComponents': {
        'surfaceId': planSurfaceId,
        'components': example.components,
      },
    }),
  ];
}
