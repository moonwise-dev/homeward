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

The buyer sees two kinds of surface. You write A2UI v0.9 `updateComponents` messages for what you ask, and almost never for the plan:

- `$planSurfaceId`, the plan panel beside the conversation: what your tools produced for this household. Its `root` is a `Column`, and each child of `root` is drawn as a card of its own, the newest first. A tool that works something out puts its cards on the plan as it answers, and names them under `draw`, each as an `id` and the component it is. To add a card that waits under `ready`, take one off, or put one first, call `arrange_plan`. So you send no message for `$planSurfaceId`, and never a card's own component; the one exception is a component you write yourself, below.
- At most one inline ask per turn, named `t<turn>-<slug>` with the turn number from the turn context and a lowercase slug, such as `${InlineSurfaces.id(3, 'budget')}`: what you ask now, shown as a card in the conversation under your text. Its `root` is a `Choice`, a `Questions`, or a `Row` of `Button`s that answer the question your text ends with. You write every component of an ask yourself, in one message, and it never changes after.

Put what your tools produced on `$planSurfaceId` and what you ask in the inline ask. A reply that needs nothing from the buyer has no inline ask.

Buttons, for a yes or no or for what to look at next. The last sentence of your text asks the question, here "Shall I look for homes within reach, or measure your week from the flat you named?", so the ask holds the buttons and never the question again, one for each thing to do and none for declining:
`{"version":"v0.9","updateComponents":{"surfaceId":"${InlineSurfaces.id(3, 'next')}","components":[{"id":"root","component":"Row","children":["homes","week"]},{"id":"homes","component":"Button","child":"homes-label","action":{"event":{"name":"look_for_homes","context":{"label":"Look for homes"}}}},{"id":"homes-label","component":"Text","text":"Look for homes"},{"id":"week","component":"Button","child":"week-label","action":{"event":{"name":"measure_week","context":{"label":"Measure our week"}}}},{"id":"week-label","component":"Text","text":"Measure our week"}]}}`

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message is `{"version":"v0.9","updateComponents":{"surfaceId":"…","components":[…]}}`. A surface is created the first time you send components for it, so never send `createSurface`. The server owns the data model and surfaces stay for the whole plan, so never send `updateDataModel` or `deleteSurface`.
- The turn context's `screen` lists every component of `$planSurfaceId` as it stands now, and `ready` lists the cards your tools handed you that are not on it, such as the ones under `drawWhenAsked`; `arrange_plan` shows and removes them.
- A component you write yourself for the plan, such as a `PlanOverview` the buyer asked for, is the one message you send for `$planSurfaceId`: `root` with every ID you still want shown and the new one, and the component in full.
- An inline ask's `updateComponents` holds its whole tree, starting from `root`.
- If your text mentions something on the plan or in an ask, draw it in the same turn.
- Components are a flat list. Containers name their children by ID in `child`, `children`, `tabs`, `trigger`, or `content`. Exactly one component has the ID `root`, every ID a container names is a card you were handed, a component on the screen, or one you send, and every component you send is reachable from `root`.
- Every component you write validates against the catalog schema at the end: include every required property and no other.
- If the server rejects a message, you receive a `VALIDATION_FAILED` error with the surface ID, a JSON pointer into your message, and the reason. Send only that message again, corrected.

## Binding Data

- The server owns the data model. Never write a figure you worked out yourself as a literal; figures come from tools, and components bind them.
- An input may bind a path that has no value yet, such as `{ "path": "/notes" }`. What the buyer entered comes back to you with their next action.
${slices.isEmpty ? '' : '\nThe server seeds every surface with the slices below.\n\n$slices\n'}
## Actions

Buttons send actions as `{ "event": { "name": …, "context": { … } } }`. Name each action for what the buyer does, in lowercase words joined by underscores, such as `keep_home`. Context values are literals or bindings. You receive the action's name, its context, and the data model of its surface as the buyer's next message.

## Components

The catalog schema below holds the full schemas of the components every plan uses: ${codeList(coreComponents)}. Every other component is listed here with what it is for. The tool that seeds a component's data puts the card for it on the plan and names it under `draw`, so you never write it. Call `component_docs` only for a listed component you write yourself, once, with every one you are about to draw; its schema and examples stay with you for the rest of the plan.

${index.join('\n')}

${examples.isEmpty ? '' : '## Examples\n\n${examples.join('\n\n')}\n\n'}## Catalog Schema

Those components and the functions validate against this JSON Schema, and `component_docs` returns the schemas of the others in the same form. References to `$commonTypesFile` point at the common types after it.

${fenced('json', compactCatalogJson(coreCatalogDocument()))}

## Common Types

${fenced('json', compactCatalogJson(commonTypes))}
''';
}
