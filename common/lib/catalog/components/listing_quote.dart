import 'package:json_schema_builder/json_schema_builder.dart';

import '../catalog_component.dart';
import '../catalog_schemas.dart';
import '../examples/reads_example.dart';

final class ListingQuote extends CatalogComponent {
  const ListingQuote();

  @override
  String get name => 'ListingQuote';

  @override
  String get description =>
      "One sample home read for the household's needs, from read_listings: "
      'each need with whether the listing meets it, rules it out, or says '
      "nothing, and the listing's own words highlighted.";

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'reading': CatalogSchemas.bound(
      'One home read_listings read, { "path": "/reads/<id>" }.',
    ),
  };

  @override
  List<String> get requiredProperties => ['reading'];

  @override
  List<String> get boundProperties => ['reading'];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'A flat in Nacka read for three needs',
      componentsJson: '''
[
  { "id": "root", "component": "ListingQuote", "reading": { "path": "/reads/sto-12" } }
]
''',
      dataModel: stockholmReadsDataModel,
    ),
  ];
}
