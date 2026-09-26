import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../examples/funchal_example.dart';
import '../examples/stockholm_example.dart';
import 'insight_properties.dart';

final class EligibilityChecklist extends CatalogComponent {
  const EligibilityChecklist();

  @override
  String get name => 'EligibilityChecklist';

  @override
  String get description =>
      'Every lending rule this buyer is measured against, each passing, '
      'warning, or failing, with what would settle it and what facts are '
      'still missing.';

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
      name: 'Funchal non-resident',
      componentsJson: scenarioInsightExample(name, 'eligibility'),
      dataModel: funchalDataModel,
    ),
    CatalogExample(
      name: 'Stockholm couple',
      componentsJson: scenarioInsightExample(name, 'eligibility'),
      dataModel: stockholmDataModel,
    ),
  ];
}
