import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/savings_example.dart';

final class SavingsPlan extends CatalogComponent {
  const SavingsPlan();

  @override
  String get name => 'SavingsPlan';

  @override
  String get description =>
      'How long until the savings cover the cash the home in /affordability '
      'needs on the day, at the monthly saving the buyer stated, from '
      'plan_savings: what is still to save, the months to go, and the month '
      'they get there.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'plan': CatalogSchemas.slice(
      '/savingsPlan',
      'Always { "path": "/savingsPlan" }, after plan_savings answered.',
    ),
  };

  @override
  List<String> get requiredProperties => ['plan'];

  @override
  List<String> get boundProperties => ['plan'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Saving for a flat in Nacka',
      componentsJson: _example,
      dataModel: stockholmSavingsPlanDataModel,
    ),
    CatalogExample(
      name: 'Savings that already cover it',
      componentsJson: _example,
      dataModel: coveredSavingsPlanDataModel,
    ),
  ];

  static const _example = '''
[
  { "id": "root", "component": "SavingsPlan", "plan": { "path": "/savingsPlan" } }
]
''';
}
