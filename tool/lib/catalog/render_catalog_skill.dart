import 'dart:convert';

import 'package:common/common.dart';

import 'markdown.dart';
import 'render_contract_sections.dart';

String renderCatalogSkill() {
  final commonTypes = jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>;
  final slices = renderDataModelSlices(
    '###',
    slices: [affordabilityDataSlice, placesSlice, mapSlice],
  );
  final examples = [
    for (final component in homewardComponents)
      if (askComponents.contains(component.name))
        for (final example in component.examples)
          '### ${component.name}: ${example.name}\n\n${fenced('json', compactCatalogJson(example.components))}',
  ];

  return '''
# Drawing The Interface

The app is one screen: the household's facts as chips, a row of must-haves under them, and a map of the city's sample homes with what each costs them a month and how many are left. The app draws the chips, the map, and every figure from what your tools seed. You write A2UI v1.0 `updateComponents` messages only for the row under the chips:

- `$planSurfaceId` holds what your tools produced, such as the `HomeMap` that map_homes draws. You never send a message for `$planSurfaceId`.
- At most one inline surface per turn, named `t<turn>-<slug>` with the turn number from the turn context and a lowercase slug, such as `${InlineSurfaces.id(1, 'musts')}`. Once the homes are on the map, its `root` is a `Row` of two to four `MustHave`s chosen for this household, each splitting the homes in budget: never one that keeps all of them or none. Before then, when you need a fact only the buyer knows, it is one `Questions` card, or a `Choice` when a figure they gave looks wrong. You write every component of it yourself, in one message, and it never changes after.

Must-haves for a couple who work at KTH and want a guest room, after map_homes answered that some homes in budget have two bedrooms and some a balcony:
`{"version":"1.0","updateComponents":{"surfaceId":"${InlineSurfaces.id(1, 'musts')}","components":[{"id":"root","component":"Row","children":["rooms","outside"]},{"id":"rooms","component":"MustHave","kind":"bedrooms","atLeast":2,"label":"A room for guests"},{"id":"outside","component":"MustHave","kind":"balcony","label":"Somewhere outside"}]}}`

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message is `{"version":"1.0","updateComponents":{"surfaceId":"…","components":[…]}}`. A surface is created the first time you send components for it, so never send `createSurface`. The server owns the data model and surfaces stay for the whole plan, so never send `updateDataModel` or `deleteSurface`.
- An inline ask's `updateComponents` holds its whole tree, starting from `root`.
- Components are a flat list. An ID is letters, digits, and underscores, such as `homes_label`. Containers name their children by ID in `child` or `children`. Exactly one component has the ID `root`, every ID a container names is one you send, and every component you send is reachable from `root`.
- Every component you write validates against the catalog schema at the end: include every required property and no other.
- If the server rejects a message, you receive a `VALIDATION_FAILED` error with the surface ID, a JSON pointer into your message, and the reason. Send only that message again, corrected.

## Binding Data

- The server owns the data model. Never write a figure you worked out yourself as a literal; figures come from tools, and components bind them.
- An input may bind a path that has no value yet, such as `{ "@path": "/notes" }`. What the buyer entered comes back to you with their next action.
${slices.isEmpty ? '' : '\nThe server seeds every surface with the slices below.\n\n$slices\n'}
## Actions

Buttons send actions as `{ "event": { "name": …, "context": { … } } }`. Name each action for what the buyer does, in lowercase words joined by underscores, such as `keep_home`. Context values are literals or bindings. You receive the action's name, its context, and the data model of its surface as the buyer's next message.

## Components

The catalog schema below holds the full schemas of the components you write: ${codeList(askComponents)}. Every other block, the map included, is the app's or a tool's, so you never write it.

${examples.isEmpty ? '' : '## Examples\n\n${examples.join('\n\n')}\n\n'}## Catalog Schema

Those components and the functions validate against this JSON Schema. References to `$commonTypesFile` point at the common types after it.

${fenced('json', compactCatalogJson(coreCatalogDocument(names: askComponents)))}

## Common Types

${fenced('json', compactCatalogJson(commonTypes))}
''';
}
