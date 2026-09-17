import 'dart:convert';
import 'dart:io';

import 'package:common/common.dart';
import 'package:homeward_tool/catalog/catalog_outputs.dart';
import 'package:homeward_tool/catalog/check_catalog.dart';
import 'package:homeward_tool/catalog/render_catalog_skill.dart';
import 'package:homeward_server/markets/finding.dart';
import 'package:test/test.dart';

void main() {
  List<String> messages(List<Finding> found) => [
    for (final finding in found) '${finding.subject}: ${finding.message}',
  ];

  test('every component and surface example passes server validation', () {
    expect(messages(checkCatalogExamples()), isEmpty);
  });

  test('an example with a literal amount or an unknown path is reported', () {
    final broken = CatalogExample(
      name: 'Broken form',
      componentsJson: '''
[
  { "id": "root", "component": "Column", "children": ["price", "fee"] },
  { "id": "price", "component": "MoneyInput", "label": "Price", "value": 4500000, "currency": "SEK" },
  { "id": "fee", "component": "MoneyInput", "label": "Fee", "value": { "path": "/scenario/fees/monthly" }, "currency": "SEK" }
]
''',
      dataModel: stockholmDataModel,
    );

    expect(messages(checkCatalogExamples(components: [], surfaces: [broken])), [
      startsWith('Surface: Broken form: /updateComponents/components/1'),
    ]);
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
    expect(skill, contains('t2-profile-form'));
    expect(skill, isNot(contains(commonTypesId)));
  });
}
