import 'dart:convert';

import 'package:json_schema_builder/json_schema_builder.dart';

import 'generated/a2ui_v09_schemas.dart';

final class CatalogValidator {
  CatalogValidator._(this._components, this._registry);

  factory CatalogValidator(Map<String, Object?> catalogDocument) {
    final commonTypes = jsonDecode(a2uiCommonTypesJson) as Map<String, Object?>;
    final commonTypesUri = Uri.parse(commonTypes[r'$id']! as String);
    final catalogUri = Uri.parse(catalogDocument[r'$id']! as String);
    final registry = SchemaRegistry()
      ..addSchema(commonTypesUri, Schema.fromMap(commonTypes))
      ..addSchema(catalogUri, Schema.fromMap(catalogDocument))
      ..addSchema(
        commonTypesUri.resolve('catalog.json'),
        Schema.fromMap({...catalogDocument}..remove(r'$id')),
      );
    return CatalogValidator._({
      for (final name
          in (catalogDocument['components']! as Map<String, Object?>).keys)
        name: (
          schema: Schema.fromMap({r'$ref': '$catalogUri#/components/$name'}),
          sourceUri: catalogUri.resolve('validation/$name.json'),
        ),
    }, registry);
  }

  final Map<String, ({Schema schema, Uri sourceUri})> _components;
  final SchemaRegistry _registry;

  Set<String> get componentNames => _components.keys.toSet();

  List<ValidationError>? validateComponent(Map<String, Object?> component) {
    final entry = _components[component['component']];
    return entry?.schema.validateSync(
      component,
      sourceUri: entry.sourceUri,
      schemaRegistry: _registry,
    );
  }
}
