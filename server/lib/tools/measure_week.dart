import 'dart:convert';

import 'package:common/common.dart';

import '../markets/market_directory.dart';
import '../research/open_data/open_data_unavailable.dart';
import '../research/open_data/travel_route.dart';
import '../research/research.dart';
import 'agent_tool.dart';
import 'tool_context.dart';

final class MeasureWeek extends AgentTool {
  const MeasureWeek(this.markets, this.research);

  final MarketDirectory markets;
  final Research research;

  static const maxTrips = 6;
  static const maxPerWeek = 14;

  @override
  String get name => 'measure_week';

  @override
  String get description =>
      "Measures the buyer's week from one starting point, a sample home ID "
      'from /homes or a place ID from /places: each trip to a place from '
      '/places, how many times a week they go there and back, and how they '
      'travel, by open routing. It seeds /week/<from> for WeeklyTravel and '
      'RouteSummary and answers with the minutes of each trip and the '
      "week's total.";

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'from': {'type': 'string'},
      'trips': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            'place': {'type': 'string'},
            'perWeek': {
              'type': 'integer',
              'description': 'Times a week there and back, 1 to $maxPerWeek.',
            },
            'mode': {
              'type': 'string',
              'enum': [for (final mode in TravelMode.values) mode.name],
            },
          },
          'required': ['place', 'perWeek', 'mode'],
        },
      },
    },
    'required': ['from', 'trips'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final places = switch (context.slices[placesSlice.name]) {
      final Map<String, Object?> places => {
        for (final MapEntry(:key, :value) in places.entries)
          if (value is Map<String, Object?>) key: Place.fromJson(value),
      },
      _ => const <String, Place>{},
    };
    final fromId = '${arguments['from']}';
    final start = switch (markets.home(fromId)) {
      (city: _, :final listing) => (
        name: listing.addressLine,
        point: listing.point,
      ),
      null => switch (places[fromId]) {
        final place? => (name: place.name, point: place.point),
        null => null,
      },
    };
    if (start == null) {
      return _error(
        '$fromId is neither a sample home nor a place; take a home ID from '
        'search_homes or a place ID from find_place.',
      );
    }
    final wanted = [
      for (final trip in arguments['trips'] as List<Object?>? ?? const [])
        if (trip case {
          'place': final String place,
          'perWeek': final int perWeek,
          'mode': final String mode,
        })
          (place: place, perWeek: perWeek, mode: mode),
    ];
    final problems = [
      if (wanted.isEmpty) 'Pass at least one trip.',
      if (wanted.length > maxTrips) 'At most $maxTrips trips.',
      for (final trip in wanted) ...[
        if (!places.containsKey(trip.place))
          '${trip.place} is not in /places; find it with find_place first.',
        if (trip.perWeek < 1 || trip.perWeek > maxPerWeek)
          '${trip.place}: perWeek is 1 to $maxPerWeek.',
        if (!TravelMode.values.any((mode) => mode.name == trip.mode))
          '${trip.place}: mode is one of '
              '${TravelMode.values.map((mode) => mode.name).join(', ')}.',
      ],
    ];
    if (problems.isNotEmpty) {
      return ToolResult(
        modelResult: {'error': 'Nothing was measured.', 'problems': problems},
      );
    }
    final trips = <Trip>[];
    for (final trip in wanted) {
      final place = places[trip.place]!;
      final mode = TravelMode.values.byName(trip.mode);
      final route = await _route(start.point, place, mode, context);
      trips.add(
        Trip(
          placeId: place.id,
          placeName: place.name,
          to: place.point,
          perWeek: trip.perWeek,
          mode: mode,
          minutes: route?.minutes,
          meters: route?.meters,
        ),
      );
    }
    final week = WeekTravel(
      fromId: fromId,
      fromName: start.name,
      from: start.point,
      trips: trips,
    );
    return ToolResult(
      modelResult: {
        'from': start.name,
        'trips': [
          for (final trip in trips)
            {
              'place': trip.placeId,
              'mode': trip.mode.name,
              'perWeek': trip.perWeek,
              'minutesOneWay': ?trip.minutes,
            },
        ],
        'weeklyMinutes': week.weeklyMinutes,
        if (!week.measuredEveryTrip)
          'unmeasured': [
            for (final trip in trips)
              if (trip.minutes == null) trip.placeId,
          ],
        'note':
            'The week is in /week/$fromId. Show it with WeeklyTravel, '
            '{ "path": "/week/$fromId" }, or one trip with RouteSummary, '
            '{ "path": "/week/$fromId/trips/<n>" }; never write the minutes '
            'in your text.',
      },
      seeds: {
        weekSlice.name: {
          ...switch (context.slices[weekSlice.name]) {
            final Map<String, Object?> weeks => weeks,
            _ => const <String, Object?>{},
          },
          fromId: jsonDecode(jsonEncode(week.toJson())),
        },
      },
      logFields: {
        'trips': trips.length,
        'measured': trips.where((trip) => trip.minutes != null).length,
      },
    );
  }

  Future<TravelRoute?> _route(
    GeoPoint from,
    Place place,
    TravelMode mode,
    ToolContext context,
  ) async {
    try {
      return await context.steps.track(
        'Measuring the trip to ${place.name} ${_by(mode)}',
        () => research.routing.route(from, place.point, mode),
        measured: (route) => route != null,
      );
    } on OpenDataUnavailable {
      return null;
    }
  }

  static String _by(TravelMode mode) => switch (mode) {
    TravelMode.walk => 'on foot',
    TravelMode.bike => 'by bike',
    TravelMode.car => 'by car',
    TravelMode.transit => 'by public transport',
  };

  static ToolResult _error(String message) =>
      ToolResult(modelResult: {'error': message});
}
