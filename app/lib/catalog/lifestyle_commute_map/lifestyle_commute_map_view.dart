import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../story_marks.dart';

class LifestyleCommuteMapView extends StatelessWidget {
  const LifestyleCommuteMapView({
    required this.markers,
    this.routes = const [],
    this.focus,
    super.key,
  });

  static const height = 320.0;
  static const _pinWidth = 216.0;
  static const _pinSize = 28.0;

  final List<MapMarker> markers;
  final List<MapRoute> routes;
  final String? focus;

  @override
  Widget build(BuildContext context) {
    final homes = markers
        .where((marker) => marker.kind == MapMarkerKind.candidate)
        .length;
    final shown = [
      for (final marker in markers)
        if (focus == null
            ? marker.kind != MapMarkerKind.place || homes == 1
            : marker.candidateId == null || marker.candidateId == focus)
          marker,
    ];
    final shownRoutes = [
      for (final route in routes)
        if (focus == null || route.candidateId == focus) route,
    ];
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
              options: MapOptions(
                initialCenter: points.first,
                initialZoom: 14,
                initialCameraFit: points.length < 2
                    ? null
                    : CameraFit.coordinates(
                        coordinates: points,
                        padding: const EdgeInsets.fromLTRB(40, 40, 160, 48),
                        maxZoom: 16,
                      ),
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
              ),
              children: [
                ColorFiltered(
                  colorFilter: _calmTiles,
                  child: TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'se.moonwise.homeward',
                  ),
                ),
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
                          width: 92,
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
                const _Attribution(),
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
          'to ${_labelOf(route.anchorId)} ${route.mode.phrase}',
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
                    route.label,
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
            route.label,
            style: AppTextStyles.label.copyWith(color: AppColors.onAccent),
          ),
        ],
      ),
    );
  }
}

final _calmTiles = _softened(saturation: 0.35, lift: 12);

ColorFilter _softened({required double saturation, required double lift}) {
  const luminance = [0.2126, 0.7152, 0.0722];
  final grey = 1 - saturation;
  return ColorFilter.matrix([
    for (var channel = 0; channel < 3; channel++) ...[
      for (var source = 0; source < 3; source++)
        grey * luminance[source] + (source == channel ? saturation : 0),
      0,
      lift,
    ],
    0,
    0,
    0,
    1,
    0,
  ]);
}

class _Attribution extends StatelessWidget {
  const _Attribution();

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomRight,
    child: Container(
      margin: const EdgeInsets.all(AppSpacing.xxs),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
      color: AppColors.surface.withValues(alpha: 0.8),
      child: Text(
        '© OpenStreetMap contributors',
        textAlign: TextAlign.right,
        style: AppTextStyles.caption.copyWith(fontSize: 10),
      ),
    ),
  );
}
