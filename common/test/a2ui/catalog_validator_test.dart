import 'package:common/common.dart';
import 'package:test/test.dart';

void main() {
  final document = homewardCatalogDocument();
  final validator = CatalogValidator(document);

  test('the Homeward catalog document composes basic and Homeward parts', () {
    expect(a2uiSpecCommit, hasLength(40));
    expect(document[r'$id'], homewardCatalogId);
    expect(validator.componentNames, {
      ...agentVisibleBasicComponents,
      for (final component in homewardComponents) component.name,
    });
    expect(validator.componentNames, isNot(contains('Slider')));
    expect(
      (document['functions']! as Map<String, Object?>).keys,
      containsAll(['formatCurrency', 'and', 'monthlyPayment', 'withinMaxLtv']),
    );
  });

  test('accepts basic components calling Homeward and basic functions', () {
    final valid = <Map<String, Object?>>[
      {
        'id': 'title',
        'component': 'Text',
        'text': 'Your budget',
        'variant': 'h3',
      },
      {
        'id': 'root',
        'component': 'Column',
        'children': ['title', 'commit'],
      },
      {
        'id': 'commit',
        'component': 'Button',
        'child': 'commit_label',
        'variant': 'primary',
        'checks': [
          {
            'condition': {
              'call': 'withinMaxLtv',
              'args': {
                'scenario': {'path': '/scenario'},
                'market': {'path': '/market'},
              },
            },
            'message': 'Down payment is below the minimum',
          },
        ],
        'action': {
          'event': {
            'name': 'commit_scenario',
            'context': {'scenarioPath': '/scenario'},
          },
        },
      },
      {
        'id': 'name',
        'component': 'TextField',
        'label': 'Name',
        'value': {'path': '/profile/name'},
        'checks': [
          {
            'condition': {
              'call': 'required',
              'args': {
                'value': {'path': '/profile/name'},
              },
            },
            'message': 'Required',
          },
        ],
      },
    ];
    for (final component in valid) {
      expect(
        validator.validateComponent(component),
        isEmpty,
        reason: '$component',
      );
    }
  });

  test(
    'refuses unknown functions and misspelled, missing, or mistyped properties',
    () {
      final invalid = <Map<String, Object?>>[
        {'id': 'a', 'component': 'Text', 'label': 'Budget'},
        {'id': 'b', 'component': 'Text', 'text': 'Budget', 'colour': 'red'},
        {'id': 'c', 'component': 'Text', 'text': 'Budget', 'variant': 'huge'},
        {'id': 'd', 'component': 'Column', 'children': 'title'},
        {'component': 'Divider'},
        {
          'id': 'e',
          'component': 'Button',
          'child': 'label',
          'action': {
            'event': {'name': 'go'},
          },
          'checks': [
            {
              'condition': {
                'call': 'isAffordable',
                'args': {
                  'scenario': {'path': '/scenario'},
                },
              },
              'message': 'No',
            },
          ],
        },
      ];
      for (final component in invalid) {
        final errors = validator.validateComponent(component);
        expect(errors, isNotEmpty, reason: '$component');
        expect(
          errors!.map((error) => error.error.name),
          isNot(contains('refResolutionError')),
          reason: '$component',
        );
      }
    },
  );

  test('validates Homeward components with their own schemas', () {
    for (final component in homewardComponents) {
      for (final example in component.examples) {
        for (final entry in example.components) {
          expect(validator.validateComponent(entry), isEmpty, reason: '$entry');
        }
      }
    }
    expect(
      validator.validateComponent({
        'id': 'root',
        'component': 'AmountSlider',
        'label': 'Down payment',
        'value': 450000,
        'bounds': {'path': '/derived/downPaymentBounds'},
        'currency': {'path': '/market/currency'},
      }),
      isNotEmpty,
    );
  });

  test('knows nothing about components outside the catalog', () {
    expect(
      validator.validateComponent({'id': 'x', 'component': 'Slider'}),
      isNull,
    );
  });
}
