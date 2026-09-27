import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class MortgageOptions extends CatalogComponent {
  const MortgageOptions();

  @override
  String get name => 'MortgageOptions';

  @override
  String get description =>
      "The sample lender's variable, fixed, and mixed rates side by side "
      'with the monthly cost of each, from compute_affordability; its choose '
      'action sends the one the buyer takes, with loanType added to its '
      'context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'affordability': CatalogSchemas.slice(
      '/affordability',
      'Always { "path": "/affordability" }, after compute_affordability '
          'answered.',
    ),
    'choose': CatalogSchemas.action,
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
    "component": "MortgageOptions",
    "affordability": { "path": "/affordability" },
    "choose": { "event": { "name": "choose_rate", "context": {} } }
  }
]
''';
}
