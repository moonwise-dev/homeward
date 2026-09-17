import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_failure.freezed.dart';

@freezed
abstract class ValidationFailure with _$ValidationFailure {
  const factory ValidationFailure({
    required String surfaceId,
    required String path,
    required String message,
  }) = _ValidationFailure;

  const ValidationFailure._();

  static const validationFailed = 'VALIDATION_FAILED';

  Map<String, Object?> toJson() => {
    'version': 'v0.9',
    'error': {
      'code': validationFailed,
      'surfaceId': surfaceId,
      'path': path,
      'message': message,
    },
  };
}
