import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';
import 'money_input_view.dart';

final moneyInputItem = catalogItemFor(const MoneyInput(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final currency = '${data['currency'] ?? ''}'.toUpperCase();
  final period = data['period'] as String?;
  final path = switch (data['value']) {
    {'path': final String path} => path,
    _ => null,
  };
  return BoundParsed<num>(
    dataContext: itemContext.dataContext,
    value: data['value'],
    parse: (value) => switch (value) {
      {'amount': final num amount} => amount,
      _ => null,
    },
    builder: (context, amount) => MoneyInputView(
      label: '${data['label'] ?? ''}',
      currency: currency,
      period: period,
      amount: amount,
      onChanged: (amount) {
        if (path == null) {
          return;
        }
        itemContext.dataContext.update(
          DataPath(path),
          amount == null
              ? null
              : {
                  'amount': amount,
                  'currency': currency,
                  if (period == 'month' || period == 'year') 'per': period,
                },
        );
      },
    ),
  );
});
