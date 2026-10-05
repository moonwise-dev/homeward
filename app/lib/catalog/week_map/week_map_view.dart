import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../../ui/core/ui/app_map_tiles.dart';
import '../travel_text.dart';
import 'week_map_pins.dart';

class WeekMapView extends HookWidget {
  const WeekMapView({required this.places, this.week, super.key});

  static const height = 320.0;
  static const _closest = 15.0;
  static const _gestures =
      InteractiveFlag.drag |
      InteractiveFlag.flingAnimation |
      InteractiveFlag.pinchMove |
      InteractiveFlag.pinchZoom |
      InteractiveFlag.doubleTapZoom |
      InteractiveFlag.doubleTapDragZoom;

  final List<Place> places;
  final WeekTravel? week;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    final week = this.week;
    final trips = week?.trips ?? const <Trip>[];
    final stops = [
      for (final place in places)
        if (place.id != week?.fromId)
          (
            place: place,
            trips: [
              for (final trip in trips)
                if (trip.placeId == place.id) trip,
            ],
          ),
    ];
    final routes = [
      for (final trip in trips)
        if (trip.path case final path when path.length > 1)
          [for (final point in path) _latLng(point)],
    ];
    final points = [
      if (week != null) _latLng(week.from),
      for (final stop in stops) _latLng(stop.place.point),
      for (final route in routes) ...route,
    ];
    final shown = Object.hashAll(points);
    final controller = useMemoized(MapController.new, [shown]);
    useEffect(() => controller.dispose, [controller]);
    if (points.isEmpty) {
      return SizedBox(
        height: AppSpacing.xxl * 2,
        child: Center(
          child: Text('Nothing is on the map yet', style: styles.caption),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (week != null && week.weeklyMinutes > 0) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  week.measuredEveryTrip
                      ? 'A week of travel, there and back'
                      : 'A week of travel, there and back, for the trips '
                            'measured',
                  style: styles.caption,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(durationText(week.weeklyMinutes), style: styles.figure),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        Semantics(
          label: _summary(stops.map((stop) => stop.place)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.md),
            child: SizedBox(
              height: height,
              child: RepaintBoundary(
                child: FlutterMap(
                  key: ValueKey(shown),
                  mapController: controller,
                  options: MapOptions(
                    initialCenter: points.first,
                    initialZoom: 13,
                    initialCameraFit: points.length < 2
                        ? null
                        : CameraFit.coordinates(
                            coordinates: points,
                            padding: const EdgeInsets.fromLTRB(
                              40,
                              40,
                              168,
                              48,
                            ),
                            maxZoom: _closest,
                          ),
                    interactionOptions: const InteractionOptions(
                      flags: _gestures,
                    ),
                    backgroundColor: colors.surfaceMuted,
                  ),
                  children: [
                    const AppMapTiles(),
                    PolylineLayer(
                      polylines: [
                        for (final route in routes)
                          Polyline(
                            points: route,
                            strokeWidth: 4,
                            color: colors.accent,
                            borderStrokeWidth: 2,
                            borderColor: colors.surface,
                          ),
                      ],
                    ),
                    WeekMapPins(
                      controls: _ZoomButtons.box,
                      pins: [
                        if (week != null)
                          WeekMapPin(
                            point: week.from,
                            label: week.fromName,
                            isHome: true,
                          ),
                        for (final stop in stops)
                          WeekMapPin(
                            point: stop.place.point,
                            label: stop.place.name,
                            trips: stop.trips,
                          ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: _ZoomButtons(controller: controller),
                    ),
                    const AppMapAttribution(),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(_sources(trips), style: styles.caption),
      ],
    );
  }

  String _summary(Iterable<Place> stops) {
    final week = this.week;
    return [
      [
        'Map of ${stops.map((place) => place.name).join(', ')}',
        if (week != null) 'from ${week.fromName}',
      ].join(' '),
      for (final trip in week?.trips ?? const <Trip>[])
        [
          'To ${trip.placeName} ${byText(trip.mode)}',
          switch (trip.minutes) {
            final minutes? => '${durationText(minutes)} each way',
            null => 'not measured',
          },
          timesAWeekText(trip.perWeek),
        ].join(', '),
      if (week != null && week.weeklyMinutes > 0)
        '${durationText(week.weeklyMinutes)} travelling a week, there and back',
    ].join('. ');
  }

  static String _sources(List<Trip> trips) => [
    'Places found on OpenStreetMap.',
    if (trips.any((trip) => trip.minutes != null))
      'Trips measured one way with '
          '${measuredByText([
            for (final trip in trips)
              if (trip.minutes != null) trip.mode,
          ])}.',
  ].join(' ');

  static LatLng _latLng(GeoPoint point) => LatLng(point.lat, point.lng);
}

class _ZoomButtons extends StatelessWidget {
  const _ZoomButtons({required this.controller});

  static const _margin = AppSpacing.sm;
  static const box = Size(
    kMinInteractiveDimension + 2 + _margin * 2,
    kMinInteractiveDimension * 2 + 2 + _margin * 2,
  );

  final MapController controller;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Container(
      margin: const EdgeInsets.all(_margin),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.sm),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Zoom in',
            icon: const Icon(Icons.add),
            color: colors.text,
            onPressed: () => _zoomBy(1),
          ),
          IconButton(
            tooltip: 'Zoom out',
            icon: const Icon(Icons.remove),
            color: colors.text,
            onPressed: () => _zoomBy(-1),
          ),
        ],
      ),
    );
  }

  void _zoomBy(double steps) {
    final camera = controller.camera;
    controller.move(camera.center, (camera.zoom + steps).clamp(3, 18));
  }
}
