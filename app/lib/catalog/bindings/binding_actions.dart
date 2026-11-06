import 'package:a2ui_core/a2ui_core.dart';
import 'package:a2ui_flutter/a2ui_flutter.dart';

Future<void> dispatchAction(
  ComponentNode<ComponentImplementation> node,
  String property, {
  Map<String, Object?> adding = const {},
}) async {
  final context = node.context;
  if (context?.componentModel.properties[property] case {
    'event': {'name': final String name} && final Map<String, Object?> event,
  }) {
    await context!.dispatchAction({
      'event': {
        'name': name,
        'context': {
          if (event['context'] case final Map<String, Object?> given)
            for (final MapEntry(:key, :value) in given.entries)
              key: context.dataContext.resolveDynamicValue(value),
          ...adding,
        },
      },
    });
  }
}
