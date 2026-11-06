import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

MessageProcessor<ComponentApi> replayShadow(
  List<Map<String, Object?>> messages,
) =>
    MessageProcessor<ComponentApi>(
      catalogs: [shadowCatalog],
    )..processMessages([
      for (final json in messages) AgentToRendererMessage.fromJson(json),
    ]);

final shadowCatalog = Catalog<ComponentApi, FunctionImplementation>(
  id: homewardCatalogId,
  components: const [],
  protocolVersion: A2uiProtocolVersion.v1_0,
);
