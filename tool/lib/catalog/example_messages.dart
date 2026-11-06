import 'dart:convert';

import 'package:common/common.dart';

List<String> exampleMessages(CatalogExample example) {
  return [
    jsonEncode({
      'version': A2uiExtension.version,
      'createSurface': {
        'surfaceId': planSurfaceId,
        'catalogId': homewardCatalogId,
        'sendDataModel': true,
      },
    }),
    jsonEncode({
      'version': A2uiExtension.version,
      'updateComponents': {
        'surfaceId': planSurfaceId,
        'components': example.components,
      },
    }),
  ];
}
