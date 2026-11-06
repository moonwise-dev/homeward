import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import 'mortgage_options_view.dart';

final mortgageOptionsItem = catalogItemFor(const MortgageOptions(), (
  _,
  node,
  props,
  _,
) {
  final slice = jsonModelOf(
    props.value('affordability'),
    AffordabilitySlice.fromJson,
  );
  if (slice == null) {
    return const SizedBox.shrink();
  }
  return MortgageOptionsView(
    slice: slice,
    onChoose: props.action('choose') == null
        ? null
        : (option) => dispatchAction(
            node,
            'choose',
            adding: {
              'loanType': option.loanTypeId,
              'label': 'Take the rate ${option.label.toLowerCase()}',
            },
          ),
  );
});
