import 'package:freezed_annotation/freezed_annotation.dart';

import '../../errors/app_error.dart';

part 'turn_failure.freezed.dart';

@freezed
abstract class TurnFailure with _$TurnFailure {
  const factory TurnFailure({
    required String entryId,
    required AppError error,
  }) = _TurnFailure;
}
