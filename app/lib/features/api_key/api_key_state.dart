import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_key_state.freezed.dart';

@freezed
abstract class ApiKeyState with _$ApiKeyState {
  const factory ApiKeyState({
    required bool canForget,
    required bool hasSavedKey,
    @Default('') String key,
    @Default(false) bool remember,
    @Default(false) bool isVerifying,
    String? errorText,
  }) = _ApiKeyState;
}
