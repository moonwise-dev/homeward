import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

import '../../affordability/scenario_payment.dart';
import '../../markets/resolved_market.dart';
import '../../plan/scenario.dart';
import '../catalog_schemas.dart';
import 'catalog_function.dart';

final class MonthlyPaymentFunction extends CatalogFunction {
  const MonthlyPaymentFunction();

  @override
  String get name => 'monthlyPayment';

  @override
  String get description =>
      'First monthly payment for the scenario, interest plus amortization, '
      'as a money object. Null until the scenario and market are complete.';

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
      return scenarioPayment(scenario, market).total.toJson();
    } on ArgumentError {
      return null;
    }
  }
}
