import 'package:common/common.dart';
import 'package:flutter/widgets.dart';
import 'package:genui/genui.dart';

import 'binding_parsers.dart';
import 'bound_parsed.dart';

class BoundScenarioSlices extends StatelessWidget {
  const BoundScenarioSlices({
    required this.dataContext,
    required this.data,
    required this.builder,
    super.key,
  });

  final DataContext dataContext;
  final JsonMap data;
  final Widget Function(
    BuildContext context,
    Scenario? scenario,
    ResolvedMarket? market,
    BuyerProfile? profile,
  )
  builder;

  @override
  Widget build(BuildContext context) => BoundParsed<Scenario>(
    dataContext: dataContext,
    value: data['scenario'],
    parse: (value) => jsonModelOf(value, Scenario.fromJson),
    builder: (context, scenario) => BoundParsed<ResolvedMarket>(
      dataContext: dataContext,
      value: data['market'],
      parse: (value) => jsonModelOf(value, ResolvedMarket.fromJson),
      builder: (context, market) => BoundParsed<BuyerProfile>(
        dataContext: dataContext,
        value: data['profile'],
        parse: (value) => jsonModelOf(value, BuyerProfile.fromJson),
        builder: (context, profile) =>
            builder(context, scenario, market, profile),
      ),
    ),
  );
}
