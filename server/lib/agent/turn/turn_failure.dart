import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../gemini/gemini_exception.dart';

part 'turn_failure.freezed.dart';

@freezed
abstract class TurnFailure with _$TurnFailure {
  const factory TurnFailure({
    required HomewardErrorCode code,
    required String message,
    Duration? retryAfter,
  }) = _TurnFailure;

  factory TurnFailure.fromGemini(GeminiException error, DateTime now) =>
      switch (error) {
        GeminiKeyInvalid() => const TurnFailure(
          code: HomewardErrorCode.geminiKeyInvalid,
          message: 'Gemini did not accept your API key',
        ),
        GeminiQuotaExhausted(:final resetsAt) => TurnFailure(
          code: HomewardErrorCode.geminiQuotaExhausted,
          message: 'Your Gemini key has used up its requests for today',
          retryAfter: resetsAt.difference(now),
        ),
        GeminiUnavailable() => const TurnFailure(
          code: HomewardErrorCode.geminiUnavailable,
          message: 'Gemini is overloaded right now; try again shortly',
        ),
        GeminiHistoryMissing() || GeminiRequestInvalid() => internal,
      };

  static const internal = TurnFailure(
    code: HomewardErrorCode.internal,
    message: 'Something went wrong on our side',
  );

  static const sessionNotFound = TurnFailure(
    code: HomewardErrorCode.sessionNotFound,
    message: 'This plan does not exist',
  );

  static const turnInProgress = TurnFailure(
    code: HomewardErrorCode.turnInProgress,
    message: 'Another message in this plan is still being answered',
  );
}
