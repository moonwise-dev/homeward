import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class LoanBalanceChart extends CatalogComponent {
  const LoanBalanceChart();

  @override
  String get name => 'LoanBalanceChart';

  @override
  String get description =>
      'The loan paid down and the equity built year by year over the term '
      'at today\'s rate, from compute_affordability, with a slider over the '
      'years and, in Sweden, the years the amortization steps down.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'affordability': CatalogSchemas.slice(
      '/affordability',
      'Always { "path": "/affordability" }, after compute_affordability '
          'answered.',
    ),
  };

  @override
  List<String> get requiredProperties => ['affordability'];

  @override
  List<String> get boundProperties => ['affordability'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A Stockholm flat',
      componentsJson: _example,
      dataModel: monthlyCostDataModel,
    ),
    CatalogExample(
      name: 'A Funchal flat',
      componentsJson: _example,
      dataModel: funchalAffordabilityDataModel,
    ),
  ];

  static const _example = '''
[
  {
    "id": "root",
    "component": "LoanBalanceChart",
    "affordability": { "path": "/affordability" }
  }
]
''';
}
