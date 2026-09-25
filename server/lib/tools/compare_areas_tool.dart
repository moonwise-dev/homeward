import 'package:common/common.dart';

import '../research/open_data/open_data_unavailable.dart';
import '../research/open_data/routing.dart';
import 'agent_tool.dart';

final class CompareAreasTool extends ModelTool {
  const CompareAreasTool(this._routing);

  final Routing _routing;

  @override
  String get name => 'compare_areas';

  @override
  String get description =>
      "Price two or three ways to live in the buyer's city for a TradeOff: "
      'each an area from case.areas, a home type that area has a price for, '
      'and the rooms the household needs. The server estimates each size and '
      "price from the area's price per square metre and times the trip from "
      'the area to their first placed anchor. Only for a city with sample '
      'homes; pick areas that differ in what the buyer is weighing.';

  @override
  Map<String, Object?> get parameters => {
    'type': 'object',
    'properties': {
      'options': {
        'type': 'array',
        'minItems': 2,
        'maxItems': 3,
        'items': {
          'type': 'object',
          'properties': {
            'areaId': {
              'type': 'string',
              'description': 'An area id from case.areas.',
            },
            'homeType': {
              'type': 'string',
              'enum': [for (final type in HomeType.values) type.name],
            },
            'rooms': {
              'type': 'integer',
              'description': 'Rooms including the living room.',
            },
          },
          'required': ['areaId', 'homeType', 'rooms'],
        },
      },
    },
    'required': ['options'],
  };

  @override
  Future<ToolResult> run(
    Map<String, Object?> arguments,
    ToolContext context,
  ) async {
    final plan = context.plan;
    final story = plan.story;
    final city = context.markets.samples.city(story.sampleCity);
    if (city == null) {
      return const ToolResult(
        modelResult: {'error': "The buyer's city has no sample areas"},
      );
    }
    final anchor = story.anchors
        .where((anchor) => anchor.point != null)
        .firstOrNull;
    final rejected = <Map<String, Object?>>[];
    final options = <AreaOption>[];
    for (final item in [
      for (final item in arguments['options'] as List<Object?>? ?? const [])
        if (item is Map<String, Object?>) item,
    ].take(3)) {
      final area = city.areaWith(item['areaId'] as String? ?? '');
      final type = HomeType.values
          .where((type) => type.name == item['homeType'])
          .firstOrNull;
      final rooms = (item['rooms'] as num?)?.toInt() ?? 3;
      final perM2 = type == null ? null : area?.pricePerM2(type);
      if (area == null || type == null || perM2 == null) {
        rejected.add({
          'areaId': item['areaId'],
          'reason': area == null
              ? 'Not an area of ${city.name}'
              : 'No ${type?.noun ?? 'home'} prices in ${area.name}',
        });
        continue;
      }
      final size = typicalSizeM2(type, rooms);
      final minutes = anchor == null
          ? null
          : await _minutes(area, anchor, context);
      options.add(
        AreaOption(
          id: 'o${options.length + 1}',
          areaId: area.id,
          areaName: area.name,
          character: area.character,
          homeType: type,
          rooms: rooms,
          sizeM2: size,
          price: _rounded(perM2 * size, city.currency),
          pricePerM2: Money(
            minorUnits: perM2 * 100,
            currency: city.currency,
          ),
          priceSource: city.priceSourceOf(area),
          minutes: minutes,
          mode: minutes == null ? null : anchor!.mode,
          anchorLabel: minutes == null ? null : anchor!.label,
        ),
      );
    }
    if (options.length < 2) {
      return ToolResult(
        modelResult: {
          'error': 'A trade-off needs two options that could be priced',
          'rejected': rejected,
        },
      );
    }
    return ToolResult(
      modelResult: {
        'options': [
          for (final option in options)
            {
              'id': option.id,
              'area': option.areaName,
              'homeType': option.homeType.name,
              'rooms': option.rooms,
              'sizeM2': option.sizeM2,
              'timed': option.minutes != null,
            },
        ],
        if (rejected.isNotEmpty) 'rejected': rejected,
      },
      seeds: {
        tradeOffSlice.name: {
          'options': [for (final option in options) option.toJson()],
        },
      },
      plan: plan.copyWith(story: story.copyWith(areaOptions: options)),
    );
  }

  Future<int?> _minutes(
    SampleArea area,
    Anchor anchor,
    ToolContext context,
  ) => context.steps.track(
    'Timing the trip from ${area.name} to ${anchor.label} ${anchor.mode.phrase}',
    () async {
      try {
        final route = await _routing.route(
          area.point,
          anchor.point!,
          anchor.mode,
        );
        return route is RouteMeasurement ? route.minutes : null;
      } on OpenDataUnavailable {
        return null;
      }
    },
    measured: (minutes) => minutes != null,
  );

  Money _rounded(int amount, Currency currency) {
    final step = currency.code == 'SEK' ? 10000 : 5000;
    return Money(
      minorUnits: (amount / step).round() * step * 100,
      currency: currency,
    );
  }
}
