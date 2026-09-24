import 'package:freezed_annotation/freezed_annotation.dart';

import '../travel_mode.dart';

part 'map_route.freezed.dart';
part 'map_route.g.dart';

@freezed
abstract class MapRoute with _$MapRoute {
  const factory MapRoute({
    required String candidateId,
    required String anchorId,
    required TravelMode mode,
    required int minutes,
    required String label,
    @Default([]) List<List<double>> path,
  }) = _MapRoute;

  factory MapRoute.fromJson(Map<String, Object?> json) =>
      _$MapRouteFromJson(json);
}
