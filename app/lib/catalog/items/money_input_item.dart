import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../../display/amount_period_label.dart';
import '../../display/money_format.dart';
import '../../ui/app_money_field.dart';
import '../bindings/binding_actions.dart';
import '../bindings/binding_parsers.dart';
import '../bindings/bound_checks.dart';
import '../bindings/bound_parsed.dart';
import 'catalog_item_for.dart';

final moneyInputItem = catalogItemFor(const MoneyInput(), (itemContext) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  return BoundString(
    dataContext: dataContext,
    value: data['label'],
    builder: (context, label) => BoundParsed<Currency>(
      dataContext: dataContext,
      value: data['currency'],
      parse: currencyOf,
      builder: (context, currency) => BoundParsed<LocaleTag>(
        dataContext: dataContext,
        value: {'path': marketSlice.pathOf('locale')},
        parse: localeOf,
        builder: (context, locale) => BoundParsed<Money>(
          dataContext: dataContext,
          value: data['value'],
          parse: moneyOf,
          builder: (context, money) => BoundChecks(
            dataContext: dataContext,
            checks: data['checks'],
            builder: (context, failure) {
              final unit = currency ?? money?.currency;
              return AppMoneyField(
                label: label ?? '',
                majorUnits: money == null ? null : majorUnitsOf(money).round(),
                unitLabel: [
                  if (unit != null) moneyFormatFor(unit, locale).currencySymbol,
                  ?amountPeriodLabel(data['period'] as String?),
                ].join(' '),
                errorText: failure,
                enabled: unit != null,
                onChanged: (majorUnits) => writeBinding(
                  dataContext,
                  data['value'],
                  majorUnits == null || unit == null
                      ? null
                      : moneyFromMajorUnits(majorUnits, unit).toJson(),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
});
