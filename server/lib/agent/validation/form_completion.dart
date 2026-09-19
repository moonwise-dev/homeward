import 'package:common/common.dart';

import 'component_tree.dart';

const _labels = <String, String>{
  'citizenship': 'Citizenship',
  'taxResidence': 'Where you pay tax',
  'formerResident': 'Have you been tax resident there before?',
  'residencyIntent': 'Will you move there?',
  'use': 'How will you use the home?',
  'firstTime': 'Is this your first home?',
  'employment': 'How you earn',
  'age': 'Age of the oldest borrower',
  'netMonthlyIncome': 'Net monthly income',
  'grossMonthlyIncome': 'Gross monthly income',
  'monthlyDebtPayments': 'Monthly debt payments',
  'savings': 'Savings for the purchase',
  'borrowers': 'People on the loan',
  'adults': 'Who lives in the home?',
  'childAges': 'Who lives in the home?',
};

const _choiceLabels = <String, String>{
  'primary': 'My main home',
  'secondary': 'A second home',
  'investment': 'To let out',
  'becomeResident': 'Yes, I will live there',
  'stayResident': 'I already live there',
  'stayAbroad': 'No, I will stay where I am',
  'employed': 'Employed',
  'selfEmployed': 'Self-employed',
  'retired': 'Retired',
};

List<Map<String, Object?>> completingComponents({
  required Map<String, Map<String, Object?>> components,
  required Set<String> requiredPaths,
}) {
  final commit = components.values.firstWhere(
    (component) =>
        actionNames(component).contains(SurfaceAction.commitProfile.wireName),
    orElse: () => const {},
  );
  final commitId = commit['id'] as String?;
  if (commitId == null) {
    return const [];
  }
  final bound = {
    for (final component in components.values) ...boundPaths(component),
  };
  final missing = [
    for (final field in profileSlice.fields)
      if (requiredPaths.contains(profileSlice.pathOf(field.name)) &&
          !bound.contains(profileSlice.pathOf(field.name)))
        field,
  ];
  final holder = components.values.firstWhere(
    (component) => childReferences(component).contains(commitId),
    orElse: () => const {},
  );
  if (missing.isEmpty || holder['children'] is! List<Object?>) {
    return const [];
  }
  final added = <String, Map<String, Object?>>{};
  for (final field in missing) {
    final input = _inputFor(field);
    if (input case {'id': final String id} when !components.containsKey(id)) {
      added[id] = input;
    }
  }
  if (added.isEmpty) {
    return const [];
  }
  final children = [...holder['children']! as List<Object?>];
  children.insertAll(children.indexOf(commitId), added.keys);
  return [
    ...added.values,
    {...holder, 'children': children},
  ];
}

Map<String, Object?>? _inputFor(SliceField field) {
  final path = profileSlice.pathOf(field.name);
  final id = 'asked-${field.name}';
  final label = _labels[field.name] ?? field.name;
  return switch (field.kind) {
    FieldKind.money => {
      'id': id,
      'component': 'MoneyInput',
      'label': label,
      'value': {'path': path},
      'currency': {'path': '/market/currency'},
      if (field.name.contains('Monthly')) 'period': 'monthly',
    },
    FieldKind.country => {
      'id': id,
      'component': 'LocationPicker',
      'label': label,
      'value': {'path': path},
      'mode': 'country',
    },
    FieldKind.boolean => {
      'id': id,
      'component': 'CheckBox',
      'label': label,
      'value': {'path': path},
    },
    FieldKind.integer when field.name == 'adults' => _household,
    FieldKind.integer => {
      'id': id,
      'component': 'TextField',
      'label': label,
      'value': {'path': path},
      'variant': 'number',
    },
    FieldKind.choice => {
      'id': id,
      'component': 'ChoicePicker',
      'label': label,
      'value': {'path': path},
      'options': [
        for (final choice in field.choiceValues)
          {'label': _choiceLabels[choice] ?? choice, 'value': choice},
      ],
    },
    FieldKind.integers => _household,
    _ => null,
  };
}

Map<String, Object?> get _household => {
  'id': 'asked-household',
  'component': 'HouseholdInput',
  'label': _labels['adults']!,
  'adults': {'path': profileSlice.pathOf('adults')},
  'childAges': {'path': profileSlice.pathOf('childAges')},
};
