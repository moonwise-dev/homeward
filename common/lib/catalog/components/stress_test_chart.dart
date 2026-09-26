import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../examples/funchal_example.dart';
import '../examples/stockholm_example.dart';
import 'insight_properties.dart';

final class StressTestChart extends CatalogComponent {
  const StressTestChart();

  @override
  String get name => 'StressTestChart';

  @override
  String get description =>
      'Monthly cost from today\'s rate up past the rate the lender tests, '
      'against the most this buyer can pay each month, with today and the '
      'stress rate marked.';

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
      componentsJson: scenarioInsightExample(name, 'stressTest'),
      dataModel: stockholmDataModel,
    ),
    CatalogExample(
      name: 'Funchal non-resident',
      componentsJson: scenarioInsightExample(name, 'stressTest'),
      dataModel: funchalDataModel,
    ),
  ];
}
