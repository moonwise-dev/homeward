import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'week_map_view.dart';

final weekMapItem = catalogItemFor(const WeekMap(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundParsed<List<Place>>(
    dataContext: dataContext,
    value: data['markers'],
    parse: _placesOf,
    builder: (context, places) => BoundParsed<WeekTravel>(
      dataContext: dataContext,
      value: data['routes'],
      parse: (value) => jsonModelOf(value, WeekTravel.fromJson),
      builder: (context, week) =>
          WeekMapView(places: places ?? const [], week: week),
    ),
  );
});

List<Place>? _placesOf(Object? value) => switch (value) {
  final Map<String, Object?> places => [
    for (final place in places.values) ?jsonModelOf(place, Place.fromJson),
  ],
  _ => null,
};
