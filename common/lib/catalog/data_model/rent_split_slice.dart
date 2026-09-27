import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const rentSplitSlice = DataSlice(
  'rentSplit',
  "A home's rent and bills split between the people sharing it, by each rule "
      'split_rent could work out.',
  [
    SliceField(
      'rent',
      FieldKind.record,
      "The rent a month: the buyer's or an estimate from the area, with its "
          'source',
    ),
    SliceField('bills', FieldKind.money, 'The bills a month the buyer stated'),
    SliceField(
      'splits',
      FieldKind.record,
      "Each rule's parts per person; bind the whole slice to a RentSplit",
    ),
  ],
  seededBy: 'split_rent',
);
