import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';

MessageProcessor<ComponentApi> replayShadow(
  List<Map<String, Object?>> messages,
) => MessageProcessor<ComponentApi>(
  catalogs: [Catalog(id: homewardCatalogId, components: const [])],
)..processMessages([for (final json in messages) A2uiMessage.fromJson(json)]);
