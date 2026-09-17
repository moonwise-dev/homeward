import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

List<Map<String, Object?>> retrySurface(int turn) {
  final surfaceId = InlineSurfaces.id(turn, 'retry');
  return [
    CreateSurfaceMessage(
      surfaceId: surfaceId,
      catalogId: homewardCatalogId,
      sendDataModel: true,
    ).toJson(),
    UpdateComponentsMessage(
      surfaceId: surfaceId,
      components: [
        {
          'id': 'root',
          'component': 'Text',
          'text':
              'I could not draw this step. Send your message again and I '
              'will try once more.',
        },
      ],
    ).toJson(),
  ];
}
