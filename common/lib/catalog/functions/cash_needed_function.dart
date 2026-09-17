import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

import '../../costs/purchase_costs.dart';
import '../../markets/resolved_market.dart';
import '../../plan/scenario.dart';
import '../catalog_schemas.dart';
import 'catalog_function.dart';

final class CashNeededFunction extends CatalogFunction {
  const CashNeededFunction();

  @override
  String get name => 'cashNeeded';

  @override
  String get description =>
      'The down payment plus every upfront cost, as a money object. Null '
      'until the facts that pick the charges are answered.';

  @override
  A2uiReturnType get returnType => A2uiReturnType.object;

  @override
  Schema get argumentSchema => Schema.object(
    properties: {
      'scenario': CatalogSchemas.scenario,
      'market': CatalogSchemas.market,
    },
    required: ['scenario', 'market'],
    additionalProperties: false,
  );

  @override
  Object? evaluate(Map<String, Object?> args) {
    final scenario = parseArgument(args, 'scenario', Scenario.fromJson);
    final market = parseArgument(args, 'market', ResolvedMarket.fromJson);
    if (scenario == null || market == null) {
      return null;
    }
    try {
      return switch (estimatePurchaseCosts(
        scenario: scenario,
        market: market,
      )) {
        EstimatedPurchaseCosts(:final cashNeeded) => cashNeeded.toJson(),
        IncompletePurchaseCosts() => null,
      };
    } on ArgumentError {
      return null;
    }
  }
}
