import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../themes/motion.dart';

class AppPressable extends HookWidget {
  const AppPressable({
    required this.child,
    required this.onTap,
    required this.label,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.isSelected,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final String label;
  final Color? color;
  final BorderRadius borderRadius;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    final pressed = useState(false);
    final hovered = useState(false);
    final focused = useState(false);
    final onTap = this.onTap;
    final enabled = onTap != null;
    final duration = AppMotion.of(context, const Duration(milliseconds: 120));
    final color = this.color;
    return Semantics(
      button: true,
      enabled: enabled,
      selected: isSelected,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: FocusableActionDetector(
        enabled: enabled,
        mouseCursor: enabled ? SystemMouseCursors.click : MouseCursor.defer,
        onShowHoverHighlight: (value) => hovered.value = value,
        onShowFocusHighlight: (value) => focused.value = value,
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              onTap?.call();
              return null;
            },
          ),
        },
        shortcuts: const {
          SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
          SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: enabled ? (_) => pressed.value = true : null,
          onTapUp: enabled ? (_) => pressed.value = false : null,
          onTapCancel: enabled ? () => pressed.value = false : null,
          onTap: onTap,
          child: AnimatedScale(
            scale: pressed.value ? 0.97 : 1,
            duration: duration,
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: duration,
              decoration: BoxDecoration(
                color: color == null
                    ? null
                    : hovered.value
                    ? Color.lerp(color, Colors.black, 0.04)
                    : color,
                borderRadius: borderRadius,
                border: focused.value
                    ? Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      )
                    : null,
              ),
              child: Opacity(opacity: enabled ? 1 : 0.5, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
