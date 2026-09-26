import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../examples/stockholm_example.dart';
import 'insight_properties.dart';

final class AffordabilitySummary extends CatalogComponent {
  const AffordabilitySummary();

  @override
  String get name => 'AffordabilitySummary';

  @override
  String get description =>
      'The maximum loan, the rule that limits it, and headroom against the '
      'current scenario, computed from the rules. Show it after the profile '
      'is committed; never restate its figures in text.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

  @override
  CatalogPart get part => CatalogPart.deal;

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => scenarioInsightProperties();

  @override
  List<String> get requiredProperties => scenarioInsightRequired;

  @override
  List<String> get boundProperties => scenarioInsightRequired;

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Stockholm couple',
      componentsJson: scenarioInsightExample(name, 'affordability'),
      dataModel: stockholmDataModel,
    ),
  ];
}
