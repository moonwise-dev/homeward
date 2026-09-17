import 'package:flutter/material.dart';

import 'app_colors.dart';

class ChartPoint {
  const ChartPoint({required this.x, required this.y});

  final double x;
  final double y;
}

class ChartMarker {
  const ChartMarker({
    required this.x,
    required this.label,
    required this.color,
  });

  final double x;
  final String label;
  final Color color;
}

class AppLineChart extends StatelessWidget {
  const AppLineChart({
    required this.points,
    this.markers = const [],
    this.limit,
    this.height = 160,
    super.key,
  });

  final List<ChartPoint> points;
  final List<ChartMarker> markers;
  final double? limit;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: CustomPaint(
      size: Size.infinite,
      painter: _LineChartPainter(
        points: points,
        markers: markers,
        limit: limit,
        textDirection: Directionality.of(context),
      ),
    ),
  );
}

class _LineChartPainter extends CustomPainter {
  _LineChartPainter({
    required this.points,
    required this.markers,
    required this.limit,
    required this.textDirection,
  });

  static const _padding = EdgeInsets.fromLTRB(4, 16, 4, 20);
  static const _markerRadius = 4.0;

  final List<ChartPoint> points;
  final List<ChartMarker> markers;
  final double? limit;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) {
      return;
    }
    final plot = Rect.fromLTRB(
      _padding.left,
      _padding.top,
      size.width - _padding.right,
      size.height - _padding.bottom,
    );
    final xs = [for (final point in points) point.x];
    final ys = [
      for (final point in points) point.y,
      ?limit,
    ];
    final minX = xs.reduce((a, b) => a < b ? a : b);
    final maxX = xs.reduce((a, b) => a > b ? a : b);
    final minY = ys.reduce((a, b) => a < b ? a : b);
    final maxY = ys.reduce((a, b) => a > b ? a : b);
    Offset at(double x, double y) => Offset(
      plot.left + (maxX == minX ? 0 : (x - minX) / (maxX - minX) * plot.width),
      plot.bottom -
          (maxY == minY
              ? plot.height
              : (y - minY) / (maxY - minY) * plot.height),
    );

    final start = at(points.first.x, points.first.y);
    final line = Path()..moveTo(start.dx, start.dy);
    for (final point in points.skip(1)) {
      final offset = at(point.x, point.y);
      line.lineTo(offset.dx, offset.dy);
    }
    canvas
      ..drawPath(
        Path.from(line)
          ..lineTo(at(points.last.x, minY).dx, plot.bottom)
          ..lineTo(at(points.first.x, minY).dx, plot.bottom)
          ..close(),
        Paint()..color = AppColors.accentSoft,
      )
      ..drawPath(
        line,
        Paint()
          ..color = AppColors.accent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..strokeJoin = StrokeJoin.round,
      );

    if (limit case final limit?) {
      final y = at(minX, limit).dy;
      final dashes = Paint()
        ..color = AppColors.danger
        ..strokeWidth = 1.5;
      for (var x = plot.left; x < plot.right; x += 8) {
        canvas.drawLine(
          Offset(x, y),
          Offset((x + 5).clamp(plot.left, plot.right), y),
          dashes,
        );
      }
    }

    for (final marker in markers) {
      final point = _pointAt(marker.x);
      final offset = at(point.x, point.y);
      canvas
        ..drawLine(
          Offset(offset.dx, plot.top),
          Offset(offset.dx, plot.bottom),
          Paint()..color = AppColors.border,
        )
        ..drawCircle(offset, _markerRadius, Paint()..color = marker.color);
      _label(canvas, marker.label, offset.dx, plot, marker.color);
    }
  }

  ChartPoint _pointAt(double x) => points.reduce(
    (closest, point) =>
        (point.x - x).abs() < (closest.x - x).abs() ? point : closest,
  );

  void _label(
    Canvas canvas,
    String text,
    double x,
    Rect plot,
    Color color,
  ) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: 11, height: 1.2),
      ),
      textDirection: textDirection,
    )..layout();
    painter.paint(
      canvas,
      Offset(
        (x - painter.width / 2).clamp(0, plot.right - painter.width),
        plot.bottom + 4,
      ),
    );
  }

  @override
  bool shouldRepaint(_LineChartPainter old) =>
      old.points != points || old.markers != markers || old.limit != limit;
}
