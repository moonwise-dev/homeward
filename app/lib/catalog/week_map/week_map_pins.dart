import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../ui/core/themes/colors.dart';
import '../../ui/core/themes/dimens.dart';
import '../../ui/core/themes/text_styles.dart';
import '../travel_text.dart';

class WeekMapPin {
  const WeekMapPin({
    required this.point,
    required this.label,
    this.isHome = false,
    this.trips = const [],
  });

  final GeoPoint point;
  final String label;
  final bool isHome;
  final List<Trip> trips;

  String? get tripsText => trips.isEmpty
      ? null
      : [
          for (final trip in trips)
            switch (trip.minutes) {
              final minutes? =>
                '${durationText(minutes)} · ${trip.perWeek}× a week',
              null => 'Not measured',
            },
        ].join(', ');
}

class WeekMapPins extends StatelessWidget {
  const WeekMapPins({
    required this.pins,
    this.controls = Size.zero,
    super.key,
  });

  final List<WeekMapPin> pins;
  final Size controls;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    return CustomMultiChildLayout(
      delegate: _PinLayout(
        dots: [
          for (final pin in pins)
            camera.latLngToScreenOffset(LatLng(pin.point.lat, pin.point.lng)),
        ],
        controls: controls,
      ),
      children: [
        for (final (index, pin) in pins.indexed)
          LayoutId(
            id: _PinLayout.pillOf(index),
            child: _Pill(pin: pin),
          ),
        for (final (index, pin) in pins.indexed)
          LayoutId(
            id: _PinLayout.dotOf(index),
            child: _Dot(pin: pin),
          ),
      ],
    );
  }
}

class _PinLayout extends MultiChildLayoutDelegate {
  _PinLayout({required this.dots, required this.controls});

  static const _dot = 28.0;
  static const _reach = _dot / 2 + 2;
  static const _widest = 204.0;

  final List<Offset> dots;
  final Size controls;

  static int pillOf(int index) => index * 2;

  static int dotOf(int index) => index * 2 + 1;

  @override
  void performLayout(Size size) {
    final map = Offset.zero & size;
    final taken = [
      Rect.fromLTWH(
        size.width - controls.width,
        0,
        controls.width,
        controls.height,
      ),
      for (final dot in dots) Rect.fromCircle(center: dot, radius: _dot / 2),
    ];
    for (final (index, dot) in dots.indexed) {
      layoutChild(dotOf(index), BoxConstraints.tight(const Size.square(_dot)));
      positionChild(dotOf(index), dot - const Offset(_dot / 2, _dot / 2));
      final pill = layoutChild(
        pillOf(index),
        const BoxConstraints(maxWidth: _widest),
      );
      final around = _around(dot, pill);
      final placed = around.firstWhere(
        (rect) =>
            map.contains(rect.topLeft) &&
            map.contains(rect.bottomRight) &&
            !taken.any(rect.overlaps),
        orElse: () => around.first,
      );
      taken.add(placed);
      positionChild(pillOf(index), placed.topLeft);
    }
  }

  @override
  bool shouldRelayout(_PinLayout oldDelegate) =>
      !listEquals(oldDelegate.dots, dots) || oldDelegate.controls != controls;

  static List<Rect> _around(Offset dot, Size pill) {
    final right = dot.dx + _reach;
    final left = dot.dx - _reach - pill.width;
    final centered = dot.dx - pill.width / 2;
    final level = dot.dy - pill.height / 2;
    final above = dot.dy - _reach - pill.height;
    final below = dot.dy + _reach;
    return [
      for (final (x, y) in [
        (right, level),
        (left, level),
        (centered, above),
        (centered, below),
        (right, above),
        (right, below),
        (left, above),
        (left, below),
      ])
        Offset(x, y) & pill,
    ];
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.pin});

  final WeekMapPin pin;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: pin.isHome ? colors.accent : colors.text,
        shape: BoxShape.circle,
        border: Border.all(color: colors.surface, width: 2),
      ),
      child: Icon(
        pin.isHome ? Icons.home_outlined : Icons.place_outlined,
        size: 16,
        color: pin.isHome ? colors.onAccent : colors.surface,
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.pin});

  final WeekMapPin pin;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final style = AppTextStyles.of(context).label;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(
          color: pin.isHome ? colors.accent : colors.text,
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pin.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
          if (pin.tripsText case final text?)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  modeIcon(pin.trips.first.mode),
                  size: 14,
                  color: colors.accent,
                ),
                const SizedBox(width: 2),
                Flexible(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: style.copyWith(color: colors.accent),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
