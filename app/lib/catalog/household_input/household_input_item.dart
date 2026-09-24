import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import 'household_input_view.dart';
import '../catalog_item_for.dart';

final householdInputItem = catalogItemFor(const HouseholdInput(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundString(
    dataContext: dataContext,
    value: data['label'],
    builder: (context, label) => BoundParsed<int>(
      dataContext: dataContext,
      value: data['adults'],
      parse: integerOf,
      builder: (context, adults) => BoundParsed<List<int>>(
        dataContext: dataContext,
        value: data['childAges'],
        parse: integersOf,
        builder: (context, childAges) => HouseholdInputView(
          label: label ?? '',
          adults: adults,
          childAges: childAges,
          onAdultsChanged: (value) =>
              writeBinding(dataContext, data['adults'], value),
          onChildAgesChanged: (value) =>
              writeBinding(dataContext, data['childAges'], value),
        ),
      ),
    ),
  );
});
