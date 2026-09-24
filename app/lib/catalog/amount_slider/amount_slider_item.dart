import 'package:common/common.dart';
import 'package:genui/genui.dart';
import 'package:intl/intl.dart';

import '../../ui/core/formats.dart';
import '../../ui/core/ui/app_amount_slider.dart';
import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';

final amountSliderItem = catalogItemFor(const AmountSlider(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundString(
    dataContext: dataContext,
    value: data['label'],
    builder: (context, label) => BoundParsed<LocaleTag>(
      dataContext: dataContext,
      value: {'path': marketSlice.pathOf('locale')},
      parse: localeOf,
      builder: (context, locale) => BoundParsed<DownPaymentBounds>(
        dataContext: dataContext,
        value: data['bounds'],
        parse: (value) => jsonModelOf(value, DownPaymentBounds.fromJson),
        builder: (context, bounds) => BoundParsed<Money>(
          dataContext: dataContext,
          value: data['shareOf'],
          parse: moneyOf,
          builder: (context, shareOf) => BoundParsed<Money>(
            dataContext: dataContext,
            value: data['value'],
            parse: moneyOf,
            builder: (context, value) {
              if (bounds == null) {
                return const WaitingForDetails();
              }
              final amount = value ?? bounds.min;
              final min = bounds.min.minorUnits;
              final max = bounds.max.minorUnits;
              final step = bounds.step.minorUnits;
              return AppAmountSlider(
                label: label ?? '',
                valueText: formatMoney(amount, locale),
                shareText: shareOf == null
                    ? null
                    : _formatShare(amount, shareOf),
                minText: formatMoney(bounds.min, locale),
                maxText: formatMoney(bounds.max, locale),
                value: amount.minorUnits.toDouble(),
                min: min.toDouble(),
                max: max.toDouble(),
                divisions: step > 0 && max > min ? (max - min) ~/ step : null,
                onChanged: (minorUnits) {
                  final steps = step > 0
                      ? ((minorUnits - min) / step).round()
                      : 0;
                  writeBinding(
                    dataContext,
                    data['value'],
                    amount
                        .copyWith(
                          minorUnits: (min + steps * step).clamp(min, max),
                        )
                        .toJson(),
                  );
                },
              );
            },
          ),
        ),
      ),
    ),
  );
});

final _share = NumberFormat.decimalPercentPattern(decimalDigits: 1);

String? _formatShare(Money part, Money whole) =>
    whole.isZero || part.currency != whole.currency
    ? null
    : _share.format(part.minorUnits / whole.minorUnits);
