import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const briefSlice = DataSlice(
  'brief',
  'What Homeward learned about the household, written with update_brief: an '
      'object of items by ID.',
  [
    SliceField(
      '<id>',
      FieldKind.record,
      'One item: { id, kind, text, source, words }. Bind it whole to a Fact.',
    ),
  ],
  seededBy: 'update_brief',
);
