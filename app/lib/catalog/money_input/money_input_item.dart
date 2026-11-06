import 'package:common/common.dart';

import '../catalog_item_for.dart';
import 'money_input_view.dart';

final moneyInputItem = catalogItemFor(const MoneyInput(), (_, _, props, _) {
  final currency = (props.string('currency') ?? '').toUpperCase();
  final period = props.string('period');
  final value = props.writable('value');
  return MoneyInputView(
    label: props.string('label') ?? '',
    currency: currency,
    period: period,
    amount: switch (props.value('value')) {
      {'amount': final num amount} => amount,
      _ => null,
    },
    onChanged: (amount) => value?.set(
      amount == null
          ? null
          : {
              'amount': amount,
              'currency': currency,
              if (period == 'month' || period == 'year') 'per': period,
            },
    ),
  );
});
