import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/affordability_example.dart';

final class RuleNote extends CatalogComponent {
  const RuleNote();

  @override
  String get name => 'RuleNote';

  @override
  String get description =>
      'One lending rule, the largest loan it allows, and its source, from '
      'compute_affordability.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'rule': CatalogSchemas.bound(
      'One rule compute_affordability checked: { "path": '
      '"/affordability/binding" } for the rule that limits the loan, or '
      '{ "path": "/affordability/checks/<n>" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['rule'];

  @override
  List<String> get boundProperties => ['rule'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'The rule that limits the loan',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "RuleNote",
    "rule": { "path": "/affordability/binding" }
  }
]
''',
      dataModel: affordabilityDataModel,
    ),
  ];
}
