import 'dart:convert';

import 'package:common/common.dart';

import 'example_messages.dart';
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

You show the buyer controls and results by writing A2UI v0.9 messages. The app renders each surface you create under your text in the chat.

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message has `"version": "v0.9"` and exactly one of `createSurface` or `updateComponents`. The server owns the data model and removes surfaces, so never send `updateDataModel` or `deleteSurface`.
- Create at most ${InlineSurfaces.maxPerTurn} surfaces in a turn. Name each `t<turn>-<slug>`, with the turn number from the turn context and a lowercase slug, such as `${InlineSurfaces.id(exampleTurn, 'week')}`. Never reuse a surface ID.
- Send `createSurface` first, with `"catalogId": "$homewardCatalogId"` and `"sendDataModel": true`. Then send one `updateComponents` with the whole component list of that surface.
- Components are a flat list. Containers name their children by ID in `child`, `children`, `tabs`, `trigger`, or `content`. Exactly one component has the ID `root`, every referenced ID exists, and every component is reachable from `root`.
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
