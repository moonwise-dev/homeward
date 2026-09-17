import 'package:freezed_annotation/freezed_annotation.dart';

import '../a2a/json_rpc.dart';
import '../homeward_error_code.dart';

part 'homeward_api_exception.freezed.dart';

@freezed
abstract class HomewardApiException
    with _$HomewardApiException
    implements Exception {
  const factory HomewardApiException({
    required HomewardErrorCode code,
    required String message,
    Duration? retryAfter,
  }) = _HomewardApiException;

  factory HomewardApiException.fromEnvelope(Map<String, Object?> error) =>
      HomewardApiException._of(error, error['message']);

  factory HomewardApiException.fromRpc(JsonRpcError error) =>
      HomewardApiException._of(error.data ?? const {}, error.message);

  factory HomewardApiException._of(
    Map<String, Object?> details,
    Object? message,
  ) => HomewardApiException(
    code: HomewardErrorCode.fromWire(details['code']),
    message: message is String ? message : 'Unexpected server error',
    retryAfter: switch (details['retryAfterSeconds']) {
      final int seconds => Duration(seconds: seconds),
      _ => null,
    },
  );
}
