import 'dart:async';

import 'package:common/common.dart';
import 'package:genui/genui.dart';

import '../../ui/core/ui/app_coverage_badge.dart';
import '../../ui/core/ui/app_select_field.dart';
import '../bindings/binding_actions.dart';
import '../bindings/bound_parsed.dart';
import '../catalog_item_for.dart';

final locationPickerItem = catalogItemFor(const LocationPicker(), (
  itemContext,
) {
  final data = itemContext.data as JsonMap;
  final dataContext = itemContext.dataContext;
  final isMarket = data['mode'] == 'market';
  return BoundString(
    dataContext: dataContext,
    value: data['label'],
    builder: (context, label) => BoundParsed<List<AppSelectOption<String>>>(
      dataContext: dataContext,
      value: isMarket ? {'path': selectionSlice.pathOf('candidates')} : null,
      parse: (value) => isMarket ? _marketOptions(value) : _countryOptions,
      builder: (context, options) => BoundString(
        dataContext: dataContext,
        value: data['value'],
        builder: (context, code) => AppSelectField<String>(
          label: label ?? '',
          options: options ?? const [],
          value: code,
          enableFilter: !isMarket,
          onChanged: (selected) {
            writeBinding(dataContext, data['value'], selected);
            unawaited(dispatchAction(itemContext, data['action']));
          },
        ),
      ),
    ),
  );
});

final _countryOptions = [
  for (final MapEntry(key: code, value: name)
      in (countryNames.entries.toList()
        ..sort((a, b) => a.value.compareTo(b.value))))
    AppSelectOption(value: code, label: name),
];

List<AppSelectOption<String>> _marketOptions(Object? candidates) => [
  if (candidates case final List<Object?> list)
    for (final candidate in list)
      if (candidate case {
        'marketId': final String marketId,
        'name': final String name,
        'coverage': final String coverage,
      })
        AppSelectOption(
          value: marketId,
          label: name,
          trailing: AppCoverageBadge(
            isCurated: coverage == Coverage.curated.name,
          ),
        ),
];
