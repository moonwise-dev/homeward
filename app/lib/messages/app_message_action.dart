import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message_action.freezed.dart';

@freezed
abstract class AppMessageAction with _$AppMessageAction {
  const factory AppMessageAction({
    required String label,
    required VoidCallback onPressed,
  }) = _AppMessageAction;
}
