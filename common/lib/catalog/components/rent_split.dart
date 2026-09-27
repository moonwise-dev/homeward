import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/rent_example.dart';

final class RentSplit extends CatalogComponent {
  const RentSplit();

  @override
  String get name => 'RentSplit';

  @override
  String get description =>
      "A home's rent and bills split between the people sharing it, from "
      'split_rent: equally, by income, or by room size, which the buyer '
      'switches between; its choose action sends the rule they take, with '
      'rule added to its context.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'split': CatalogSchemas.slice(
      '/rentSplit',
      'Always { "path": "/rentSplit" }, after split_rent answered.',
    ),
    'choose': CatalogSchemas.action,
  };

  @override
  List<String> get requiredProperties => ['split'];

  @override
  List<String> get boundProperties => ['split'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Two friends in Graça',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "RentSplit",
    "split": { "path": "/rentSplit" },
    "choose": { "event": { "name": "choose_split", "context": {} } }
  }
]
''',
      dataModel: lisbonRentSplitDataModel,
    ),
  ];
}
