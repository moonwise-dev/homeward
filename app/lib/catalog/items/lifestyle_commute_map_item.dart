import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../views/lifestyle_commute_map_view.dart';
import 'catalog_item_for.dart';

final lifestyleCommuteMapItem = catalogItemFor(const LifestyleCommuteMap(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundParsed<List<MapMarker>>(
    dataContext: dataContext,
    value: data['markers'],
    parse: (value) => jsonModelsOf(value, MapMarker.fromJson),
    builder: (context, markers) => BoundParsed<List<MapRoute>>(
      dataContext: dataContext,
      value: data['routes'],
      parse: (value) => jsonModelsOf(value, MapRoute.fromJson),
      builder: (context, routes) => LifestyleCommuteMapView(
        markers: markers ?? const [],
        routes: routes ?? const [],
        focus: data['focus'] as String?,
      ),
    ),
  );
});
