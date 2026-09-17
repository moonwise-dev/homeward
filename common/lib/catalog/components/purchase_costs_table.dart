import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../examples/funchal_example.dart';
import 'insight_properties.dart';

final class PurchaseCostsTable extends CatalogComponent {
  const PurchaseCostsTable();

  @override
  String get name => 'PurchaseCostsTable';

  @override
  String get description =>
      'Every upfront cost this buyer owes on the day, the total, and the cash '
      'needed with the down payment. A charge that is partly refunded shows '
      'what comes back and what earns it.';

  @override
  CatalogPhase get phase => CatalogPhase.mvp;

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
      componentsJson: scenarioInsightExample(name, 'purchaseCosts'),
      dataModel: funchalDataModel,
    ),
  ];
}
