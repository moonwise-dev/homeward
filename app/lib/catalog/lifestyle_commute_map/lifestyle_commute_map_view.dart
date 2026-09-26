import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../map_tiles.dart';
import '../story_marks.dart';

class LifestyleCommuteMapView extends StatelessWidget {
  const LifestyleCommuteMapView({
    required this.markers,
    this.routes = const [],
    this.focus,
    this.center,
    this.zoom,
    this.travelMode,
    super.key,
  });

  static const height = 320.0;
  static const _pinWidth = 216.0;
  static const _pinSize = 28.0;

  final List<MapMarker> markers;
  final List<MapRoute> routes;
  final String? focus;
  final GeoPoint? center;
  final double? zoom;
  final String? travelMode;

  @override
  Widget build(BuildContext context) {
    final homes = markers
        .where((marker) => marker.kind == MapMarkerKind.candidate)
        .length;
    final onlyCity = markers.every(
      (marker) => marker.kind == MapMarkerKind.city,
    );
    final shown = [
      for (final marker in markers)
        if (marker.kind == MapMarkerKind.city)
          if (onlyCity) marker else ...const <MapMarker>[]
        else if (focus == null
            ? marker.kind != MapMarkerKind.place || homes == 1
            : marker.candidateId == null || marker.candidateId == focus)
          marker,
    ];
    final shownRoutes = [
      for (final route in routes)
        if ((focus == null || route.candidateId == focus) &&
            (travelMode == null || route.mode.mapsName == travelMode))
          route,
    ];
    final center = this.center;
    final week = focus == null ? null : weekOfTravel(shownRoutes);
    if (shown.isEmpty) {
      return SizedBox(
        height: AppSpacing.xxl * 2,
        child: Center(
          child: Text(
            'Nothing is on the map yet',
            style: AppTextStyles.caption,
          ),
        ),
      );
    }
    final timesOnPins =
        {for (final route in shownRoutes) route.anchorId}.length == 1;
    final points = [
      for (final marker in shown) LatLng(marker.lat, marker.lng),
      for (final route in shownRoutes)
        for (final [lat, lng] in route.path) LatLng(lat, lng),
    ];
    return Semantics(
      label: _summary(shown, shownRoutes),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.md),
        child: SizedBox(
          height: height,
          child: RepaintBoundary(
            child: FlutterMap(
              key: ValueKey(Object.hashAll(points)),
              options: MapOptions(
                initialCenter: center == null
                    ? points.first
                    : LatLng(center.lat, center.lng),
                initialZoom: zoom ?? (onlyCity ? 12 : 14),
                initialCameraFit: points.length < 2 || center != null
                    ? null
                    : CameraFit.coordinates(
                        coordinates: points,
                        padding: EdgeInsets.fromLTRB(
                          40,
                          week == null ? 40 : 120,
                          160,
                          48,
                        ),
                        maxZoom: 16,
                      ),
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                const MapTiles(),
                PolylineLayer(
                  polylines: [
                    for (final route in shownRoutes)
                      Polyline(
                        points: [
                          for (final [lat, lng] in route.path) LatLng(lat, lng),
                        ],
                        strokeWidth: 4,
                        color: homeColor(route.candidateId),
                      ),
                  ],
                ),
                MarkerLayer(
                  markers: [
                    for (final marker in shown)
                      if (marker.kind == MapMarkerKind.city)
                        Marker(
                          point: LatLng(marker.lat, marker.lng),
                          width: 160,
                          height: 28,
                          child: _CityLabel(label: marker.label),
                        ),
                    for (final marker in shown)
                      if (marker.kind == MapMarkerKind.place)
                        Marker(
                          point: LatLng(marker.lat, marker.lng),
                          width: 24,
                          height: 24,
                          child: _PlaceDot(marker: marker),
                        ),
                    for (final route in shownRoutes)
                      if (route.path.isNotEmpty && !timesOnPins)
                        Marker(
                          point: _badgePoint(route.path, shown),
                          width: 150,
                          height: 26,
                          child: _RouteBadge(route: route),
                        ),
                    for (final kind in const [
                      MapMarkerKind.candidate,
                      MapMarkerKind.anchor,
                    ])
                      for (final marker in shown)
                        if (marker.kind == kind)
                          Marker(
                            point: LatLng(marker.lat, marker.lng),
                            width: _pinWidth,
                            height: 32,
                            alignment: const Alignment(
                              1 - _pinSize / _pinWidth,
                              0,
                            ),
                            child: _Pin(
                              marker: marker,
                              size: _pinSize,
                              route: timesOnPins
                                  ? shownRoutes
                                        .where(
                                          (route) =>
                                              route.candidateId == marker.id,
                                        )
                                        .firstOrNull
                                  : null,
                            ),
                          ),
                  ],
                ),
                if (week != null && week > 0)
                  Align(
                    alignment: Alignment.topLeft,
                    child: _WeekCard(minutes: week, trips: shownRoutes),
                  ),
                const MapAttribution(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LatLng _badgePoint(List<List<double>> path, List<MapMarker> pins) {
    const distance = Distance();
    final options = [
      for (final share in const [0.3, 0.5, 0.7])
        switch (path[((path.length - 1) * share).round()]) {
          [final lat, final lng] => LatLng(lat, lng),
          _ => LatLng(path.first.first, path.first.last),
        },
    ];
    double clearance(LatLng point) => pins
        .where((pin) => pin.kind != MapMarkerKind.place)
        .map((pin) => distance(point, LatLng(pin.lat, pin.lng)))
        .fold(
          double.infinity,
          (nearest, meters) => meters < nearest ? meters : nearest,
        );
    return options.reduce((a, b) => clearance(a) >= clearance(b) ? a : b);
  }

  String _summary(List<MapMarker> shown, List<MapRoute> shownRoutes) => [
    'Map of ${[
      for (final marker in shown)
        if (marker.kind != MapMarkerKind.place) marker.label,
    ].join(', ')}',
    for (final route in shownRoutes)
      '${route.label} from ${_labelOf(route.candidateId)} '
          'to ${_labelOf(route.anchorId)} ${route.mode.phrase}, '
          '${tripsPhrase(route.perWeek)}',
  ].join('. ');

  String _labelOf(String id) =>
      markers.where((marker) => marker.id == id).firstOrNull?.label ?? id;
}

class _Pin extends StatelessWidget {
  const _Pin({required this.marker, required this.size, this.route});

  final MapMarker marker;
  final double size;
  final MapRoute? route;

  @override
  Widget build(BuildContext context) {
    final isHome = marker.kind == MapMarkerKind.candidate;
    final color = isHome ? homeColor(marker.candidateId) : AppColors.text;
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.surface, width: 2),
          ),
          child: Icon(
            isHome ? Icons.home_outlined : Icons.work_outline,
            size: 16,
            color: AppColors.onAccent,
          ),
        ),
        const SizedBox(width: 2),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xs,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadii.pill),
              border: Border.all(color: color, width: 1.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    marker.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.label.copyWith(color: AppColors.text),
                  ),
                ),
                if (route case final route?) ...[
                  const SizedBox(width: AppSpacing.xxs),
                  Icon(travelModeIcon(route.mode), size: 14, color: color),
                  const SizedBox(width: 2),
                  Text(
                    '${route.label} · ${tripsPhrase(route.perWeek)}',
                    style: AppTextStyles.label.copyWith(color: color),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CityLabel extends StatelessWidget {
  const _CityLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: AppColors.borderStrong),
      ),
      child: Text(label, style: AppTextStyles.label),
    ),
  );
}

