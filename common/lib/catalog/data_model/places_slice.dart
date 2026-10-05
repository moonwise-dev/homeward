import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const placesSlice = DataSlice(
  'places',
  'The places the buyer named, found with find_place: an object of places by '
      'ID.',
  [
    SliceField(
      '<id>',
      FieldKind.record,
      'One place: { id, name, address, point }. Bind the whole slice to '
          'the markers of a WeekMap.',
    ),
  ],
  seededBy: 'find_place',
);
