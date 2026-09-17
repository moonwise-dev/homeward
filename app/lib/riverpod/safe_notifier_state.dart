import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../messages/app_message_action.dart';
import '../messages/app_message_controller.dart';

mixin SafeNotifierState<StateT, ValueT> on AnyNotifier<StateT, ValueT> {
  void setState(StateT Function(StateT state) update) {
    if (!ref.mounted) {
      return;
    }
    state = update(state);
  }

  StreamSubscription<T> subscribe<T>(
    Stream<T> stream,
    void Function(T data) onData, {
    void Function(Object error)? onError,
    bool showsErrorMessage = true,
  }) {
    final subscription = stream.listen(
      onData,
      onError: (Object error, StackTrace stackTrace) {
        logError(error, stackTrace);
        if (showsErrorMessage) {
          showErrorMessage(error: error);
        }
        onError?.call(error);
      },
    );
    ref.onDispose(subscription.cancel);
    return subscription;
  }

  void logError(Object error, StackTrace stackTrace) =>
      log('Error in $runtimeType', error: error, stackTrace: stackTrace);

  void showInfoMessage({required String message, AppMessageAction? action}) {
    if (ref.mounted) {
      ref
          .read(appMessageControllerProvider.notifier)
          .showInfo(message: message, action: action);
    }
  }

  void showErrorMessage({required Object error, AppMessageAction? action}) {
    if (ref.mounted) {
      ref
          .read(appMessageControllerProvider.notifier)
          .showError(error: error, action: action);
    }
  }
}