class _PlaceDot extends StatelessWidget {
  const _PlaceDot({required this.marker});

  final MapMarker marker;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: marker.label,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        border: Border.all(color: homeColor(marker.candidateId), width: 1.5),
      ),
      child: Icon(
        criterionIcon(criterionKindNamed(marker.category)),
        size: 14,
        color: homeColor(marker.candidateId),
      ),
    ),
  );
}

class _RouteBadge extends StatelessWidget {
  const _RouteBadge({required this.route});

  final MapRoute route;

  @override
  Widget build(BuildContext context) {
    final color = homeColor(route.candidateId);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(travelModeIcon(route.mode), size: 14, color: AppColors.onAccent),
          const SizedBox(width: 4),
          Text(
            '${route.label} · ${tripsPhrase(route.perWeek)}',
            style: AppTextStyles.label.copyWith(color: AppColors.onAccent),
          ),
        ],
      ),
    );
  }
}

class _WeekCard extends StatelessWidget {
  const _WeekCard({required this.minutes, required this.trips});

  final int minutes;
  final List<MapRoute> trips;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.all(AppSpacing.sm),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.sm,
      vertical: AppSpacing.xs,
    ),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadii.md),
      border: Border.all(color: AppColors.border),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your week in travel', style: AppTextStyles.caption),
        Text(weekPhrase(minutes), style: AppTextStyles.figure),
        Text(
          trips.length == 1
              ? 'Measured, there and back, to one place'
              : 'Measured, there and back, to ${trips.length} places',
          style: AppTextStyles.caption.copyWith(color: AppColors.textTertiary),
        ),
      ],
    ),
  );
}
