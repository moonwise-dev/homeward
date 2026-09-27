import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const readsSlice = DataSlice(
  'reads',
  "Sample homes read_listings read for the household's needs: an object by "
      'home ID.',
  [
    SliceField(
      '<id>',
      FieldKind.record,
      'One home: { homeName, description, readings }. Bind it whole to a '
          'ListingQuote.',
    ),
  ],
  seededBy: 'read_listings',
);
