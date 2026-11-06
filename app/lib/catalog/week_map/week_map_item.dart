import 'package:common/common.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'week_map_view.dart';

final weekMapItem = catalogItemFor(
  const WeekMap(),
  (_, _, props, _) => WeekMapView(
    places: _placesOf(props.value('markers')) ?? const [],
    week: jsonModelOf(props.value('routes'), WeekTravel.fromJson),
  ),
);

List<Place>? _placesOf(Object? value) => switch (value) {
  final Map<String, Object?> places => [
    for (final place in places.values) ?jsonModelOf(place, Place.fromJson),
  ],
  _ => null,
};
