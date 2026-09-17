import '../../profile/employment.dart';
import '../../profile/property_use.dart';
import '../../profile/residency_intent.dart';
import 'data_slice.dart';
import 'field_kind.dart';
import 'slice_field.dart';

const selectionSlice = DataSlice(
  'selection',
  'What the buyer is picking before it is saved.',
  [
    SliceField(
      'marketId',
      FieldKind.market,
      'The market picked in a LocationPicker in market mode.',
    ),
    SliceField(
      'candidates',
      FieldKind.record,
      'Markets that match the place the buyer named, with coverage.',
    ),
  ],
);

const profileSlice = DataSlice(
  'profile',
  'The buyer profile. Inputs write one field each; insights bind the whole '
      'slice.',
  [
    SliceField('citizenship', FieldKind.country, 'Country of citizenship.'),
    SliceField(
      'taxResidence',
      FieldKind.country,
      'Country the buyer pays tax in.',
    ),
    SliceField(
      'formerResident',
      FieldKind.boolean,
      'Ever tax resident in the target market.',
    ),
    SliceField(
      'residencyIntent',
      FieldKind.choice,
      'Whether the buyer plans to become tax resident in the target market.',
      choices: ResidencyIntent.values,
    ),
    SliceField(
      'use',
      FieldKind.choice,
      'How the buyer will use the home.',
      choices: PropertyUse.values,
    ),
    SliceField(
      'firstTime',
      FieldKind.boolean,
      'Buying a home for the first time.',
    ),
    SliceField(
      'employment',
      FieldKind.choice,
      'How the main borrower earns an income.',
      choices: Employment.values,
    ),
    SliceField('age', FieldKind.integer, 'Age of the oldest borrower.'),
    SliceField(
      'netMonthlyIncome',
      FieldKind.money,
      'Household income per month after tax, in the currency it is paid in.',
    ),
    SliceField(
      'grossMonthlyIncome',
      FieldKind.money,
      'Household income per month before tax, in the currency it is paid in.',
    ),
    SliceField(
      'monthlyDebtPayments',
      FieldKind.money,
      'Payments on existing loans and credit per month.',
    ),
    SliceField('savings', FieldKind.money, 'Cash available for the purchase.'),
    SliceField('borrowers', FieldKind.integer, 'People named on the loan.'),
    SliceField('adults', FieldKind.integer, 'Adults in the household.'),
    SliceField('childAges', FieldKind.integers, 'Age of each child at home.'),
  ],
);

const scenarioSlice = DataSlice(
  'scenario',
  'The purchase being tried. Inputs write one field each; insights bind the '
      'whole slice.',
  [
    SliceField('price', FieldKind.money, 'Price of the home.'),
    SliceField('downPayment', FieldKind.money, 'Cash the buyer puts down.'),
    SliceField('termYears', FieldKind.integer, 'Loan term in years.'),
    SliceField(
      'loanTypeId',
      FieldKind.text,
      'A loan type id from the market, such as variable-3m.',
    ),
    SliceField(
      'rateSpreadPpm',
      FieldKind.ppm,
      "Lender's margin over the reference rate.",
    ),
    SliceField('rateShockPpm', FieldKind.ppm, 'Rate rise to test against.'),
    SliceField(
      'associationFee',
      FieldKind.money,
      'Monthly fee to the housing association.',
    ),
  ],
);

const marketSlice = DataSlice(
  'market',
  'The rules of the selected market that apply to this buyer, read-only. '
      'Insights bind the whole slice.',
  [
    SliceField('id', FieldKind.market, 'The market.'),
    SliceField('name', FieldKind.text, 'Market name in English.'),
    SliceField(
      'currency',
      FieldKind.currency,
      'Currency of prices and loans; bind it as the currency of money inputs.',
    ),
  ],
);

const derivedSlice = DataSlice(
  'derived',
  'Figures the server computed for the scenario, read-only.',
  [
    SliceField(
      'affordability',
      FieldKind.record,
      'Maximum loan, the binding limit, and each check.',
    ),
    SliceField(
      'downPaymentBounds',
      FieldKind.moneyBounds,
      'Down payment range the rules allow; bind it as AmountSlider bounds.',
    ),
    SliceField(
      'payment',
      FieldKind.record,
      'First monthly interest, amortization, and total.',
    ),
  ],
);

const dataModelSlices = [
  selectionSlice,
  profileSlice,
  scenarioSlice,
  marketSlice,
  derivedSlice,
];
