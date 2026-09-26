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
      seeds: const {
        'home': {'name': 'Flat on Odengatan', 'rooms': 3},
      },
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

  test('accepts a surface and its component tree', () {
    final validator = validatorForTurn(3);

    expect(validator.validate(create('t3-budget')), isA<Accepted>());
    expect(validator.validate(update('t3-budget', validTree)), isA<Accepted>());
    expect(validator.surfacesCreated, {'t3-budget'});
    expect(
      validator.shadow.groupModel
          .getSurface('t3-budget')
          ?.componentsModel
          .get('keep'),
      isNotNull,
    );
  });

  test('rejections are A2UI VALIDATION_FAILED errors', () {
    final outcome = validatorForTurn(1).validate(create('plan')) as Rejected;

    expect(outcome.failure.toJson(), {
      'version': 'v0.9',
      'error': {
        'code': 'VALIDATION_FAILED',
        'surfaceId': 'plan',
        'path': '/createSurface/surfaceId',
        'message':
            'Surface id "plan" does not fit turn 1: surface ids in turn 1 '
            'look like t1-clue, lowercase letters and digits joined by hyphens',
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
      'look like t1-clue',
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
      'look like t1-clue',
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
      final validator = validatorForTurn(1);
      final all = lines();
      for (final line in all.take(all.length - 1)) {
        expect(validator.validate(line), isA<Accepted>(), reason: line);
      }
      expect(rejection(validator, all.last), contains(expected));
    });
  }

  test('an input may bind to a field not yet written', () {
    final validator = validatorForTurn(1)..validate(create('t1-a'));

    expect(
      validator.validate(
        update('t1-a', [
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
    final validator = validatorForTurn(1)..validate(create('t1-a'));

    expect(
      validator.validate(
        update('t1-a', [
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
    final validator = validatorForTurn(1);

    expect(validator.validate(create('t1-a')), isA<Accepted>());
    expect(validator.validate(update('t1-a', validTree)), isA<Accepted>());
    expect(validator.validate(create('t1-a')), isA<Unchanged>());
    expect(validator.validate(update('t1-a', validTree)), isA<Accepted>());
  });
}
