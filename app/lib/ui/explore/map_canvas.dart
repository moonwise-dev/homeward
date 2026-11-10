import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' show LatLng;

import '../../catalog/money_text.dart';
import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';
import '../core/themes/text_styles.dart';
import '../core/ui/app_map_tiles.dart';

enum PinState { left, kept, selected, narrowedOut, overBudget }

typedef CityView = ({GeoPoint centre, double zoom});

const europeView = (centre: GeoPoint(lat: 50, lng: 8), zoom: 4.0);

CityView? cityViewIn(String text) {
  final words = text.toLowerCase();
  if (words.contains('stockholm')) {
    return (centre: const GeoPoint(lat: 59.3293, lng: 18.0686), zoom: 11.0);
  }
  if (words.contains('lisbon') || words.contains('lisboa')) {
    return (centre: const GeoPoint(lat: 38.7223, lng: -9.1393), zoom: 11.0);
  }
  return null;
}

class MapCanvas extends HookWidget {
  const MapCanvas({
    required this.homes,
    required this.pinStates,
    required this.routeAreas,
    required this.onTapHome,
    this.waitingFor,
    this.padding = const EdgeInsets.all(48),
    this.interactive = true,
    super.key,
  });

  final CityHomes? homes;
  final Map<String, PinState> pinStates;
  final Set<String> routeAreas;
  final ValueChanged<String>? onTapHome;
  final CityView? waitingFor;
  final EdgeInsets padding;
  final bool interactive;

  static const _entrance = Duration(milliseconds: 2400);
  static const _drift = Duration(seconds: 9);
  static const _routeDraw = Duration(milliseconds: 900);

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final still = MediaQuery.disableAnimationsOf(context);
    final controller = useMemoized(MapController.new);
    final ready = useState(false);
    final entrance = useAnimationController(duration: _entrance);
    final drift = useAnimationController(duration: _drift);
    final routes = useAnimationController(duration: _routeDraw);
    final camera = useAnimationController(
      duration: const Duration(milliseconds: 1400),
    );
    final cameraFrom = useRef<CityView?>(null);
    final cameraTo = useRef<CityView?>(null);
    final homes = this.homes;
    final cityKey = homes?.cityId;
    final start = waitingFor ?? europeView;

    void moveTo(CityView target) {
      if (!ready.value) {
        return;
      }
      final now = controller.camera;
      cameraFrom.value = (
        centre: GeoPoint(lat: now.center.latitude, lng: now.center.longitude),
        zoom: now.zoom,
      );
      cameraTo.value = target;
      if (still) {
        controller.move(_latLng(target.centre), target.zoom);
      } else {
        camera.forward(from: 0);
      }
    }

    useEffect(() {
      void step() {
        final from = cameraFrom.value;
        final to = cameraTo.value;
        if (from == null || to == null) {
          return;
        }
        final t = Curves.easeInOutCubic.transform(camera.value);
        controller.move(
          LatLng(
            _lerp(from.centre.lat, to.centre.lat, t),
            _lerp(from.centre.lng, to.centre.lng, t),
          ),
          _lerp(from.zoom, to.zoom, t),
        );
      }

      camera.addListener(step);
      return () => camera.removeListener(step);
    }, [controller]);

    useEffect(() {
      if (homes != null || !ready.value) {
        return null;
      }
      final view = waitingFor;
      if (view == null) {
        return null;
      }
      void step() {
        final t = Curves.easeOutCubic.transform(drift.value);
        controller.move(_latLng(view.centre), _lerp(8, view.zoom - 0.6, t));
      }

      if (still) {
        controller.move(_latLng(view.centre), view.zoom);
        return null;
      }
      drift.addListener(step);
      drift.forward(from: 0);
      return () => drift.removeListener(step);
    }, [waitingFor, ready.value, homes == null]);

    useEffect(() {
      if (homes == null || !ready.value) {
        return null;
      }
      drift.stop();
      final points = [for (final home in homes.homes) home.listing.point];
      final fit = CameraFit.coordinates(
        coordinates: [for (final point in points) _latLng(point)],
        padding: padding,
        maxZoom: 13,
      ).fit(controller.camera);
      moveTo((
        centre: GeoPoint(lat: fit.center.latitude, lng: fit.center.longitude),
        zoom: fit.zoom,
      ));
      if (still) {
        entrance.value = 1;
      } else {
        entrance.forward(from: 0);
      }
      return null;
    }, [cityKey, ready.value]);

    final routeKey = (routeAreas.toList()..sort()).join(',');
    useEffect(() {
      if (still) {
        routes.value = 1;
      } else {
        routes.forward(from: 0);
      }
      return null;
    }, [routeKey, homes?.places.length]);

