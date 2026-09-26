import 'dart:convert';

import 'package:common/common.dart';

import 'markdown.dart';
import 'render_contract_sections.dart';

String renderCatalogSkill() {
  final commonTypes = jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>;
  final commonTypesId = commonTypes[r'$id']! as String;
  String compact(Object? json) =>
      jsonEncode(json).replaceAll(commonTypesId, 'common_types.json');
  final slices = renderDataModelSlices('###');
  final examples = [
    for (final component in homewardComponents)
      if (component.agentVisible)
        for (final example in component.examples)
          '### ${component.name}: ${example.name}\n\n${fenced('json', compact(example.components))}',
  ];

  return '''
# Drawing The Interface

You draw with A2UI v0.9 messages on two kinds of surface:

- `$planSurfaceId`, the plan panel beside the conversation: what you know about this household so far. You create it in your first reply and change it in place in every reply after.
- One inline ask per turn, named `t<turn>-<slug>` with the turn number from the turn context and a lowercase slug, such as `${InlineSurfaces.id(3, 'budget')}`: the one question or set of options you ask now, shown in the conversation under your text. You create and fill it in the same turn, and it never changes after.

Put what you know on `$planSurfaceId` and what you ask in the inline ask. A turn may change either, both, or neither.

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message has `"version": "v0.9"` and exactly one of `createSurface` or `updateComponents`. The server owns the data model and surfaces stay for the whole plan, so never send `updateDataModel` or `deleteSurface`.
- Before the components of a surface, send its `createSurface` line, which never carries components. For the plan panel it is exactly this line; it creates the panel the first time and changes nothing after:
  `${jsonEncode({
    'version': 'v0.9',
    'createSurface': {'surfaceId': planSurfaceId, 'catalogId': homewardCatalogId, 'sendDataModel': true},
  })}`
  An inline ask's line is the same with its own `surfaceId`.
- On the next line, send that surface's components in one `updateComponents` message: `{"version":"v0.9","updateComponents":{"surfaceId":"…","components":[…]}}`.
- The turn context's `screen` lists every component of `$planSurfaceId` as it stands now. When it is empty, `updateComponents` for `$planSurfaceId` holds the whole panel, starting from `root`. Otherwise it holds only the components that change, and the container whose children change: a component with an ID that exists replaces it, and a new ID adds one.
- An inline ask's `updateComponents` holds its whole tree, starting from `root`.
- If your text mentions something on the plan or in an ask, draw it in the same turn.
- Components are a flat list. Containers name their children by ID in `child`, `children`, `tabs`, `trigger`, or `content`. Exactly one component has the ID `root`, every referenced ID exists, and every component you send is reachable from `root`. To take something off the plan, drop its ID from its container's children.
- Every component validates against the catalog schema at the end: include every required property and no other.
- If the server rejects a message, you receive a `VALIDATION_FAILED` error with the surface ID, a JSON pointer into your message, and the reason. Send only that message again, corrected.

## Binding Data

- The server owns the data model. Never write a figure you worked out yourself as a literal; figures come from tools, and components bind them.
- An input may bind a path that has no value yet, such as `{ "path": "/notes" }`. What the buyer entered comes back to you with their next action.
${slices.isEmpty ? '' : '\nThe server seeds every surface with the slices below.\n\n$slices\n'}
## Actions

Buttons send actions as `{ "event": { "name": …, "context": { … } } }`. Name each action for what the buyer does, in lowercase words joined by underscores, such as `keep_home`. Context values are literals or bindings. You receive the action's name, its context, and the data model of its surface as the buyer's next message.

${examples.isEmpty ? '' : '## Component Examples\n\n${examples.join('\n\n')}\n\n'}## Catalog Schema

Components and functions validate against this JSON Schema. References to `common_types.json` point at the common types after it.

${fenced('json', compact(homewardCatalogDocument()))}

## Common Types

${fenced('json', compact(commonTypes))}
''';
}
