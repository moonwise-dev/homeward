import 'dart:convert';

import 'package:common/common.dart';

import 'markdown.dart';
import 'render_contract_sections.dart';

String renderCatalogSkill() {
  final commonTypes = jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>;
  final slices = renderDataModelSlices('###');
  final index = [
    for (final MapEntry(:key, :value) in componentIndex().entries)
      '- ${code(key)}: $value',
  ];
  final examples = [
    for (final component in homewardComponents)
      if (coreComponents.contains(component.name))
        for (final example in component.examples)
          '### ${component.name}: ${example.name}\n\n${fenced('json', compactCatalogJson(example.components))}',
  ];

  return '''
# Drawing The Interface

You draw with A2UI v0.9 messages on two kinds of surface:

- `$planSurfaceId`, the plan panel beside the conversation: what your tools produced for this household. Its `root` is a `Column`, and each child of `root` is drawn as a card of its own, the newest first. You create it the first time you have a result to show and change it in place after. A reply with nothing new to show sends no message for it.
- At most one inline ask per turn, named `t<turn>-<slug>` with the turn number from the turn context and a lowercase slug, such as `${InlineSurfaces.id(3, 'budget')}`: what you ask now, shown as a card in the conversation under your text. Its `root` is a `Choice`, a `Questions`, or a `Column` that holds a `Text` and a `Row` of `Button`s. You create and fill it in the same turn, and it never changes after.

Put what your tools produced on `$planSurfaceId` and what you ask in the inline ask. A reply that needs nothing from the buyer has no inline ask.

A sentence with buttons, for a yes or no or for what to look at next:
`{"version":"v0.9","updateComponents":{"surfaceId":"${InlineSurfaces.id(3, 'loans')}","components":[{"id":"root","component":"Column","children":["ask","answers"]},{"id":"ask","component":"Text","text":"I have assumed you have no other loans. Is that right?"},{"id":"answers","component":"Row","children":["yes","no"]},{"id":"yes","component":"Button","child":"yes-label","action":{"event":{"name":"confirm_no_other_loans","context":{"label":"Right, no other loans"}}}},{"id":"yes-label","component":"Text","text":"Right"},{"id":"no","component":"Button","child":"no-label","action":{"event":{"name":"say_other_loans","context":{"label":"We have other loans"}}}},{"id":"no-label","component":"Text","text":"We have other loans"}]}}`

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message has `"version": "v0.9"` and exactly one of `createSurface` or `updateComponents`. The server owns the data model and surfaces stay for the whole plan, so never send `updateDataModel` or `deleteSurface`.
- Before the components of a surface, send its `createSurface` line, which never carries components. For the plan panel it is exactly this line; it creates the panel the first time and changes nothing after:
  `${jsonEncode({
    'version': 'v0.9',
    'createSurface': {'surfaceId': planSurfaceId, 'catalogId': homewardCatalogId, 'sendDataModel': true},
  })}`
  An inline ask's line is the same with this turn's ID, such as:
  `${jsonEncode({
    'version': 'v0.9',
    'createSurface': {'surfaceId': InlineSurfaces.id(3, 'budget'), 'catalogId': homewardCatalogId, 'sendDataModel': true},
  })}`
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

## Components

The catalog schema below holds the full schemas of the components every plan uses: ${codeList(coreComponents)}. Every other component is listed here with what it is for. The tool that seeds a component's data answers with `draw`, that component ready to send, so draw it from there. Call `component_docs` only for a listed component no tool result has given you, once, with every one you are about to draw; its schema and examples stay with you for the rest of the plan.

${index.join('\n')}

${examples.isEmpty ? '' : '## Examples\n\n${examples.join('\n\n')}\n\n'}## Catalog Schema

Those components and the functions validate against this JSON Schema, and `component_docs` returns the schemas of the others in the same form. References to `$commonTypesFile` point at the common types after it.

${fenced('json', compactCatalogJson(coreCatalogDocument()))}

## Common Types

${fenced('json', compactCatalogJson(commonTypes))}
''';
}
