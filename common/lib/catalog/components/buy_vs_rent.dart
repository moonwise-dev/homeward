import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/rent_example.dart';

final class BuyVsRent extends CatalogComponent {
  const BuyVsRent();

  @override
  String get name => 'BuyVsRent';

  @override
  String get description =>
      'Buying a sample home against renting one like it, from '
      'compare_buy_rent: what each has cost by every year, the equity built, '
      'and the year buying comes out cheaper, with a slider over the years '
      'the buyer expects to stay.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'comparison': CatalogSchemas.slice(
      '/buyVsRent',
      'Always { "path": "/buyVsRent" }, after compare_buy_rent answered.',
    ),
  };

  @override
  List<String> get requiredProperties => ['comparison'];

  @override
  List<String> get boundProperties => ['comparison'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A flat in Nacka over seven years',
      componentsJson: '''
[
  {
    "id": "root",
    "component": "BuyVsRent",
    "comparison": { "path": "/buyVsRent" }
  }
]
''',
      dataModel: stockholmBuyVsRentDataModel,
    ),
  ];
}
