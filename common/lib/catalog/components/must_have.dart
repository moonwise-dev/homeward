import 'package:json_schema_builder/json_schema_builder.dart';

import '../../areas/home_funnel.dart';
import '../catalog_component.dart';
import '../examples/home_map_example.dart';

final class MustHave extends CatalogComponent {
  const MustHave();

  @override
  String get name => 'MustHave';

  @override
  CatalogFamily get family => CatalogFamily.homes;

  @override
  String get description =>
      'One must-have the buyer can turn on to narrow the homes on the map, '
      'such as two bedrooms for a family or a lift for a parent who visits. '
      'It shows how many homes it would keep before it is tapped, and the '
      'map narrows at once, without a reply. Kinds: '
      '${[for (final kind in MustHaveKind.values) '${kind.name}, ${kind.meaning}'].join('; ')}.';

  @override
  bool get agentVisible => true;

  @override
  Map<String, Schema> get properties => {
    'kind': Schema.string(
      enumValues: [for (final kind in MustHaveKind.values) kind.name],
    ),
    'atLeast': Schema.integer(
      description:
          'Only for bedrooms, size, and builtAfter: the fewest bedrooms, '
          'square metres, or the earliest year.',
    ),
    'label': Schema.string(
      description:
          'At most four words, in the buyer\'s terms, such as "Room for the '
          'twins" or "A lift for Mum". No figures beyond the one in atLeast.',
    ),
  };

  @override
  List<String> get requiredProperties => ['kind', 'label'];

  @override
  List<String> get boundProperties => const [];

  @override
  List<CatalogExample> get examples => [
    CatalogExample(
      name: 'Must-haves for a couple working at KTH',
      componentsJson: '''
[
  { "id": "root", "component": "Row", "children": ["rooms", "outside"] },
  {
    "id": "rooms",
    "component": "MustHave",
    "kind": "bedrooms",
    "atLeast": 2,
    "label": "A room for guests"
  },
  {
    "id": "outside",
    "component": "MustHave",
    "kind": "balcony",
    "label": "Somewhere outside"
  }
]
''',
      dataModel: stockholmHomeMapDataModel,
    ),
  ];
}
