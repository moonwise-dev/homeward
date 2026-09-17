import 'package:common/common.dart';
import 'package:shelf/shelf.dart';

import '../errors/homeward_failure.dart';
import '../gemini/gemini_exception.dart';
import '../http/api_envelope.dart';
import '../request/request_values.dart';
import 'verify_gemini_key.dart';

final class KeysHandler {
  KeysHandler(this.verifyKey, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final VerifyGeminiKey verifyKey;
  final DateTime Function() _now;

  Future<Response> verify(Request request) async {
    final apiKey = request.geminiKey;
    if (apiKey == null) {
      return apiError(400, HomewardFailure.geminiKeyMissing);
    }
    try {
      await verifyKey(apiKey);
      return apiOk(200, const <String, Object?>{});
    } on GeminiException catch (error) {
      final failure = HomewardFailure.fromGemini(error, _now());
      return apiError(_statusOf(failure.code), failure);
    }
  }

  int _statusOf(HomewardErrorCode code) => switch (code) {
    HomewardErrorCode.geminiKeyInvalid => 422,
    HomewardErrorCode.geminiQuotaExhausted => 429,
    HomewardErrorCode.geminiCreditsDepleted => 402,
    HomewardErrorCode.geminiUnavailable => 503,
    _ => 500,
  };
}
