import 'dart:convert';

import 'package:a2ui_core/a2ui_core.dart';
import 'package:common/common.dart';
import 'package:homeward_server/agent/validation/turn_validator.dart';
import 'package:homeward_server/agent/validation/validation_outcome.dart';
import 'package:test/test.dart';

void main() {
  final catalog = CatalogValidator(homewardCatalogDocument());

  TurnValidator validatorAfter(List<Map<String, Object?>> earlier) =>
      TurnValidator(
        turn: 1,
        catalog: catalog,
        shadow:
            MessageProcessor<ComponentApi>(
              catalogs: [Catalog(id: homewardCatalogId, components: const [])],
            )..processMessages([
              for (final json in earlier) A2uiMessage.fromJson(json),
            ]),
        seeds: const {
          'home': {'name': 'Flat on Odengatan', 'rooms': 3},
        },
      );

  TurnValidator firstTurn() => validatorAfter(const []);

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

  final validTree = <Map<String, Object?>>[
    {
      'id': 'root',
      'component': 'Column',
      'children': ['name', 'keep'],
    },
    {
      'id': 'name',
      'component': 'Text',
      'text': {'path': '/home/name'},
    },
    {
      'id': 'keep',
      'component': 'Button',
      'child': 'keep_label',
      'action': {
        'event': {
          'name': 'keep_home',
          'context': {'homeId': 'h1'},
        },
      },
    },
    {'id': 'keep_label', 'component': 'Text', 'text': 'Keep this one'},
  ];

  String rejection(TurnValidator validator, String line) =>
      switch (validator.validate(line)) {
        Rejected(:final failure) => '${failure.path} ${failure.message}',
        Accepted() => 'accepted',
        Unchanged() => 'unchanged',
      };

  test('accepts the screen and its component tree', () {
    final validator = firstTurn();

    expect(validator.validate(create('plan')), isA<Accepted>());
    expect(validator.validate(update('plan', validTree)), isA<Accepted>());
    expect(validator.drewThisTurn, isTrue);
    expect(validator.screen, hasLength(validTree.length));
  });

  test('rejections are A2UI VALIDATION_FAILED errors', () {
    final outcome = firstTurn().validate(create('sidebar')) as Rejected;

    expect(outcome.failure.toJson(), {
      'version': 'v0.9',
      'error': {
        'code': 'VALIDATION_FAILED',
        'surfaceId': 'sidebar',
        'path': '/createSurface/surfaceId',
        'message':
            'Surface id "sidebar" is neither the plan panel, "plan", nor an '
            'inline ask of turn 1, such as "t1-budget"',
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
      'ownership: another surface',
      () => [create('sidebar')],
      'neither the plan panel',
    ),
    (
      'ownership: data model writes',
      () => [
        '{"version":"v0.9","updateDataModel":{"surfaceId":"plan","path":"/x","value":1}}',
      ],
      'bind components to paths',
    ),
    (
      'ownership: deleting',
      () => ['{"version":"v0.9","deleteSurface":{"surfaceId":"plan"}}'],
      'cannot be deleted',
    ),
    (
      'ownership: another catalog',
      () => [
        create(
          'plan',
          catalogId:
              'https://a2ui.org/specification/v0_9/catalogs/basic/catalog.json',
        ),
      ],
      'Use catalogId',
    ),
    (
      'allow-list: Slider',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'root', 'component': 'Slider', 'value': 1},
        ]),
      ],
      'Slider is not in the catalog',
    ),
    (
      'schema: misspelled property',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'root', 'component': 'Text', 'label': 'Hi'},
        ]),
      ],
      '/updateComponents/components/0',
    ),
    (
      'structure: no root',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'title', 'component': 'Text', 'text': 'Hi'},
        ]),
      ],
      'id "root"',
    ),
    (
      'structure: missing child',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'root', 'component': 'Card', 'child': 'body'},
        ]),
      ],
      'missing component body',
    ),
    (
      'structure: cycle',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'root', 'component': 'Card', 'child': 'inner'},
          {'id': 'inner', 'component': 'Card', 'child': 'root'},
        ]),
      ],
      'cycle',
    ),
    (
      'structure: orphan',
      () => [
        create('plan'),
        update('plan', [
          {'id': 'root', 'component': 'Text', 'text': 'Hi'},
          {'id': 'stray', 'component': 'Text', 'text': 'Lost'},
        ]),
      ],
      'not reachable from root: stray',
    ),
    (
      'paths: unknown slice',
      () => [
        create('plan'),
        update('plan', [
          {
            'id': 'root',
            'component': 'Text',
            'text': {'path': '/lineup/nothing/name'},
          },
        ]),
      ],
      '/lineup/nothing/name is not in the data model',
    ),
  ];

  for (final (name, lines, expected) in cases) {
    test('rejects $name', () {
      final validator = firstTurn();
      final all = lines();
      for (final line in all.take(all.length - 1)) {
        expect(validator.validate(line), isA<Accepted>(), reason: line);
      }
      expect(rejection(validator, all.last), contains(expected));
    });
  }

  test('components for a surface that does not exist create it', () {
    final validator = firstTurn();

    expect(
      validator.validate(update('plan', validTree)),
      isA<Accepted>().having(
        (accepted) => accepted.created?.surfaceId,
        'created',
        'plan',
      ),
    );
  });

  test('an input may bind to a field not yet written', () {
    final validator = firstTurn()..validate(create('plan'));

    expect(
      validator.validate(
        update('plan', [
          {
            'id': 'root',
            'component': 'TextField',
            'label': 'Anything else about the home?',
            'value': {'path': '/home/notes'},
          },
        ]),
      ),
      isA<Accepted>(),
    );
  });

  test('a button may send any action the model names', () {
    final validator = firstTurn()..validate(create('plan'));

    expect(
      validator.validate(
        update('plan', [
          {
            'id': 'root',
            'component': 'Button',
            'child': 'label',
            'action': {
              'event': {'name': 'compare_commutes'},
            },
          },
          {'id': 'label', 'component': 'Text', 'text': 'Compare'},
        ]),
      ),
      isA<Accepted>(),
    );
  });

  test('a repeated createSurface in the same turn changes nothing', () {
    final validator = firstTurn();

    expect(validator.validate(create('plan')), isA<Accepted>());
    expect(validator.validate(update('plan', validTree)), isA<Accepted>());
    expect(validator.validate(create('plan')), isA<Unchanged>());
    expect(validator.validate(update('plan', validTree)), isA<Accepted>());
  });

  final earlierScreen = [
    jsonDecode(create('plan')) as Map<String, Object?>,
    {
      'version': 'v0.9',
      'updateDataModel': {
        'surfaceId': 'plan',
        'path': '/week',
        'value': {'office': 'KTH', 'days': 3},
      },
    },
    jsonDecode(
      update('plan', [
        {
          'id': 'root',
          'component': 'Column',
          'children': ['office', 'note'],
        },
        {
          'id': 'office',
          'component': 'Text',
          'text': {'path': '/week/office'},
        },
        {'id': 'note', 'component': 'Text', 'text': 'Tell me more'},
      ]),
    ) as Map<String, Object?>,
  ];

  test('a later turn changes the screen in place', () {
    final validator = validatorAfter(earlierScreen);

    expect(validator.validate(create('plan')), isA<Unchanged>());
    expect(
      validator.validate(
        update('plan', [
          {'id': 'note', 'component': 'Text', 'text': 'Which office days?'},
        ]),
      ),
      isA<Accepted>(),
    );
    expect(validator.screen, hasLength(3));
  });

  test('what an earlier turn left unreachable is not an orphan', () {
    expect(
      validatorAfter(earlierScreen).validate(
        update('plan', [
          {
            'id': 'root',
            'component': 'Column',
            'children': ['office'],
          },
        ]),
      ),
      isA<Accepted>(),
    );
  });

  test('a component sent this turn must be reachable from root', () {
    expect(
      rejection(
        validatorAfter(earlierScreen),
        update('plan', [
          {'id': 'stray', 'component': 'Text', 'text': 'Lost'},
        ]),
      ),
      contains('not reachable from root: stray'),
    );
  });

  test('bindings resolve in the data model earlier turns seeded', () {
    expect(
      validatorAfter(earlierScreen).validate(
        update('plan', [
          {
            'id': 'note',
            'component': 'Text',
            'text': {'path': '/week/days'},
          },
        ]),
      ),
      isA<Accepted>(),
    );
  });
}
