import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const homesSlice = DataSlice(
  'homes',
  'The sample homes search_homes found, each priced for the household: an '
      'object of homes by ID.',
  [
    SliceField(
      '<id>',
      FieldKind.record,
      'One home: { listing, cost }. Bind it whole to a HomeCard.',
    ),
  ],
  seededBy: 'search_homes',
);
