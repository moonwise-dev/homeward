import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/gemini_key_repository.dart';
import '../../../data/repositories/key_verification_repository.dart';
import '../../../domain/models/app_error.dart';
import '../../../utils/safe_notifier_state.dart';

part 'api_key_view_model.freezed.dart';
part 'api_key_view_model.g.dart';

@riverpod
class ApiKeyViewModel extends _$ApiKeyViewModel
    with SafeNotifierState<ApiKeyState, ApiKeyState> {
  @override
  ApiKeyState build() => ApiKeyState(
    canForget: ref.watch(geminiKeyRepositoryProvider).canForget,
    hasSavedKey: ref.watch(geminiKeyProvider).value != null,
  );

  void updateKey(String key) =>
      setState((current) => current.copyWith(key: key, errorText: null));

  void updateRemember(bool remember) =>
      setState((current) => current.copyWith(remember: remember));

  Future<bool> verifyAndSave() async {
    final key = state.key.trim();
    final remember = state.remember;
    final verification = ref.read(keyVerificationRepositoryProvider);
    final geminiKey = ref.read(geminiKeyProvider.notifier);
    if (key.isEmpty) {
      setState(
        (current) => current.copyWith(errorText: 'Paste your Gemini key first'),
      );
      return false;
    }
    setState(
      (current) => current.copyWith(isVerifying: true, errorText: null),
    );
    try {
      await verification.verify(key);
      await geminiKey.save(key, remember: remember);
      return true;
    } on Object catch (error, stackTrace) {
      if (error case ServerAppError(
        code: HomewardErrorCode.geminiKeyInvalid,
      )) {
        setState(
          (current) => current.copyWith(
            errorText:
                'Gemini did not accept this key. Check you copied all of it.',
          ),
        );
        return false;
      }
      logError(error, stackTrace);
      showErrorMessage(error: error);
      return false;
    } finally {
      setState((current) => current.copyWith(isVerifying: false));
    }
  }

  Future<void> removeKey() async {
    final geminiKey = ref.read(geminiKeyProvider.notifier);
    try {
      await geminiKey.remove();
      showInfoMessage(message: 'Your Gemini key was removed from this device');
    } on Object catch (error, stackTrace) {
      logError(error, stackTrace);
      showErrorMessage(error: error);
    }
  }
}

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
