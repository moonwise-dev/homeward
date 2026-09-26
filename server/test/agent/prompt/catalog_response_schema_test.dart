import 'package:common/common.dart';
import 'package:homeward_server/agent/prompt/catalog_response_schema.dart';
import 'package:test/test.dart';

void main() {
  final schema = catalogResponseSchema({
    ...coreComponents,
    'TextField',
    'FitMatrix',
  });
  final defs = schema[r'$defs']! as Map<String, Object?>;

  Iterable<(String, Object?)> entries(Object? json) sync* {
    switch (json) {
      case final Map<String, Object?> map:
        for (final MapEntry(:key, :value) in map.entries) {
          yield (key, value);
          yield* entries(value);
        }
      case final List<Object?> list:
        for (final item in list) {
          yield* entries(item);
        }
    }
  }

  test('offers the components asked for that the catalog has', () {
    expect(
      [
        for (final option
            in (defs['anyComponent']! as Map)['oneOf'] as List<Object?>)
          (option! as Map)[r'$ref'],
      ],
      [
        for (final name in [
          'Text',
          'Row',
          'Column',
          'Card',
          'Divider',
          'Button',
          'TextField',
          'Fact',
          'Choice',
        ])
          '#/\$defs/component_$name',
      ],
    );
    expect(defs, isNot(contains('component_FitMatrix')));
  });

  test('says every fixed value as an enum, which Gemini enforces', () {
    expect(entries(schema).where((entry) => entry.$1 == 'const'), isEmpty);
    expect(
      (defs['component_TextField']! as Map)['properties'],
      containsPair('component', {
        'type': 'string',
        'enum': ['TextField'],
      }),
    );
  });

  test('flattens each component into one object Gemini can follow', () {
    final textField = defs['component_TextField']! as Map<String, Object?>;

    expect(textField, isNot(contains('allOf')));
    expect(
      (textField['properties']! as Map).keys,
      containsAll(['id', 'component', 'label', 'value']),
    );
    expect(
      (textField['properties']! as Map).keys,
      isNot(anyOf(contains('accessibility'), contains('checks'))),
    );
    expect(textField['required'], containsAll(['id', 'component', 'label']));
  });

  test('keeps only references Gemini accepts, all of them local', () {
    for (final (key, value) in entries(schema)) {
      if (key == r'$ref') {
        expect(defs, contains((value! as String).split('/').last));
      }
      if (key == 'additionalProperties') {
        expect(value, isNot(isA<Map<String, Object?>>()));
      }
    }
    expect(defs, isNot(contains('anyFunction')));
    expect(
      entries(defs['FunctionCall']).map((entry) => entry.$1),
      isNot(contains(r'$ref')),
    );
  });
}
