import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/app_error.dart';
import 'app_message.dart';

part 'app_messages.g.dart';

@Riverpod(keepAlive: true)
class AppMessages extends _$AppMessages {
  @override
  AppMessage? build() => null;

  void showInfo({required String message, AppMessageAction? action}) =>
      state = AppMessage.create(
        type: AppMessageType.info,
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
