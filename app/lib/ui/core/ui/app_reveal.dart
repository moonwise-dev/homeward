import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/motion.dart';

class AppReveal extends HookWidget {
  const AppReveal({
    required this.child,
    this.alignment = 0,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final double alignment;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (!enabled) {
        return null;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          Scrollable.ensureVisible(
            context,
            alignment: alignment,
            duration: AppMotion.of(context, AppMotion.page),
            curve: AppMotion.curve,
          );
        }
      });
      return null;
    }, const []);
    return child;
  }
}
