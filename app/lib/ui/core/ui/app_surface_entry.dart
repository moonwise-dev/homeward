import 'package:flutter/material.dart';

import '../themes/motion.dart';

class AppSurfaceEntry extends StatefulWidget {
  const AppSurfaceEntry({required this.child, super.key});

  final Widget child;

  @override
  State<AppSurfaceEntry> createState() => _AppSurfaceEntryState();
}

class _AppSurfaceEntryState extends State<AppSurfaceEntry>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: AppMotion.surface,
  );
  late final _entry = CurvedAnimation(
    parent: _controller,
    curve: AppMotion.curve,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.duration = AppMotion.of(context, AppMotion.surface);
    if (!_controller.isAnimating && _controller.value == 0) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _entry.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _entry,
    child: widget.child,
    builder: (context, child) => Opacity(
      opacity: _entry.value,
      child: Transform.translate(
        offset: Offset(0, AppMotion.rise * (1 - _entry.value)),
        child: child,
      ),
    ),
  );
}
