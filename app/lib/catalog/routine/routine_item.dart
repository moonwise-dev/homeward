import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'routine_view.dart';

final routineItem = catalogItemFor(const Routine(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundString(
    dataContext: dataContext,
    value: data['label'],
    builder: (context, label) => BoundParsed<List<RoutinePlace>>(
      dataContext: dataContext,
      value: data['routine'],
      parse: (value) => jsonModelsOf(value, RoutinePlace.fromJson),
      builder: (context, places) => BoundParsed<GeoPoint>(
        dataContext: dataContext,
        value: data['story'],
        parse: (value) => value is Map<String, Object?>
            ? jsonModelOf(value['center'], GeoPoint.fromJson)
            : null,
        builder: (context, center) => RoutineView(
          label: label ?? '',
          places: places ?? const [],
          center: center,
          onChanged: (places) => writeBinding(dataContext, data['routine'], [
            for (final place in places) place.toJson(),
          ]),
        ),
      ),
    ),
  );
});
