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
  final profileForm = surfaceExamples.first;

  return '''
# Drawing The Interface

You show the buyer controls and results by writing A2UI v0.9 messages. The app renders each surface you create under your text in the chat.

## Writing Messages

- Write messages in one fenced block that opens with ```a2ui and closes with ```. Put one complete JSON message on each line and nothing else.
- Each message has `"version": "v0.9"` and exactly one of `createSurface` or `updateComponents`. The server owns the data model and removes surfaces, so never send `updateDataModel` or `deleteSurface`.
- Create at most ${InlineSurfaces.maxPerTurn} surfaces in a turn. Name each `t<turn>-<slug>`, with the turn number from the turn context and a lowercase slug, such as `${exampleSurfaceId(profileForm)}`. Never reuse a surface ID, and never use `${InlineSurfaces.boardId}`, which the server draws.
- Send `createSurface` first, with `"catalogId": "$homewardCatalogId"` and `"sendDataModel": true`. Then send one `updateComponents` with the whole component list of that surface.
- Components are a flat list. Containers name their children by ID in `child`, `children`, `tabs`, `trigger`, or `content`. Exactly one component has the ID `root`, every referenced ID exists, and every component is reachable from `root`.
- Every component validates against the catalog schema at the end: include every required property and no other.
- If the server rejects a message, you receive a `VALIDATION_FAILED` error with the surface ID, a JSON pointer into your message, and the reason. Send only that message again, corrected.

## Binding Data

The server seeds every surface with the slices below. Components read and write through bindings such as `{ "path": "${profileSlice.pathOf('savings')}" }`.

- Bind every amount, rate, and share. Never write a figure as a literal and never compute one; Homeward components compute their figures from the slices.
- Inputs bind the one field they write. Insights bind whole slices: ${codeList([
    for (final slice in [profileSlice, marketSlice, scenarioSlice]) '{ "path": "${slice.path}" }',
  ])}.
- Bind only paths listed here. An input may bind a field that has no value yet.
- Functions compute values for basic components, such as a check that keeps a button disabled until the rules are met: `{ "call": "withinMaxLtv", "args": { … } }`.

${renderDataModelSlices('###')}

## Actions

Buttons and pickers send actions as `{ "event": { "name": …, "context": { … } } }`. Context values are literals or bindings. Use only these names:

${renderActionsTable()}

## Surface Examples

${[for (final example in surfaceExamples) '### ${example.name}\n\n${fenced('a2ui', exampleMessages(example).join('\n'))}'].join('\n\n')}

## Component Examples

${[
    for (final component in homewardComponents)
      if (component.agentVisible)
        for (final example in component.examples) '### ${component.name}: ${example.name}\n\n${fenced('json', compact(example.components))}',
  ].join('\n\n')}

## Catalog Schema

Components and functions validate against this JSON Schema. References to `common_types.json` point at the common types after it.

${fenced('json', compact(homewardCatalogDocument()))}

## Common Types

${fenced('json', compact(commonTypes))}
''';
}
