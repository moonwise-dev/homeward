import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'hunch_view.dart';

final hunchItem = catalogItemFor(const Hunch(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final facet = data['facet'] as String? ?? '';
  final options = <HunchOption>[
    for (final option in data['options'] as List<Object?>? ?? const [])
      if (option case {'label': final String label})
        (
          label: label,
          value: '${option['value'] ?? ''}',
          pin: option['pin'] == true,
        ),
  ];
  return BoundParsed<GeoPoint>(
    dataContext: itemContext.dataContext,
    value: data['story'],
    parse: (value) => value is Map<String, Object?>
        ? jsonModelOf(value['center'], GeoPoint.fromJson)
        : null,
    builder: (context, center) => HunchView(
      hunch: data['hunch'] as String? ?? '',
      because: data['because'] as String?,
      options: options,
      center: center,
      onAnswer: (option, pin) => dispatchAction(
        itemContext,
        data['answer'],
        adding: {
          'facet': facet,
          'value': option.value,
          'label': option.label,
          if (pin != null) 'pin': {'lat': pin.lat, 'lng': pin.lng},
        },
      ),
    ),
  );
});
