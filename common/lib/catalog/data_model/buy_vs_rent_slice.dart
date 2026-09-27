import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const buyVsRentSlice = DataSlice(
  'buyVsRent',
  'Buying a sample home against renting one like it, year by year, from '
      'compare_buy_rent.',
  [
    SliceField('price', FieldKind.money, 'The price of the home'),
    SliceField(
      'rent',
      FieldKind.record,
      "The rent a month: the buyer's or an estimate from the area, with its "
          'source',
    ),
    SliceField(
      'years',
      FieldKind.integer,
      'The years the buyer expects to stay',
    ),
    SliceField(
      'points',
      FieldKind.record,
      'What buying and renting have cost by each year; bind the whole slice '
          'to a BuyVsRent',
    ),
  ],
  seededBy: 'compare_buy_rent',
);
