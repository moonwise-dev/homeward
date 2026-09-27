import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const savingsPlanSlice = DataSlice(
  'savingsPlan',
  'How long until the savings cover the cash the home in /affordability '
      'needs on the day, from plan_savings.',
  [
    SliceField(
      'cashNeeded',
      FieldKind.money,
      'The cash the home needs on the day',
    ),
    SliceField('toSave', FieldKind.money, 'What is still to save'),
    SliceField(
      'months',
      FieldKind.integer,
      'The months to go at the monthly saving; bind the whole slice to a '
          'SavingsPlan',
    ),
  ],
  seededBy: 'plan_savings',
);
