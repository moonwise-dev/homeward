import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import '../rent_text.dart';
import 'rent_split_view.dart';

final rentSplitItem = catalogItemFor(const RentSplit(), (itemContext) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<RentSplitSlice>(
    dataContext: itemContext.dataContext,
    value: data['split'],
    parse: (value) => jsonModelOf(value, RentSplitSlice.fromJson),
    builder: (context, slice) => slice == null
        ? const SizedBox.shrink()
        : RentSplitView(
            slice: slice,
            onChoose: data['choose'] == null
                ? null
                : (rule) => dispatchAction(
                    itemContext,
                    data['choose'],
                    adding: {
                      'rule': rule.name,
                      'label':
                          'Split the rent ${splitRuleLabel(rule).toLowerCase()}',
                    },
                  ),
          ),
  );
});
