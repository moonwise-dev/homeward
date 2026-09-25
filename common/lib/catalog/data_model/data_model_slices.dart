import '../../markets/coverage.dart';
import '../../profile/employment.dart';
import '../../profile/property_use.dart';
import '../../profile/residency_intent.dart';
import '../../story/criterion_group.dart';
import '../../story/story_reason.dart';
import '../../story/travel_mode.dart';
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
      'coverage',
      FieldKind.choice,
      'Whether Homeward has curated rules here. An uncovered market carries '
          'only the market, its name, and this field.',
      choices: Coverage.values,
    ),
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

final storySlice = DataSlice(
  'story',
  'Why and where the buyer is moving, what they care about, and the homes or '
      'areas they are weighing. StoryDraft writes the answer fields as the '
      'buyer corrects the story, and commit_story folds them into the story '
      'and confirms it. anchors, candidates, criteria, and center are '
      'read-only and placed by the server.',
  [
    const SliceField(
      'reason',
      FieldKind.choice,
      'Why the buyer is moving.',
      choices: StoryReason.values,
    ),
    const SliceField('city', FieldKind.text, 'Where they are moving to.'),
    const SliceField(
      'mode',
      FieldKind.choice,
      'How they will travel to their anchors.',
      choices: TravelMode.values,
    ),
    const SliceField(
      'maxMinutes',
      FieldKind.integer,
      'The longest trip to an anchor they accept, in minutes.',
    ),
    for (final group in CriterionGroup.values)
      if (group != CriterionGroup.anchors)
        SliceField(
          'picks/${group.name}',
          FieldKind.criteria,
          'Criteria picked for ${group.label.toLowerCase()}.',
        ),
    const SliceField(
      'mustHaves',
      FieldKind.criteria,
      'Criteria the buyer will not give up.',
    ),
    const SliceField(
      'pins',
      FieldKind.record,
      'Places the buyer dropped on the map, by id: label, lat, lng. The map '
          'shows them and commit_story turns them into anchors.',
    ),
    const SliceField(
      'center',
      FieldKind.record,
      'Where the map opens: the city as lat and lng.',
    ),
    const SliceField(
      'markers',
      FieldKind.record,
      'Map markers for the city, the anchors, and the homes placed so far, for '
          'a Map before the assessment exists.',
    ),
    const SliceField(
      'anchors',
      FieldKind.record,
      'Places the buyer travels to: id, label, mode, maxMinutes, point.',
    ),
    const SliceField(
      'candidates',
      FieldKind.record,
      'Homes or areas being weighed: id, label, point, price.',
    ),
    const SliceField(
      'criteria',
      FieldKind.record,
      'What is weighed: kind, anchorId, mustHave.',
    ),
  ],
);

const assessmentSlice = DataSlice(
  'assessment',
  'How each home fits each criterion, measured by the server, read-only. '
      'Bind building blocks to its lists.',
  [
    SliceField(
      'candidates',
      FieldKind.record,
      'Each home with rank, score, missesMustHave, and pros, cons, and close '
          'as ready sentences.',
    ),
    SliceField(
      'rows',
      FieldKind.record,
      'One row per criterion: label, group, mustHave, and a cell per home '
          'with status fits, close, misses, or unknown, text, and detail.',
    ),
    SliceField(
      'markers',
      FieldKind.record,
      'Map markers for anchors, homes, and the nearest places found.',
    ),
    SliceField(
      'routes',
      FieldKind.record,
      'A route from each home to each anchor with its minutes and path.',
    ),
  ],
);

final dataModelSlices = [
  storySlice,
  assessmentSlice,
  selectionSlice,
  profileSlice,
  scenarioSlice,
  marketSlice,
  derivedSlice,
];
