import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

class BoundChecks extends StatefulWidget {
  const BoundChecks({
    required this.dataContext,
    required this.checks,
    required this.builder,
    super.key,
  });

  final DataContext dataContext;
  final Object? checks;
  final Widget Function(BuildContext context, String? failure) builder;

  @override
  State<BoundChecks> createState() => _BoundChecksState();
}

class _BoundChecksState extends State<BoundChecks> {
  StreamSubscription<String?>? _subscription;
  String? _failure;

  @override
  void initState() {
    super.initState();
    _listen();
  }

  @override
  void didUpdateWidget(BoundChecks oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.checks != widget.checks ||
        oldWidget.dataContext != widget.dataContext) {
      _listen();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _listen() {
    _subscription?.cancel();
    final checks = switch (widget.checks) {
      final List<Object?> list => list.whereType<JsonMap>().toList(),
      _ => const <JsonMap>[],
    };
    _subscription = ValidationHelper.validateStream(
      checks,
      widget.dataContext,
    ).listen((failure) => setState(() => _failure = failure));
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _failure);
}
