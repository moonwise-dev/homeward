import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'mortgage_options_view.dart';

final mortgageOptionsItem = catalogItemFor(const MortgageOptions(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<AffordabilitySlice>(
    dataContext: itemContext.dataContext,
    value: data['affordability'],
    parse: (value) => jsonModelOf(value, AffordabilitySlice.fromJson),
    builder: (context, slice) => slice == null
        ? const SizedBox.shrink()
        : MortgageOptionsView(
            slice: slice,
            onChoose: data['choose'] == null
                ? null
                : (option) => dispatchAction(
                    itemContext,
                    data['choose'],
                    adding: {
                      'loanType': option.loanTypeId,
                      'label': 'Take the rate ${option.label.toLowerCase()}',
                    },
                  ),
          ),
  );
});
