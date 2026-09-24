import 'package:freezed_annotation/freezed_annotation.dart';

import 'assessed_cell.dart';

part 'assessed_row.freezed.dart';
part 'assessed_row.g.dart';

@freezed
abstract class AssessedRow with _$AssessedRow {
  const factory AssessedRow({
    required String id,
    required String label,
    required String group,
    required bool mustHave,
    required List<AssessedCell> cells,
  }) = _AssessedRow;

  factory AssessedRow.fromJson(Map<String, Object?> json) =>
      _$AssessedRowFromJson(json);
}
