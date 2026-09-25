import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '../../data/services/development_server.dart';

part 'app_error.freezed.dart';

@freezed
sealed class AppError with _$AppError implements Exception {
  const AppError._();

  const factory AppError.server({
    required HomewardErrorCode code,
    required String message,
    Duration? retryAfter,
  }) = ServerAppError;

  const factory AppError.networkFailure() = NetworkFailureAppError;

  const factory AppError.developmentServerUnreachable(Uri server) =
      DevelopmentServerUnreachableAppError;

  const factory AppError.unknown(Object cause) = UnknownAppError;

  factory AppError.fromException(Object exception) => switch (exception) {
    final AppError error => error,
    HomewardApiException(:final code, :final message, :final retryAfter) =>
      AppError.server(code: code, message: message, retryAfter: retryAfter),
    DevelopmentServerUnreachable(:final server) =>
      AppError.developmentServerUnreachable(server),
    FirebaseException(code: 'network-request-failed') ||
    http.ClientException() => const AppError.networkFailure(),
    _ => AppError.unknown(exception),
  };

  String get humanMessage => switch (this) {
    ServerAppError(:final message) => message,
    NetworkFailureAppError() => 'Check your connection and try again.',
    DevelopmentServerUnreachableAppError(:final server) =>
      'Homeward\'s server is not running at $server. Start it with '
          'make server-dev, or start the app with make app-web, which starts '
          'it for you.',
    UnknownAppError() => 'Something went wrong. Try again.',
  };
}
