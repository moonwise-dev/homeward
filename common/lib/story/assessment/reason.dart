import 'package:freezed_annotation/freezed_annotation.dart';

import 'fit_status.dart';

part 'reason.freezed.dart';
part 'reason.g.dart';

enum ReasonSource { listing, measured, buyer }

@freezed
abstract class Reason with _$Reason {
  const factory Reason({
    required String text,
    required ReasonSource source,
    required FitStatus status,
    String? quote,
  }) = _Reason;

  factory Reason.fromJson(Map<String, Object?> json) => _$ReasonFromJson(json);
}
