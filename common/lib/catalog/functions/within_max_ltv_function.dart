import 'package:a2ui_core/a2ui_core.dart';
import 'package:json_schema_builder/json_schema_builder.dart';

import '../../markets/resolved_market.dart';
import '../../markets/rule_section.dart';
import '../../money/rounding.dart';
import '../../plan/scenario.dart';
import '../catalog_schemas.dart';
import '../catalog_component.dart';
import 'catalog_function.dart';

final class WithinMaxLtvFunction extends CatalogFunction {
  const WithinMaxLtvFunction();

  @override
  String get name => 'withinMaxLtv';

  @override
  CatalogPart get part => CatalogPart.deal;

  @override
  String get description =>
      'Whether the scenario loan is within every loan-to-value limit that '
      'applies to this buyer. False while a lending rule is still pending.';

  @override
  A2uiReturnType get returnType => A2uiReturnType.boolean;

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
    if (scenario == null ||
        market == null ||
        market.missingFor(RuleSection.lending).isNotEmpty) {
      return false;
    }
    return market.lending.maxLtv.every(
      (limit) =>
          scenario.loan <=
          scenario.price.applyRate(limit.rate, rounding: Rounding.down),
    );
  }
}
