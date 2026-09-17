import 'package:common/common.dart';

import 'markdown.dart';

String renderDataModelSlices(String heading) => [
  for (final slice in dataModelSlices)
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

String renderActionsTable() => markdownTable(
  ['Name', 'Context', 'Meaning'],
  [
    for (final action in SurfaceAction.values)
      [code(action.wireName), codeList(action.contextKeys), action.purpose],
  ],
);
