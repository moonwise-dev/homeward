import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const swipeSlice = DataSlice(
  'swipe',
  'The deck search_homes dealt with deal: sample homes that differ.',
  [
    SliceField(
      'homes',
      FieldKind.record,
      'The deck in order, each { listing, cost }. Bind it to a HomeSwipe.',
    ),
  ],
  seededBy: 'search_homes',
);
