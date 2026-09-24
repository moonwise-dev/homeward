import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';

@freezed
abstract class AppMessage with _$AppMessage {
  const factory AppMessage({
    required String id,
    required AppMessageType type,
    required String message,
    AppMessageAction? action,
  }) = _AppMessage;

  factory AppMessage.create({
    required AppMessageType type,
    required String message,
    AppMessageAction? action,
  }) => AppMessage(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    type: type,
    message: message,
    action: action,
  );
}

@freezed
abstract class AppMessageAction with _$AppMessageAction {
  const factory AppMessageAction({
    required String label,
    required VoidCallback onPressed,
  }) = _AppMessageAction;
}

enum AppMessageType { info, error }
