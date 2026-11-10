import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const mapSlice = DataSlice(
  'map',
  "The city's sample homes for this household, from map_homes: each priced "
      'for them, the places of their week, and the minutes from each area '
      'to each place.',
  [
    SliceField('cityName', FieldKind.text, 'The city'),
    SliceField(
      'highestPrice',
      FieldKind.money,
      'The highest price the rules allow, or the rent a month they can pay',
    ),
    SliceField(
      'homes',
      FieldKind.record,
      'Every sample home, priced for the household, with whether it is '
          'within the budget and its why; bind the whole slice to a HomeMap',
    ),
  ],
  seededBy: 'map_homes',
);
