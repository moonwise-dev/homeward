import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'affordability_summary_view.dart';

final affordabilitySummaryItem = catalogItemFor(const AffordabilitySummary(), (
  _,
  _,
  props,
  _,
) {
  final slice = jsonModelOf(
    props.value('affordability'),
    AffordabilitySlice.fromJson,
  );
  return slice == null
      ? const SizedBox.shrink()
      : AffordabilitySummaryView(slice: slice);
});
