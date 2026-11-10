import 'package:common/common.dart';

import 'markdown.dart';

String renderDataModelSlices(
  String heading, {
  Iterable<DataSlice> slices = dataModelSlices,
}) => [
  for (final slice in slices)
    [
      '$heading ${code(slice.path)}',
      '${slice.description} Seeded by ${code(slice.seededBy)}.',
      markdownTable(
        ['Path', 'Value', 'Meaning'],
        [
          for (final field in slice.fields)
            [code(slice.pathOf(field.name)), field.shape, field.description],
        ],
      ),
    ].join('\n\n'),
].join('\n\n');
