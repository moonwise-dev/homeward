import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../errors/app_error.dart';
import 'app_message.dart';
import 'app_message_action.dart';
import 'app_message_type.dart';

part 'app_message_controller.g.dart';

@Riverpod(keepAlive: true)
class AppMessageController extends _$AppMessageController {
  @override
  AppMessage? build() => null;

  void showInfo({required String message, AppMessageAction? action}) =>
      state = AppMessage.create(
        type: AppMessageType.info,
        message: message,
        action: action,
      );

  void showSuccess({required String message, AppMessageAction? action}) =>
      state = AppMessage.create(
        type: AppMessageType.success,
        message: message,
        action: action,
      );

  void showError({required Object error, AppMessageAction? action}) =>
      state = AppMessage.create(
        type: AppMessageType.error,
        message: AppError.fromException(error).humanMessage,
        action: action,
      );

  void clear({required String messageId}) {
    if (state?.id == messageId) {
      state = null;
    }
  }
}
