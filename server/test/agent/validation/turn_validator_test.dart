import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';
import 'package:homeward_server/agent/validation/turn_validator.dart';
import 'package:homeward_server/agent/validation/validation_outcome.dart';
import 'package:test/test.dart';

void main() {
  final catalog = CatalogValidator(homewardCatalogDocument());

  TurnValidator validatorForTurn(int turn) {
    final shadow =
        MessageProcessor<ComponentApi>(
          catalogs: [Catalog(id: homewardCatalogId, components: const [])],
        )..processMessages([
          CreateSurfaceMessage(
            surfaceId: 't0-earlier',
            catalogId: homewardCatalogId,
          ),
        ]);
    return TurnValidator(
      turn: turn,
      catalog: catalog,
      shadow: shadow,
      seeds: stockholmDataModel,
    );
  }

  String create(String surfaceId, {String catalogId = homewardCatalogId}) =>
      jsonEncode({
        'version': 'v0.9',
        'createSurface': {
          'surfaceId': surfaceId,
          'catalogId': catalogId,
          'sendDataModel': true,
        },
      });

  String update(String surfaceId, List<Map<String, Object?>> components) =>
      jsonEncode({
        'version': 'v0.9',
        'updateComponents': {'surfaceId': surfaceId, 'components': components},
      });

  final slider = {
    'id': 'slider',
    'component': 'AmountSlider',
    'label': 'Down payment',
    'value': {'path': '/scenario/downPayment'},
    'bounds': {'path': '/derived/downPaymentBounds'},
    'shareOf': {'path': '/scenario/price'},
    'currency': {'path': '/market/currency'},
  };
  final validTree = <Map<String, Object?>>[
    {
      'id': 'root',
      'component': 'Column',
      'children': ['summary', 'slider', 'commit'],
    },
    {
      'id': 'summary',
      'component': 'AffordabilitySummary',
      'scenario': {'path': '/scenario'},
      'market': {'path': '/market'},
      'profile': {'path': '/profile'},
    },
    slider,
    {
      'id': 'commit',
      'component': 'Button',
      'child': 'commit_label',
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
    {'id': 'commit_label', 'component': 'Text', 'text': 'Use this scenario'},
  ];

  String rejection(TurnValidator validator, String line) =>
      switch (validator.validate(line)) {
        Rejected(:final failure) => '${failure.path} ${failure.message}',
        Accepted() => 'accepted',
        Unchanged() => 'unchanged',
      };

  test('accepts a surface and its component tree', () {
    final validator = validatorForTurn(3);

    expect(validator.validate(create('t3-budget')), isA<Accepted>());
    expect(validator.validate(update('t3-budget', validTree)), isA<Accepted>());
    expect(validator.surfacesCreated, {'t3-budget'});
    expect(
      validator.shadow.groupModel
          .getSurface('t3-budget')
          ?.componentsModel
          .get('slider'),
      isNotNull,
    );
  });

  test('rejections are A2UI VALIDATION_FAILED errors', () {
    final outcome = validatorForTurn(1).validate(create('board')) as Rejected;

    expect(outcome.failure.toJson(), {
      'version': 'v0.9',
      'error': {
        'code': 'VALIDATION_FAILED',
        'surfaceId': 'board',
        'path': '/createSurface/surfaceId',
        'message': 'The board is compiled by the server',
      },
    });
  });

  final cases = <(String, List<String> Function(), String)>[
    ('parse: not JSON', () => ['{"version":'], 'Not valid JSON'),
    ('parse: not an object', () => ['[1,2]'], 'one JSON object'),
    (
      'envelope: wrong version',
      () => [
        '{"version":"v0.8","createSurface":{"surfaceId":"t1-a","catalogId":"x"}}',
      ],
      "version 'v0.9'",
    ),
    (
      'envelope: two message types',
      () => ['{"version":"v0.9","createSurface":{},"deleteSurface":{}}'],
      'exactly one',
    ),
    (
      'envelope: wrong field type',
      () => [
        '{"version":"v0.9","createSurface":{"surfaceId":7,"catalogId":"x"}}',
      ],
      'wrong type',
    ),
    (
      'ownership: another turn',
      () => [create('t2-budget')],
      'look like t1-budget',
    ),
    (
      'ownership: data model writes',
      () => [
        '{"version":"v0.9","updateDataModel":{"surfaceId":"t1-a","path":"/x","value":1}}',
      ],
      'bind components to paths',
    ),
    (
      'ownership: deleting',
      () => ['{"version":"v0.9","deleteSurface":{"surfaceId":"t1-a"}}'],
      'cannot be deleted',
    ),
    (
      'ownership: another catalog',
      () => [
        create(
          't1-a',
          catalogId:
              'https://a2ui.org/specification/v0_9/catalogs/basic/catalog.json',
        ),
      ],
      'Use catalogId',
    ),
    (
      'ownership: a third surface',
      () => [create('t1-a'), create('t1-b'), create('t1-c')],
      'at most 2 surfaces',
    ),
    (
      'ownership: an earlier surface',
      () => [update('t0-earlier', validTree)],
      'look like t1-budget',
    ),
    (
      'ownership: components before the surface',
      () => [update('t1-a', validTree)],
      'before adding components',
    ),
    (
      'allow-list: Slider',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'root', 'component': 'Slider', 'value': 1},
        ]),
      ],
      'Slider is not in the catalog',
    ),
    (
      'schema: misspelled property',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'root', 'component': 'Text', 'label': 'Hi'},
        ]),
      ],
      '/updateComponents/components/0',
    ),
    (
      'bound numbers: literal amount',
      () => [
        create('t1-a'),
        update('t1-a', [
          {...slider, 'id': 'root', 'value': 450000},
        ]),
      ],
      'AmountSlider',
    ),
    (
      'structure: no root',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'title', 'component': 'Text', 'text': 'Hi'},
        ]),
      ],
      'id "root"',
    ),
    (
      'structure: missing child',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'root', 'component': 'Card', 'child': 'body'},
        ]),
      ],
      'missing component body',
    ),
    (
      'structure: cycle',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'root', 'component': 'Card', 'child': 'inner'},
          {'id': 'inner', 'component': 'Card', 'child': 'root'},
        ]),
      ],
      'cycle',
    ),
    (
      'structure: orphan',
      () => [
        create('t1-a'),
        update('t1-a', [
          {'id': 'root', 'component': 'Text', 'text': 'Hi'},
          {'id': 'stray', 'component': 'Text', 'text': 'Lost'},
        ]),
      ],
      'not reachable from root: stray',
    ),
    (
      'paths: unknown slice',
      () => [
        create('t1-a'),
        update('t1-a', [
          {
            ...slider,
            'id': 'root',
            'bounds': {'path': '/derived/nothing/min'},
          },
        ]),
      ],
      '/derived/nothing/min is not in the data model',
    ),
    (
      'actions: unknown name',
      () => [
        create('t1-a'),
        update('t1-a', [
          {
            'id': 'root',
            'component': 'Button',
            'child': 'label',
            'action': {
              'event': {'name': 'buy_now'},
            },
          },
          {'id': 'label', 'component': 'Text', 'text': 'Buy'},
        ]),
      ],
      'Unknown action buy_now',
    ),
  ];

  for (final (name, lines, expected) in cases) {
    test('rejects $name', () {
      final validator = validatorForTurn(1);
      final all = lines();
      for (final line in all.take(all.length - 1)) {
        expect(validator.validate(line), isA<Accepted>(), reason: line);
      }
      expect(rejection(validator, all.last), contains(expected));
    });
  }

  test('an input may bind to a profile field not yet answered', () {
    final validator = validatorForTurn(1)..validate(create('t1-a'));

    expect(
      validator.validate(
        update('t1-a', [
          {
            'id': 'root',
            'component': 'MoneyInput',
            'label': 'Other monthly loans',
            'value': {'path': '/profile/otherLoans'},
            'currency': 'SEK',
          },
        ]),
      ),
      isA<Accepted>(),
    );
  });

  test('a repeated createSurface in the same turn changes nothing', () {
    final validator = validatorForTurn(1);

    expect(validator.validate(create('t1-a')), isA<Accepted>());
    expect(validator.validate(update('t1-a', validTree)), isA<Accepted>());
    expect(validator.validate(create('t1-a')), isA<Unchanged>());
    expect(validator.validate(update('t1-a', validTree)), isA<Accepted>());
  });

  group('a form sending commit_profile', () {
    List<Map<String, Object?>> form(List<Map<String, Object?>> inputs) => [
      {
        'id': 'root',
        'component': 'Column',
        'children': [for (final input in inputs) input['id'], 'save'],
      },
      ...inputs,
      {
        'id': 'save',
        'component': 'Button',
        'child': 'save_label',
        'action': {
          'event': {
            'name': 'commit_profile',
            'context': {'profilePath': '/profile'},
          },
        },
      },
      {'id': 'save_label', 'component': 'Text', 'text': 'Save'},
    ];
    const income = {
      'id': 'income',
      'component': 'MoneyInput',
      'label': 'Net income',
      'value': {'path': '/profile/netMonthlyIncome'},
      'currency': {'path': '/market/currency'},
    };
    const household = {
      'id': 'household',
      'component': 'HouseholdInput',
      'label': 'Who lives in the home?',
      'adults': {'path': '/profile/adults'},
      'childAges': {'path': '/profile/childAges'},
    };

    TurnValidator validatorNeeding(Set<String> paths) => validatorForTurn(1)
      ..requiredProfilePaths = paths
      ..validate(create('t1-profile'));

    List<Map<String, dynamic>> accepted(
      TurnValidator validator,
      String source,
    ) =>
        ((validator.validate(source) as Accepted).message
                as UpdateComponentsMessage)
            .components;

    test('asks for the paths the form left out', () {
      final components = accepted(
        validatorNeeding({
          '/profile/netMonthlyIncome',
          '/profile/adults',
          '/profile/childAges',
          '/profile/employment',
        }),
        update('t1-profile', form([income])),
      );

      expect(
        components.map((component) => component['id']),
        containsAll(['asked-employment', 'asked-household']),
      );
      expect(
        components.lastWhere(
          (component) => component['id'] == 'root',
        )['children'],
        ['income', 'asked-employment', 'asked-household', 'save'],
      );
      expect(
        components.firstWhere(
          (component) => component['id'] == 'asked-employment',
        ),
        containsPair('options', [
          {'label': 'Employed', 'value': 'employed'},
          {'label': 'Self-employed', 'value': 'selfEmployed'},
          {'label': 'Retired', 'value': 'retired'},
        ]),
      );
    });

    test('leaves a form that asks for everything alone', () {
      final components = accepted(
        validatorNeeding({
          '/profile/netMonthlyIncome',
          '/profile/adults',
          '/profile/childAges',
        }),
        update('t1-profile', form([income, household])),
      );

      expect(
        components.map((component) => component['id']),
        ['root', 'income', 'household', 'save', 'save_label'],
      );
    });

    test('says so when there is nowhere to put the input', () {
      final validator = validatorNeeding({'/profile/employment'});

      expect(
        rejection(
          validator,
          update('t1-profile', [
            {
              'id': 'root',
              'component': 'Button',
              'child': 'save_label',
              'action': {
                'event': {
                  'name': 'commit_profile',
                  'context': {'profilePath': '/profile'},
                },
              },
            },
            {'id': 'save_label', 'component': 'Text', 'text': 'Save'},
          ]),
        ),
        '/updateComponents/components A form sending commit_profile needs '
        'inputs bound to /profile/employment',
      );
    });

    test('is not checked on surfaces without the action', () {
      expect(
        validatorNeeding({'/profile/adults'}).validate(
          update('t1-profile', validTree),
        ),
        isA<Accepted>(),
      );
    });
  });
}
