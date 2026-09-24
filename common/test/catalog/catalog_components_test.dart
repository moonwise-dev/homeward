import 'dart:convert';

import 'package:common/common.dart';
import 'package:json_schema_builder/json_schema_builder.dart';
import 'package:test/test.dart';

void main() {
  test('the catalog declares its components once under its id', () {
    expect(homewardCatalog.id, homewardCatalogId);
    expect(homewardCatalog.components.keys, [
      'LifestyleCommuteMap',
      'ComparisonTable',
      'DynamicRecommendationStack',
      'LocationPicker',
      'MoneyInput',
      'HouseholdInput',
      'AmountSlider',
      'MarketSnapshotCard',
      'AffordabilitySummary',
      'PaymentBreakdown',
      'PurchaseCostsTable',
      'StressTestChart',
      'EligibilityChecklist',
      'ForeignBuyerObstacles',
    ]);
  });

  for (final component in homewardComponents) {
    group(component.name, () {
      final schema = component.schema;

      test('has examples', () {
        expect(component.examples, isNotEmpty);
      });

      for (final example in component.examples) {
        test('example "${example.name}" validates', () {
          final entries = example.components;
          expect(entries.where((entry) => entry['id'] == 'root'), hasLength(1));
          for (final entry in entries) {
            if (entry['component'] == component.name) {
              expect(schema.validateSync(entry), isEmpty, reason: '$entry');
            }
          }
        });

        test('example "${example.name}" binds to paths in its data model', () {
          for (final path in _boundPaths(example.components)) {
            expect(
              _resolve(example.dataModel, path),
              isNotNull,
              reason: path,
            );
          }
        });
      }

      Map<String, Object?> root() =>
          jsonDecode(jsonEncode(component.examples.first.components.first))
              as Map<String, Object?>;

      for (final property in component.boundProperties) {
        test('refuses a literal for $property', () {
          expect(
            schema.validateSync({...root(), property: 450000}),
            isNotEmpty,
          );
          expect(
            schema.validateSync({
              ...root(),
              property: {'minorUnits': 450000, 'currency': 'SEK'},
            }),
            isNotEmpty,
          );
        });
      }

      test('refuses unknown and missing properties', () {
        expect(schema.validateSync({...root(), 'colour': 'red'}), isNotEmpty);
        for (final property in component.requiredProperties) {
          expect(
            schema.validateSync(Map.of(root())..remove(property)),
            isNotEmpty,
            reason: property,
          );
        }
      });
    });
  }

  test('slice references accept only their own path', () {
    final schema = const AffordabilitySummary().schema;
    final root = const AffordabilitySummary().examples.first.components.first;

    expect(
      schema.validateSync({
        ...root,
        'scenario': {'path': '/profile'},
      }),
      isNotEmpty,
    );
  });
}

Iterable<String> _boundPaths(Object? json) sync* {
  if (json case {'path': final String path} when json.length == 1) {
    yield path;
  } else if (json is Map<String, Object?>) {
    for (final value in json.values) {
      yield* _boundPaths(value);
    }
  } else if (json is List<Object?>) {
    for (final value in json) {
      yield* _boundPaths(value);
    }
  }
}

Object? _resolve(Map<String, Object?> dataModel, String path) {
  Object? current = dataModel;
  for (final segment in path.split('/').skip(1)) {
    if (current is! Map<String, Object?>) {
      return null;
    }
    current = current[segment];
  }
  return current;
}
