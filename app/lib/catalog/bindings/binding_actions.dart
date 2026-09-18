import 'dart:convert';

import 'package:genui/genui.dart';

import '../../data/repository/wire_log.dart';

void writeBinding(DataContext dataContext, Object? binding, Object? json) {
  if (binding case {'path': final String path}) {
    dataContext.update(DataPath(path), jsonDecode(jsonEncode(json)));
    wireLogInstance.recomputed('Recomputed on the device', detail: path);
  }
}

Future<void> dispatchAction(
  CatalogItemContext itemContext,
  Object? action,
) async {
  if (action case {
    'event': {'name': final String name} && final Map<String, Object?> event,
  }) {
    itemContext.dispatchEvent(
      UserActionEvent(
        name: name,
        sourceComponentId: itemContext.id,
        context: await resolveContext(
          itemContext.dataContext,
          event['context'] as JsonMap?,
        ),
      ),
    );
  }
}
