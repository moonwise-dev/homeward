import 'dart:convert';

import 'pacific_midnight.dart';

sealed class GeminiException implements Exception {
  const GeminiException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

final class GeminiKeyInvalid extends GeminiException {
  const GeminiKeyInvalid(super.message);
}

final class GeminiQuotaExhausted extends GeminiException {
  const GeminiQuotaExhausted(
    super.message, {
    required this.resetsAt,
    this.perModel = false,
  });

  final DateTime resetsAt;
  final bool perModel;
}

final class GeminiCreditsDepleted extends GeminiException {
  const GeminiCreditsDepleted(super.message);
}

final class GeminiUnavailable extends GeminiException {
  const GeminiUnavailable(super.message, {this.model});

  final String? model;
}

final class GeminiHistoryMissing extends GeminiException {
  const GeminiHistoryMissing(super.message);
}

final class GeminiRequestInvalid extends GeminiException {
  const GeminiRequestInvalid(super.message);
}

GeminiException geminiHttpError({
  required int statusCode,
  required String body,
  required String model,
  required bool continuesHistory,
  required DateTime now,
}) {
  final (code, message, reasons) = _errorOf(body);
  return switch (statusCode) {
    _ when _isOutOfCredits(message) => GeminiCreditsDepleted(message),
    402 => GeminiCreditsDepleted(message),
    401 || 403 => GeminiKeyInvalid(message),
    400 when reasons.contains('API_KEY_INVALID') => GeminiKeyInvalid(message),
    429 => _quotaError(message, now),
    400 || 404
        when continuesHistory &&
            (code == 'not_found' || code == 'invalid_request') =>
      GeminiHistoryMissing(message),
    >= 500 => GeminiUnavailable(message, model: model),
    _ when _isOverloaded(message) => GeminiUnavailable(message, model: model),
    _ => GeminiRequestInvalid(message),
  };
}

GeminiException geminiStreamError({
  required Map<String, Object?> error,
  required String model,
  required DateTime now,
}) {
  final message = error['message'] as String? ?? 'Gemini stream error';
  return switch (error['code']) {
    _ when _isOutOfCredits(message) => GeminiCreditsDepleted(message),
    'api_error' => GeminiUnavailable(message, model: model),
    'quota_exceeded' || 'too_many_requests' => _quotaError(message, now),
    _ when message.startsWith(_rateLimited) => _quotaError(message, now),
    _ when _isOverloaded(message) => GeminiUnavailable(message, model: model),
    _ => GeminiRequestInvalid(message),
  };
}

const _rateLimited = 'Rate limit exceeded';

bool _isOverloaded(String message) =>
    message.contains('high demand') || message.contains('overloaded');

bool _isOutOfCredits(String message) =>
    message.contains('prepayment credits are depleted');

GeminiException _quotaError(String message, DateTime now) =>
    GeminiQuotaExhausted(
      message,
      resetsAt: nextPacificMidnight(now),
      perModel:
          message.contains('generate_content_free_tier_requests') ||
          message.startsWith('$_rateLimited for model'),
    );

(Object?, String, Set<String>) _errorOf(String body) {
  try {
    final json = jsonDecode(body);
    final error = switch (json) {
      [{'error': final Map<String, Object?> error}, ...] => error,
      {'error': final Map<String, Object?> error} => error,
      _ => const <String, Object?>{},
    };
    return (
      error['code'],
      error['message'] as String? ?? 'Gemini error',
      {
        if (error['details'] case final List<Object?> details)
          for (final detail in details)
            if (detail case {'reason': final String reason}) reason,
      },
    );
  } on FormatException {
    return (null, 'Gemini error', const <String>{});
  }
}
