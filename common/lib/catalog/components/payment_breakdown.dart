import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../examples/stockholm_example.dart';
import 'insight_properties.dart';

final class PaymentBreakdown extends CatalogComponent {
  const PaymentBreakdown();

  @override
  String get name => 'PaymentBreakdown';

  @override
  String get description =>
      'The first monthly payment split into interest and amortization, with '
      'fees, the total, and in Sweden the cost after the interest deduction.';

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
      name: 'Stockholm couple',
      componentsJson: scenarioInsightExample(name, 'payment'),
      dataModel: stockholmDataModel,
    ),
  ];
}
