import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'comparison_table_view.dart';

final comparisonTableItem = catalogItemFor(const ComparisonTable(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundParsed<List<AssessedRow>>(
    dataContext: dataContext,
    value: data['rows'],
    parse: (value) => jsonModelsOf(value, AssessedRow.fromJson),
    builder: (context, rows) => BoundParsed<List<AssessedCandidate>>(
      dataContext: dataContext,
      value: data['homes'],
      parse: (value) => jsonModelsOf(value, AssessedCandidate.fromJson),
      builder: (context, homes) => rows == null || homes == null
          ? const WaitingForDetails()
          : ComparisonTableView(rows: rows, homes: homes),
    ),
  );
});
