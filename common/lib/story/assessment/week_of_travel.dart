import 'map_route.dart';

int weekOfTravel(Iterable<MapRoute> routes) =>
    routes.fold(0, (total, route) => total + 2 * route.minutes * route.perWeek);

String weekPhrase(int minutes) => switch ((minutes ~/ 60, minutes % 60)) {
  (0, final rest) => '$rest min',
  (final hours, 0) => '$hours h',
  (final hours, final rest) => '$hours h $rest min',
};

String tripsPhrase(int perWeek) =>
    perWeek == 1 ? 'once a week' : '$perWeek× a week';
