import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const marketsSlice = DataSlice(
  'markets',
  'Cities at a glance from look_up_market: an object by city ID.',
  [
    SliceField(
      '<city>',
      FieldKind.record,
      "One city: the sample lender's rates, the lending rules, and each "
          "area's median price and rent per square metre. Bind it whole to a "
          'MarketSnapshotCard.',
    ),
  ],
  seededBy: 'look_up_market',
);