    final ordered = homes == null
        ? const <MapHome>[]
        : ([...homes.homes]..sort(
            (a, b) => a.listing.point.lng.compareTo(b.listing.point.lng),
          ));
    final paths = <({List<LatLng> points, bool strong})>[
      if (homes != null)
        for (final area in homes.areas)
          if (routeAreas.contains(area.areaId))
            for (final encoded in area.routes.values)
              (points: _decoded(encoded), strong: routeAreas.length <= 3),
    ];

    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: _latLng(start.centre),
        initialZoom: start.zoom,
        backgroundColor: colors.surfaceMuted,
        onMapReady: () => ready.value = true,
        interactionOptions: InteractionOptions(
          flags: interactive
              ? InteractiveFlag.drag |
                    InteractiveFlag.pinchZoom |
                    InteractiveFlag.doubleTapZoom |
                    InteractiveFlag.scrollWheelZoom
              : InteractiveFlag.none,
        ),
      ),
      children: [
        const AppMapTiles(),
        AnimatedBuilder(
          animation: routes,
          builder: (context, _) => PolylineLayer(
            polylines: [
              for (final path in paths)
                Polyline(
                  points: _partOf(path.points, routes.value),
                  strokeWidth: path.strong ? 5 : 3,
                  color: path.strong
                      ? colors.accent
                      : colors.accent.withValues(alpha: 0.45),
                  borderStrokeWidth: path.strong ? 2 : 0,
                  borderColor: colors.surface,
                ),
            ],
          ),
        ),
        AnimatedBuilder(
          animation: entrance,
          builder: (context, _) => MarkerLayer(
            markers: [
              for (final (index, home) in ordered.indexed)
                _pin(
                  home,
                  homes!,
                  pinStates[home.listing.id] ?? PinState.left,
                  _appear(entrance.value, index, ordered.length),
                  _sweep(entrance.value, index, ordered.length),
                ),
              if (homes != null)
                for (final place in homes.places)
                  Marker(
                    point: _latLng(place.point),
                    width: 140,
                    height: 64,
                    child: _PlacePin(name: place.name),
                  ),
            ],
          ),
        ),
        const AppMapAttribution(),
      ],
    );
  }

  Marker _pin(
    MapHome home,
    CityHomes homes,
    PinState state,
    double appear,
    double sweep,
  ) {
    final shown = switch (state) {
      PinState.overBudget => sweep < 1 ? PinState.left : PinState.overBudget,
      _ => state,
    };
    final isDot = shown == PinState.overBudget || shown == PinState.narrowedOut;
    return Marker(
      point: _latLng(home.listing.point),
      width: isDot ? 18 : 96,
      alignment: isDot ? Alignment.center : Alignment.topCenter,
      height: isDot ? 18 : 44,
      child: Opacity(
        opacity: appear,
        child: Transform.scale(
          scale: Curves.easeOutBack.transform(appear),
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTapHome == null ? null : () => onTapHome!(home.listing.id),
            child: PricePin(
              label: switch (home.monthly) {
                final monthly? => pinMoneyText(monthly),
                null => pinMoneyText(home.price),
              },
              state: shown,
            ),
          ),
        ),
      ),
    );
  }

  static double _appear(double t, int index, int count) {
    final delay = count < 2 ? 0.0 : 0.4 * index / (count - 1);
    return ((t - delay) / 0.2).clamp(0.0, 1.0);
  }

  static double _sweep(double t, int index, int count) {
    final delay = 0.62 + (count < 2 ? 0.0 : 0.3 * index / (count - 1));
    return t >= delay ? 1 : 0;
  }

  static List<LatLng> _partOf(List<LatLng> points, double t) {
    if (points.length < 2 || t >= 1) {
      return points;
    }
    final count = max(2, (points.length * t).ceil());
    return points.sublist(0, count);
  }

  static List<LatLng> _decoded(String encoded) => [
    for (final point in decodePolyline(encoded)) _latLng(point),
  ];
}

LatLng _latLng(GeoPoint point) => LatLng(point.lat, point.lng);

double _lerp(double a, double b, double t) => a + (b - a) * t;

class PricePin extends StatelessWidget {
  const PricePin({required this.label, required this.state, super.key});

  final String label;
  final PinState state;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    switch (state) {
      case PinState.overBudget || PinState.narrowedOut:
        final over = state == PinState.overBudget;
        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: over ? 9 : 12,
            height: over ? 9 : 12,
            decoration: BoxDecoration(
              color: over ? colors.textTertiary : colors.textSecondary,
              shape: BoxShape.circle,
              border: Border.all(color: colors.surface, width: 2),
              boxShadow: [BoxShadow(color: colors.shadow, blurRadius: 3)],
            ),
          ),
        );
      case PinState.left || PinState.kept || PinState.selected:
        final (fill, ink) = switch (state) {
          PinState.kept => (colors.text, colors.surface),
          PinState.selected => (colors.accent, colors.onAccent),
          _ => (colors.brand, colors.onBrand),
        };
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  horizontal: state == PinState.selected ? 12 : 9,
                  vertical: state == PinState.selected ? 7 : 5,
                ),
                decoration: BoxDecoration(
                  color: fill,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  border: Border.all(color: colors.surface, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadow,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 3,
                  children: [
                    if (state == PinState.kept)
                      Icon(Icons.favorite_rounded, size: 12, color: ink),
                    Text(
                      label,
                      style: styles.label.copyWith(
                        color: ink,
                        fontSize: 12,
                        height: 1.1,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
              CustomPaint(
                size: const Size(10, 6),
                painter: _Tail(fill),
              ),
            ],
          ),
        );
    }
  }
}

class _Tail extends CustomPainter {
  const _Tail(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(
    Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close(),
    Paint()..color = color,
  );

  @override
  bool shouldRepaint(_Tail oldDelegate) => oldDelegate.color != color;
}

class _PlacePin extends StatelessWidget {
  const _PlacePin({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final styles = AppTextStyles.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: colors.text,
            shape: BoxShape.circle,
            border: Border.all(color: colors.surface, width: 2),
            boxShadow: [BoxShadow(color: colors.shadow, blurRadius: 8)],
          ),
          child: Icon(Icons.place_rounded, size: 18, color: colors.surface),
        ),
        const SizedBox(height: 2),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.92),
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: styles.caption.copyWith(
              color: colors.text,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
