import 'package:freezed_annotation/freezed_annotation.dart';

import 'fit_status.dart';

part 'assessed_cell.freezed.dart';
part 'assessed_cell.g.dart';

@freezed
abstract class AssessedCell with _$AssessedCell {
  const factory AssessedCell({
    required String candidateId,
    required FitStatus status,
    required String text,
    String? detail,
  }) = _AssessedCell;

  factory AssessedCell.fromJson(Map<String, Object?> json) =>
      _$AssessedCellFromJson(json);
}
