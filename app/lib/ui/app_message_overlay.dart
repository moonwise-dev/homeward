import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../messages/app_message.dart';
import 'app_sizes.dart';
import 'app_spacing.dart';
import 'app_toast.dart';

const _toastDuration = Duration(seconds: 4);
const _actionToastDuration = Duration(seconds: 8);

class AppMessageOverlay extends HookWidget {
  const AppMessageOverlay({
    required this.child,
    required this.message,
    required this.onDismiss,
    super.key,
  });

  final Widget child;
  final AppMessage? message;
  final ValueChanged<String> onDismiss;

  @override
  Widget build(BuildContext context) {
    final message = this.message;

    useEffect(() {
      if (message == null) {
        return null;
      }
      final timer = Timer(
        message.action == null ? _toastDuration : _actionToastDuration,
        () => onDismiss(message.id),
      );
      return timer.cancel;
    }, [message?.id]);

    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: AppSizes.toastWidth,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: message == null
                        ? const SizedBox(width: double.infinity)
                        : Material(
                            key: ValueKey(message.id),
                            type: MaterialType.transparency,
                            child: AppToast(
                              type: message.type,
                              message: message.message,
                              actionLabel: message.action?.label,
                              onAction: switch (message.action) {
                                final action? => () {
                                  action.onPressed();
                                  onDismiss(message.id);
                                },
                                null => null,
                              },
                              onDismiss: () => onDismiss(message.id),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
