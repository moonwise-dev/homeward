import 'dart:convert';

import 'package:common/common.dart';

const exampleTurn = 2;

String exampleSurfaceId(CatalogExample example) => InlineSurfaces.id(
  exampleTurn,
  example.name.toLowerCase().replaceAll(RegExp('[^a-z0-9]+'), '-'),
);

List<String> exampleMessages(CatalogExample example) {
  final surfaceId = exampleSurfaceId(example);
  return [
    jsonEncode({
      'version': 'v0.9',
      'createSurface': {
        'surfaceId': surfaceId,
        'catalogId': homewardCatalogId,
        'sendDataModel': true,
      },
    }),
    jsonEncode({
      'version': 'v0.9',
      'updateComponents': {
        'surfaceId': surfaceId,
        'components': example.components,
      },
    }),
  ];
}
