import 'package:freezed_annotation/freezed_annotation.dart';

import 'criterion_kind.dart';

part 'criterion.freezed.dart';
part 'criterion.g.dart';

@freezed
abstract class Criterion with _$Criterion {
  const factory Criterion({
    required CriterionKind kind,
    String? anchorId,
    int? withinMeters,
    int? count,
    @Default(false) bool mustHave,
  }) = _Criterion;

  const Criterion._();

  factory Criterion.fromJson(Map<String, Object?> json) =>
      _$CriterionFromJson(json);

  int get radius => withinMeters ?? kind.withinMeters;

  int get threshold => count ?? kind.count;

  String get id => anchorId == null ? kind.name : '${kind.name}-$anchorId';
}
