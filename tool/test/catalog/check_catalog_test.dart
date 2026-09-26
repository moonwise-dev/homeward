import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/catalog/catalog_outputs.dart';
import 'package:homeward_tool/catalog/check_catalog.dart';
import 'package:homeward_tool/catalog/finding.dart';
import 'package:homeward_tool/catalog/render_catalog_skill.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

void main() {
  List<String> messages(List<Finding> found) => [
    for (final finding in found) '${finding.subject}: ${finding.message}',
  ];

  test('every component example passes server validation', () {
    expect(messages(checkCatalogExamples()), isEmpty);
  });

  test('every declared component has an app catalog item', () {
    expect(
      messages(checkAppCatalogItems(Directory('../app/lib/catalog'))),
      isEmpty,
    );
  });

  test('app items and declarations that do not pair up are reported', () {
    final items = Directory.systemTemp.createTempSync('catalog_items');
    addTearDown(() => items.deleteSync(recursive: true));
    File('${items.path}/map_item.dart').writeAsStringSync(
      'final mapItem = catalogItemFor(const LifeMap(), build);',
    );
    File('${items.path}/home_item.dart').writeAsStringSync(
      'final homeItem = catalogItemFor(\n  const HomeCard(),\n  build,\n);',
    );

    expect(
      messages(
        checkAppCatalogItems(
          items,
          components: [_Declared('LifeMap'), _Declared('NeedCard')],
        ),
      ),
      [
        'HomeCard: App catalog item without a declaration in common',
        'NeedCard: Declared in common without an app catalog item',
      ],
    );
  });

  test('outputs that differ from the generated text are stale', () {
    final root = Directory.systemTemp.createTempSync('catalog_check');
    addTearDown(() => root.deleteSync(recursive: true));
    for (final MapEntry(key: path, value: content)
        in catalogOutputs().entries) {
      File('${root.path}/$path')
        ..parent.createSync(recursive: true)
        ..writeAsStringSync(content);
    }
    final source = Directory('../app/lib/catalog');
    for (final item in source.listSync(recursive: true).whereType<File>()) {
      final copy = File(
        '${root.path}/app/lib/catalog/${item.path.substring(source.path.length + 1)}',
      )..parent.createSync(recursive: true);
      item.copySync(copy.path);
    }
    File('${root.path}/$catalogSkillPath').writeAsStringSync('edited');

    expect(messages(checkCatalog(root)), [
      '$catalogSkillPath: Stale; run make catalog',
    ]);
  });

  test('the skill carries the exact catalog schema and every example', () {
    final skill = renderCatalogSkill();
    final schema = RegExp(
      r'## Catalog Schema\n\n.*?\n\n```json\n(.*?)\n```',
      dotAll: true,
    ).firstMatch(skill)!.group(1)!;
    final commonTypesId =
        (jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>)[r'$id']!
            as String;

    expect(
      jsonDecode(schema.replaceAll('common_types.json', commonTypesId)),
      homewardCatalogDocument(),
    );
    for (final component in homewardComponents) {
      for (final example in component.examples) {
        expect(skill, contains('### ${component.name}: ${example.name}'));
      }
    }
    expect(skill, contains('t2-week'));
    expect(skill, isNot(contains(commonTypesId)));
  });
}

final class _Declared extends Fake implements CatalogComponent {
  _Declared(this.name);

  @override
  final String name;
}
