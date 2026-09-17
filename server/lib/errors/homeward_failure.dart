import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../gemini/gemini_exception.dart';

part 'homeward_failure.freezed.dart';

@freezed
abstract class HomewardFailure with _$HomewardFailure {
  const HomewardFailure._();

  const factory HomewardFailure({
    required HomewardErrorCode code,
    required String message,
    Duration? retryAfter,
  }) = _HomewardFailure;

  factory HomewardFailure.fromGemini(GeminiException error, DateTime now) =>
      switch (error) {
        GeminiKeyInvalid() => const HomewardFailure(
          code: HomewardErrorCode.geminiKeyInvalid,
          message: 'Gemini did not accept your API key',
        ),
        GeminiQuotaExhausted(:final resetsAt) => HomewardFailure(
          code: HomewardErrorCode.geminiQuotaExhausted,
          message: 'Your Gemini key has used up its requests for today',
          retryAfter: resetsAt.difference(now),
        ),
        GeminiCreditsDepleted() => const HomewardFailure(
          code: HomewardErrorCode.geminiCreditsDepleted,
          message:
              'The project behind your Gemini key has run out of prepaid '
              'credits',
        ),
        GeminiUnavailable() => const HomewardFailure(
          code: HomewardErrorCode.geminiUnavailable,
          message: 'Gemini is overloaded right now; try again shortly',
        ),
        GeminiHistoryMissing() || GeminiRequestInvalid() => internal,
      };

  int? get retryAfterSeconds => switch (retryAfter) {
    final retryAfter? => (retryAfter.inMilliseconds / 1000).ceil(),
    null => null,
  };

  static const internal = HomewardFailure(
    code: HomewardErrorCode.internal,
    message: 'Something went wrong on our side',
  );

  static const sessionNotFound = HomewardFailure(
    code: HomewardErrorCode.sessionNotFound,
    message: 'This plan does not exist',
  );

  static const geminiKeyMissing = HomewardFailure(
    code: HomewardErrorCode.geminiKeyMissing,
    message: 'Add your Gemini API key to continue',
  );

  static const unauthenticated = HomewardFailure(
    code: HomewardErrorCode.unauthenticated,
    message: 'Sign in again to continue',
  );

  static const appCheckFailed = HomewardFailure(
    code: HomewardErrorCode.appCheckFailed,
    message: 'This app could not be verified; reload and try again',
  );

  static HomewardFailure rateLimited(Duration retryAfter) => HomewardFailure(
    code: HomewardErrorCode.rateLimited,
    message: 'Too many messages in a short time; wait a moment',
    retryAfter: retryAfter,
  );

  static const turnInProgress = HomewardFailure(
    code: HomewardErrorCode.turnInProgress,
    message: 'Another message in this plan is still being answered',
  );
}
