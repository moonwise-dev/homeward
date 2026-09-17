enum HomewardErrorCode {
  unauthenticated('unauthenticated'),
  appCheckFailed('app_check_failed'),
  geminiKeyMissing('gemini_key_missing'),
  geminiKeyInvalid('gemini_key_invalid'),
  geminiQuotaExhausted('gemini_quota_exhausted'),
  geminiUnavailable('gemini_unavailable'),
  rateLimited('rate_limited'),
  turnInProgress('turn_in_progress'),
  sessionNotFound('session_not_found'),
  validationFailed('validation_failed'),
  internal('internal');

  const HomewardErrorCode(this.wireName);

  final String wireName;

  static HomewardErrorCode fromWire(Object? wireName) => values.firstWhere(
    (code) => code.wireName == wireName,
    orElse: () => internal,
  );
}
