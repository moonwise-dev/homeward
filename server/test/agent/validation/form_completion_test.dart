import 'package:common/common.dart';
import 'package:homeward_server/agent/validation/form_completion.dart';
import 'package:test/test.dart';

void main() {
  final catalog = CatalogValidator(homewardCatalogDocument());

  Map<String, Map<String, Object?>> formMissing(Set<String> paths) => {
    'root': {
      'id': 'root',
      'component': 'Column',
      'children': ['save'],
    },
    'save': {
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
    'save_label': {'id': 'save_label', 'component': 'Text', 'text': 'Save'},
  };

  test('every input it can add is in the catalog and valid', () {
    for (final field in profileSlice.fields) {
      final added = completingComponents(
        components: formMissing({profileSlice.pathOf(field.name)}),
        requiredPaths: {profileSlice.pathOf(field.name)},
      );

      expect(
        added,
        isNotEmpty,
        reason: 'no input for ${field.name}',
      );
      for (final component in added) {
        if (component['id'] == 'root') {
          continue;
        }
        expect(
          catalog.componentNames,
          contains(component['component']),
          reason: '${field.name} uses a component outside the catalog',
        );
        expect(
          catalog.validateComponent(component),
          anyOf(isNull, isEmpty),
          reason: '${field.name} builds an invalid component',
        );
      }
    }
  });

  test('it asks in the order the slice declares, above the button', () {
    final added = completingComponents(
      components: formMissing(const {}),
      requiredPaths: {
        profileSlice.pathOf('savings'),
        profileSlice.pathOf('citizenship'),
      },
    );

    expect(
      added.map((component) => component['id']),
      ['asked-citizenship', 'asked-savings', 'root'],
    );
    expect(added.last['children'], [
      'asked-citizenship',
      'asked-savings',
      'save',
    ]);
  });

  test('a surface with no commit_profile button is left alone', () {
    expect(
      completingComponents(
        components: {
          'root': {'id': 'root', 'component': 'Text', 'text': 'Hello'},
        },
        requiredPaths: {profileSlice.pathOf('savings')},
      ),
      isEmpty,
    );
  });
}
