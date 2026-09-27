import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import '../money_text.dart';
import 'down_payment_slider_view.dart';

final downPaymentSliderItem = catalogItemFor(const DownPaymentSlider(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  return BoundParsed<AffordabilitySlice>(
    dataContext: itemContext.dataContext,
    value: data['affordability'],
    parse: (value) => jsonModelOf(value, AffordabilitySlice.fromJson),
    builder: (context, slice) => slice == null
        ? const SizedBox.shrink()
        : DownPaymentSliderView(
            slice: slice,
            onApply: data['apply'] == null
                ? null
                : (downPayment) => dispatchAction(
                    itemContext,
                    data['apply'],
                    adding: {
                      'downPayment': moneyText(downPayment),
                      'label': 'Put ${moneyText(downPayment)} down',
                    },
                  ),
          ),
  );
});
