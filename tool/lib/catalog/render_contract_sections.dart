import 'package:common/common.dart';

import 'markdown.dart';

String renderDataModelSlices(String heading, {bool deal = true}) => [
  for (final slice in dataModelSlices)
    if (deal || slice.part == CatalogPart.story)
      [
        '$heading ${code(slice.path)}',
        slice.description,
        markdownTable(
          ['Path', 'Value', 'Meaning'],
          [
            for (final field in slice.fields)
              [code(slice.pathOf(field.name)), field.shape, field.description],
          ],
        ),
      ].join('\n\n'),
].join('\n\n');

String renderActionsTable({bool deal = true}) => markdownTable(
  ['Name', 'Context', 'Meaning'],
  [
    for (final action in SurfaceAction.values)
      if (deal || action.part == CatalogPart.story)
        [code(action.wireName), codeList(action.contextKeys), action.purpose],
  ],
);
