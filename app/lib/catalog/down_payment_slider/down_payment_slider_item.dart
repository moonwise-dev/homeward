import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../catalog_item_for.dart';
import '../money_text.dart';
import 'down_payment_slider_view.dart';

final downPaymentSliderItem = catalogItemFor(const DownPaymentSlider(), (
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
  return DownPaymentSliderView(
    slice: slice,
    onApply: props.action('apply') == null
        ? null
        : (downPayment) => dispatchAction(
            node,
            'apply',
            adding: {
              'downPayment': moneyText(downPayment),
              'label': 'Put ${moneyText(downPayment)} down',
            },
          ),
  );
});
