import 'package:genui/genui.dart';

Future<void> dispatchAction(
  CatalogItemContext itemContext,
  Object? action, {
  Map<String, Object?> adding = const {},
}) async {
  if (action case {
    'event': {'name': final String name} && final Map<String, Object?> event,
  }) {
    itemContext.dispatchEvent(
      UserActionEvent(
        name: name,
        sourceComponentId: itemContext.id,
        context: {
          ...await resolveContext(
            itemContext.dataContext,
            event['context'] as JsonMap?,
          ),
          ...adding,
        },
      ),
    );
  }
}
