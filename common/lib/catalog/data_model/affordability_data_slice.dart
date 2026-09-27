import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const affordabilityDataSlice = DataSlice(
  'affordability',
  'What compute_affordability found for this household, from sample rules.',
  [
    SliceField('price', FieldKind.money, 'The price assessed'),
    SliceField(
      'maxPrice',
      FieldKind.money,
      'The highest price the savings and rules allow',
    ),
    SliceField(
      'maxLoan',
      FieldKind.money,
      'The largest loan the rules allow at the price',
    ),
    SliceField(
      'binding',
      FieldKind.record,
      'The rule that limits the loan; bind it to a RuleNote',
    ),
    SliceField(
      'checks',
      FieldKind.record,
      'Every rule checked, in order; bind one to a RuleNote as /affordability/checks/<n>',
    ),
  ],
  seededBy: 'compute_affordability',
);
